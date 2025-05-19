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
from experiments_Autogen.accuracy import Accuracy
from AgentInit.utils.globals import Cost, PromptTokens, CompletionTokens
import re
from tqdm import tqdm
import asyncio
import time
import copy
from tenacity import retry, wait_random_exponential, stop_after_attempt, wait_fixed
from experiments_Autogen.Autogen import run_team_chat
from experiments_Autogen.agentinit.manager import Manager
async def evaluate(
        dataset,
        limit_questions: Optional[int] = None,
        eval_batch_size: int = 4,
        args=None,
        ) -> float:
    
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

    current_time = Time.instance().value or time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())
    result_dir = Path(f"{AgentInit_ROOT}/result/mmlu")
    result_dir.mkdir(parents=True, exist_ok=True)


    @retry(wait=wait_fixed(10), stop=stop_after_attempt(5))
    async def process_record(record, llm_name, mode):
        input_dict = dataset.record_to_input(record)
        roles = None
        question = input_dict["task"]
                    
        roles_file = f"{AgentInit_ROOT}/cache/{llm_name.split('/')[0]}_mmlu.jsonl"
        question = input_dict["task"]
        manager = Manager(llm_name=llm_name)
        roles = await manager._act(question)
        response = await run_team_chat(question, llm_name, roles,args.domain)
        return response


    for i_batch, record_batch in tqdm(enumerate(eval_loader(batch_size=eval_batch_size)), total=num_batches):
        print(80*'-')
        # if i_batch < 100:
            # continue
        start_ts = time.time()
        answer_log_probs = []
        
        for record in record_batch:
            answer_log_probs.append(asyncio.create_task(process_record(record,args.llm_name,args.mode)))
        raw_answers = await asyncio.gather(*answer_log_probs)
        
        print(f"Batch time {time.time() - start_ts:.3f}")
        for raw_answer, record in zip(raw_answers, record_batch):
            answer = dataset.postprocess_answer(raw_answer)
            # print("Postprocessed answer:", answer)
            correct_answer = dataset.record_to_target_answer(record)
            # print("Correct answer:", correct_answer)
            accuracy.update(answer, correct_answer)
            accuracy.print()
            updated_item = {
                "Question": dataset.record_to_input(record)['task'],
                "Answer": correct_answer,
                "Response": raw_answer,
            }
            print(updated_item) 
        print(f"Cost {Cost.instance().value}")
        print(f"PromptTokens {PromptTokens.instance().value}")
        print(f"CompletionTokens {CompletionTokens.instance().value}")
    accuracy.print()
    print("Done!")

    return accuracy.get()