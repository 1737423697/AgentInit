import sys
import os
import argparse
import yaml
import json
import time
import asyncio
from pathlib import Path
import torch
import torch.nn.functional as F
import copy
from typing import List,Union,Literal
import random
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.stdout.reconfigure(encoding='utf-8')
from AgentInit.llm.llm_registry import LLMRegistry
from AgentInit.utils.const import AgentInit_ROOT
from AgentInit.graph.graph import Graph
from AgentInit.tools.reader.readers import JSONReader, JSONLReader
from AgentInit.utils.globals import Time
from AgentInit.utils.globals import Cost, PromptTokens, CompletionTokens
from AgentInit.utils.utils import nuclear_norm,frobenius_norm
from datasets.gsm8k_dataset import svamp_data_process,gsm_get_predict, gsm_data_process,multiarith_data_process
from datasets.aqua_dataset import aqua_data_process,aqua_get_predict
from AgentInit.utils.globals import PromptTokens, CompletionTokens
from AgentInit.agents.agent_registry import AgentRegistry
from tenacity import retry, wait_random_exponential, stop_after_attempt, wait_fixed
from experiments_Autogen.Autogen import run_team_chat
from experiments_Autogen.agentinit.manager import Manager
import re
def load_result(result_file):
    if not result_file.exists():
        with open(result_file, 'w',encoding='utf-8') as file:
            json.dump([], file)

    with open(result_file, 'r',encoding='utf-8') as file:
        data = json.load(file)
    return data

def dataloader(data_list, batch_size, i_batch):
    return data_list[i_batch*batch_size:i_batch*batch_size + batch_size]

def load_config(config_path):
    with open(config_path, 'r',encoding='utf-8') as file:
        return yaml.safe_load(file)
    
def parse_args():
    parser = argparse.ArgumentParser(description="Experiments on gsm8k")
    parser.add_argument("--dataset_json", type=str, default="datasets/gsm8k/gsm8k.jsonl")
    parser.add_argument("--result_file", type=str, default=None)
    parser.add_argument("--llm_name", type=str, default="gpt-3.5-turbo")
    parser.add_argument('--mode', type=str, default=None)
    parser.add_argument('--domain',type=str,default='gsm8k')
    parser.add_argument('--batch_size',type = int, default = 20)
    args = parser.parse_args()
    result_path = AgentInit_ROOT / "result"
    os.makedirs(result_path, exist_ok=True)
    return args
from collections import OrderedDict
async def fetch_roles(question):
    roles = OrderedDict()
    roles.setdefault('Normal', 'You are a helpful assistant.')
    new_roles = await manager._act(question)
    for k, v in new_roles.items():
        roles[k] = v
    return roles

async def main():
    args = parse_args()
    result_file = None
    dataset = JSONLReader.parse_file(args.dataset_json)
    dataset = gsm_data_process(dataset)
    train_dataset = JSONLReader.parse_file('datasets/gsm8k/train.jsonl')
    train_dataset = gsm_data_process(train_dataset)

    current_time = Time.instance().value or time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())
    Time.instance().value = current_time
    result_dir = Path(f"{AgentInit_ROOT}/result/gsm8k")
    result_dir.mkdir(parents=True, exist_ok=True)
    total_solved, total_executed = (0, 0)

    @retry(wait=wait_fixed(10), stop=stop_after_attempt(5))
    async def process_record(record, llm_name, mode):
        question = record["task"]
        roles = None
        constraint = '\n If you need to provide a final answer, please do so in the format: The answer is [Answer]. Your answer should be an integer.'
        manager = Manager(llm_name=llm_name)
        roles = await manager._act(question)
        for key, value in roles.items():
            roles[key]+=constraint
        response = await run_team_chat(question, llm_name, roles,args.domain)
        return response

    num_batches = int(len(dataset)/args.batch_size)
    for i_batch in range(num_batches):
        print(f"Batch {i_batch}",80*'-')
        start_ts = time.time()
        answer_log_probs = []
        answers = []
        # add_losses = []
        
        current_batch = dataloader(dataset,args.batch_size,i_batch)
        if current_batch is None:
            print("No more data available.")
            break
        
        for i_record, record in enumerate(current_batch):
           
            answer = record["answer"]
            answers.append(answer)
            answer_log_probs.append(asyncio.create_task(process_record(record,args.llm_name,args.mode)))
            # add_losses.append(add_loss)
        
        raw_results = await asyncio.gather(*answer_log_probs)
        # print(f"raw_results: {raw_results[0]}")
        # for task, answer, log_prob, add_loss, true_answer, all_answer in zip(current_batch, raw_answers, log_probs, add_losses, answers, all_answers):
        for task, answer, true_answer, in zip(current_batch, raw_results,answers, ):
            predict_answer = gsm_get_predict(answer)
            is_solved = float(predict_answer)==float(true_answer)
            total_solved = total_solved + is_solved
            total_executed = total_executed + 1
            accuracy = total_solved/ total_executed
            updated_item = {
                "Question": task,
                "Answer": true_answer,
                "Response": answer,
                "Attempt answer": predict_answer,
                "Solved": is_solved,
                "Total executed": total_executed,
                "Accuracy": accuracy
            }
            # data.append(updated_item)
            print(f"##########Final Log:{json.dumps(updated_item)}")
        
        print(f"Batch time {time.time() - start_ts:.3f}")
        print(f"Accuracy: {accuracy}")
        
        print(f"Cost {Cost.instance().value}")
        print(f"PromptTokens {PromptTokens.instance().value}")
        print(f"CompletionTokens {CompletionTokens.instance().value}")


if __name__ == '__main__':
    asyncio.run(main())


