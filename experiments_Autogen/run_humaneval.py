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
from AgentInit.graph.graph import Graph
from AgentInit.tools.reader.readers import JSONLReader
from AgentInit.tools.coding.python_executor import PyExecutor
from AgentInit.utils.globals import Time
from AgentInit.utils.const import AgentInit_ROOT
from AgentInit.utils.globals import Cost, PromptTokens, CompletionTokens
from AgentInit.utils.utils import nuclear_norm,frobenius_norm
from experiments_Autogen.Autogen import run_team_chat
from experiments_Autogen.agentinit.manager import Manager
from tenacity import retry, wait_random_exponential, stop_after_attempt, wait_fixed
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
    parser = argparse.ArgumentParser(description="AgentInit Experiments on HumanEval")
    parser.add_argument("--dataset_json", type=str, default="datasets/humaneval/humaneval-py.jsonl")
    parser.add_argument("--llm_name", type=str, default="gpt-4-1106-preview")
    parser.add_argument('--batch_size', type=int, default=4,help="batch size")
    parser.add_argument('--mode', type=str, default=None)
    parser.add_argument('--domain', type=str, default="humaneval")
    args = parser.parse_args()
    return args

async def main():
    args = parse_args()
    dataset = JSONLReader.parse_file(args.dataset_json)
    current_time = Time.instance().value or time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())
    Time.instance().value = current_time

    total_solved, total_executed = (0, 0)

   
    @retry(wait=wait_fixed(10), stop=stop_after_attempt(5))
    async def process_record(record, llm_name, mode):
        question = record["prompt"]
        roles = None
        constraint = "\n**Attention**:If you are responsible for writing code, your response should solely consist of a Python code block. If not, please keep your answer concise and within 50 words."
        manager = Manager(llm_name=llm_name)
        roles = await manager._act(question)
        for key, value in roles.items():
            roles[key]+=constraint
        response = await run_team_chat(question, llm_name, roles,args.domain)
        return response


    for i_batch in range(4,17):
        print(f"Batch {i_batch}",80*'-')
        start_ts = time.time()
        answer_log_probs = []
        tests = []
        # add_losses = []        
        current_batch = dataloader(dataset,10,i_batch)
        if current_batch is None:
            print("No more data available.")
            break
        
        for i_record, record in enumerate(current_batch):
            test = record["test"]
            tests.append(test)
            answer_log_probs.append(asyncio.create_task(process_record(record,args.llm_name,args.mode)))
            
        raw_results = await asyncio.gather(*answer_log_probs)
        
        # for task, answer, log_prob, add_loss, test in zip(current_batch, raw_answers, log_probs, add_losses, tests):
        for task, answer, test in zip(current_batch, raw_results, tests):
            answer = answer.lstrip("```python\n").rstrip("\n```")
            is_solved, _, _ = PyExecutor().execute(answer, [test], timeout=100)
            total_solved = total_solved + is_solved
            total_executed = total_executed + 1
            accuracy = total_solved/ total_executed

            updated_item = {
                "Question": task,
                "Tests": test,
                "Attempt answer": answer,
                "Solved": is_solved,
                "Solution": answer,
                "Total solved": total_solved,
                "Total executed": total_executed,
                "Accuracy": accuracy
            }
        

        print(f"Batch time {time.time() - start_ts:.3f}")
        print(f"Accuracy: {accuracy}")

        print(f"Cost {Cost.instance().value}")
        print(f"PromptTokens {PromptTokens.instance().value}")
        print(f"CompletionTokens {CompletionTokens.instance().value}")


if __name__ == '__main__':
    asyncio.run(main())
