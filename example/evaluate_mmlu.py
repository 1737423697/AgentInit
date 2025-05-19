import os
import json
import math
import time
import asyncio
from typing import Union,Literal,Optional,Iterator,List,Any,Dict
from tqdm import tqdm
import copy
import time
from AgentInit.utils.globals import Time
from pathlib import Path
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.stdout.reconfigure(encoding='utf-8')

from AgentInit.utils.const import AgentInit_ROOT
from AgentInit.graph.graph import Graph
from example.accuracy import Accuracy
from AgentInit.utils.globals import Cost, PromptTokens, CompletionTokens
from tqdm import tqdm
import asyncio
import time
import copy
from tenacity import retry, wait_random_exponential, stop_after_attempt, wait_fixed
@retry(wait=wait_fixed(10), stop=stop_after_attempt(3))
async def process_record(record, dataset, graph, args, auto, num_rounds,mode):
    input_dict = dataset.record_to_input(record)
    
    if auto:
        roles_file = f"{AgentInit_ROOT}/example/Qwen_mmlu.jsonl"
        question = input_dict["task"]

        roles = None

        if os.path.exists(roles_file):
            with open(roles_file, "r", encoding="utf-8") as f:
                for line in f:
                    try:
                        entry = json.loads(line)
                        if entry.get("question") == question:
                            roles = entry["roles"]
                            print("Loaded roles for this question from file.")
                            break
                    except json.JSONDecodeError:
                        continue  
        agent_names = args.agent_names * len(roles)
        kwargs = get_kwargs(mode, len(agent_names))
        kwargs["node_kwargs"] = [{'role': key} for key in roles]

        realized_graph = Graph(
            domain=graph.domain,
            llm_name=graph.llm_name,
            agent_names=agent_names,
            decision_method=graph.decision_method,
            optimized_spatial=graph.optimized_spatial,
            optimized_temporal=graph.optimized_temporal,
            rounds=num_rounds,
            diff=graph.diff,
            role_prompt=roles,
            **kwargs
        )
    else:
        realized_graph = copy.deepcopy(graph)
    
    realized_graph.spatial_logits = graph.spatial_logits
    realized_graph.temporal_logits = graph.temporal_logits

    # Run the graph processing asynchronously
    result = await realized_graph.arun(input_dict, num_rounds, case=True)
    return result

async def evaluate(
        graph:Graph,
        dataset,
        num_rounds:int = 1,
        limit_questions: Optional[int] = None,
        eval_batch_size: int = 4,
        dec: bool = False,
        args=None,
        mode:float = 'FullConnected',
        ) -> float:

    print(f"Evaluating AgentInit on {dataset.__class__.__name__} split {dataset.split}")
    
    graph.spatial_logits.requires_grad_ = False
    graph.temporal_logits.requires_grad_ = False
    
    accuracy = Accuracy()
    def eval_loader(batch_size: int) -> Iterator[List[Any]]:
        records = []
        for i_record, record in enumerate(dataset):
            if limit_questions is not None:
                if i_record >= limit_questions:
                    break
            records.append(record)
            if len(records) >= batch_size:
                yield records
                records = []
        if len(records) > 0:
            yield records
        return
    data_len = min(len(dataset), limit_questions) if limit_questions is not None else len(dataset)
    num_batches = int(math.ceil(data_len / eval_batch_size))

    data=[]
    current_time = Time.instance().value or time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())
    result_dir = Path(f"{AgentInit_ROOT}/result/mmlu")
    result_dir.mkdir(parents=True, exist_ok=True)
    result_file = result_dir / f"{args.domain}_llama3_{current_time}.json"

    if 'AutoAgent' in graph.agent_names:
        auto = True
    else:
        auto = False

    for i_batch, record_batch in tqdm(enumerate(eval_loader(batch_size=eval_batch_size)), total=num_batches):
        print(80*'-')

        start_ts = time.time()
        answer_log_probs = []
        
        for record in record_batch:
            # input_dict = dataset.record_to_input(record)
            
            # if auto:
            #     manager = Manager(graph.llm_name)
            #     roles = await manager._act(input_dict["task"])
            #     agent_names = args.agent_names * len(roles)
            #     kwargs = {
            #         "initial_spatial_probability": graph.initial_spatial_probability,
            #         "fixed_spatial_masks": graph.fixed_spatial_masks,
            #         "initial_temporal_probability": graph.initial_temporal_probability,
            #         "fixed_temporal_masks": graph.fixed_temporal_masks,
            #         "node_kwargs": [{'role': key} for key, value in roles.items()]
            #         }   

            #     print(agent_names)
            #     print("kwargs:",kwargs["node_kwargs"])

            #     realized_graph = Graph(domain=graph.domain,
            #       llm_name=graph.llm_name,
            #       agent_names=graph.agent_names,
            #       decision_method=graph.decision_method,
            #       optimized_spatial=graph.optimized_spatial,
            #       optimized_temporal=graph.optimized_temporal,
            #       rounds=num_rounds,
            #       diff=graph.diff,
            #       dec=dec,
            #       role_prompt=roles,
            #       **kwargs)
                  
            # else:
            #     realized_graph = copy.deepcopy(graph)
            # realized_graph.spatial_logits = graph.spatial_logits
            # realized_graph.temporal_logits = graph.temporal_logits
            
            # print(input_dict)
            # if dec:
            #     answer_log_probs.append(asyncio.create_task(realized_graph.arun(input_dict,num_rounds,skip=False)))
            # else:
            answer_log_probs.append(asyncio.create_task(process_record(record, dataset, graph, args, auto, num_rounds, mode)))
        raw_results = await asyncio.gather(*answer_log_probs)
        raw_answers, log_probs, all_answers = zip(*raw_results)
        
        print(f"Batch time {time.time() - start_ts:.3f}")
        for raw_answer, record, all_answer in zip(raw_answers, record_batch, all_answers):
            print("Raw answer:", raw_answer)
            answer = dataset.postprocess_answer(raw_answer)
            print("Postprocessed answer:", answer)
            correct_answer = dataset.record_to_target_answer(record)
            print("Correct answer:", correct_answer)
            accuracy.update(answer, correct_answer)
            accuracy.print()
            updated_item = {
                "Question": dataset.record_to_input(record)['task'],
                "Answer": correct_answer,
                "All_answers": all_answer,
                "Response": raw_answer,
            }
            data.append(updated_item)
        with open(result_file, 'w',encoding='utf-8') as file:
            json.dump(data, file, indent=4)
        print(f"Cost {Cost.instance().value}")
        print(f"PromptTokens {PromptTokens.instance().value}")
        print(f"CompletionTokens {CompletionTokens.instance().value}")
        # if 'deepseek' in args.llm_name:
        #     print('sleep')
        #     time.sleep(60)
    accuracy.print()
    print("Done!")

    return accuracy.get()


def dump_eval_results(self, dct: Dict[str, Any]) -> None:
    if self._art_dir_name is not None:
        eval_json_name = os.path.join(self._art_dir_name, "evaluation.json")
        with open(eval_json_name, "w") as f:
            json.dump(dct, f)
def get_kwargs(mode:Union[Literal['DirectAnswer'],Literal['FullConnected'],Literal['Random'],Literal['Chain'],Literal['Debate'],Literal['Layered'],Literal['Star'],Literal['Mesh'],
                          Literal['FakeFullConnected'],Literal['FakeRandom'],Literal['FakeChain'],Literal['FakeStar'],Literal['FakeMesh'],Literal['FakeAGRandom'],Literal['FakeAGFull']],
               N:int):
    initial_spatial_probability: float = 0.5
    fixed_spatial_masks:List[List[int]] = None
    initial_temporal_probability: float = 0.5
    fixed_temporal_masks:List[List[int]] = None
    node_kwargs = None
    
    def generate_layered_graph(N,layer_num=2):
        adj_matrix = [[0]*N for _ in range(N)]
        base_size = N // layer_num
        remainder = N % layer_num
        layers = []
        for i in range(layer_num):
            size = base_size + (1 if i < remainder else 0)
            layers.extend([i] * size)
        # random.shuffle(layers)
        for i in range(N):
            current_layer = layers[i]
            for j in range(N):
                if layers[j] == current_layer + 1:
                    adj_matrix[i][j] = 1
        return adj_matrix
    
    def generate_mesh_graph(N):
        adj_matrix = [[0] * N for _ in range(N)]
        for i in range(0, N):
            for j in range(i+1,N):
                adj_matrix[i][j] = 1
        return adj_matrix
    
    def generate_star_graph(N):
        adj_matrix = [[0] * N for _ in range(N)]
        for i in range(1,N):
            adj_matrix[0][i] = 1
        return adj_matrix
    
    if mode=='DirectAnswer':
        fixed_spatial_masks = [[0]]
        fixed_temporal_masks = [[0]]
        node_kwargs = [{'role':'Normal'}]
    elif mode=='FullConnected' or mode == 'FakeFullConnected' or mode=='FakeAGFull':
        fixed_spatial_masks = [[1 if i!=j else 0 for i in range(N)] for j in range(N)]
        fixed_temporal_masks = [[1 for _ in range(N)] for _ in range(N)]
    elif mode=='Random' or mode == 'FakeRandom' or mode == 'FakeAGRandom':
        fixed_spatial_masks = [[random.randint(0, 1)  if i!=j else 0 for i in range(N)] for j in range(N)]
        fixed_temporal_masks = [[random.randint(0, 1) for _ in range(N)] for _ in range(N)]
    elif mode=='Chain' or mode == 'FakeChain':
        fixed_spatial_masks = [[1 if i==j+1 else 0 for i in range(N)] for j in range(N)]
        fixed_temporal_masks = [[1 if i==0 and j==N-1 else 0 for i in range(N)] for j in range(N)]
    elif mode == 'Debate':
        fixed_spatial_masks = [[0 for i in range(N)] for j in range(N)]
        fixed_temporal_masks = [[1 for i in range(N)] for j in range(N)]
    elif mode == 'Layered':
        fixed_spatial_masks = generate_layered_graph(N)
        fixed_temporal_masks = [[1 for i in range(N)] for j in range(N)]
    elif mode == 'Mesh' or mode=='FakeMesh':
        fixed_spatial_masks = generate_mesh_graph(N)
        fixed_temporal_masks = [[1 for i in range(N)] for j in range(N)]
    elif mode == 'Star' or mode=='FakeStar':
        fixed_spatial_masks = generate_star_graph(N)
        fixed_temporal_masks = [[1 for i in range(N)] for j in range(N)]
    
    if 'Fake' in mode and 'AG' not in mode:
        node_kwargs = [{'role':'Fake'} if i % 2 == N % 2 else {'role':'Normal'} for i in range(N)]
    elif 'Fake' in mode and 'AG' in mode:
        node_kwargs = [{'role':'Fake'} if i % 2 == N % 2 else {'role':None} for i in range(N)]
        
    return {"initial_spatial_probability": initial_spatial_probability,
            "fixed_spatial_masks": fixed_spatial_masks,
            "initial_temporal_probability": initial_temporal_probability,
            "fixed_temporal_masks": fixed_temporal_masks,
            "node_kwargs":node_kwargs}    