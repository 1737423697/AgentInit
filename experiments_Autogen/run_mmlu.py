import sys, os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.stdout.reconfigure(encoding='utf-8')

import asyncio
from typing import Union, Literal, List
import argparse
import random

from AgentInit.graph.graph import Graph
from datasets.mmlu_dataset import MMLUDataset
from datasets.MMLU.download import download
from experiments_Autogen.train_mmlu import train
from experiments_Autogen.evaluate_mmlu import evaluate
from AgentInit.utils.const import AgentInit_ROOT
from AgentInit.utils.globals import PromptTokens, CompletionTokens
import torch

def parse_args():
    parser = argparse.ArgumentParser(description="Process some parameters.")

    parser.add_argument('--llm_name', type=str, default="gpt-3.5-turbo",
                        help="Model name, None runs the default ChatGPT4")
    parser.add_argument('--batch_size', type=int, default=20)
    parser.add_argument('--mode', type=str, default=None)
    parser.add_argument('--domain', type=str, default="mmlu")
    args = parser.parse_args()
    result_path = AgentInit_ROOT / "result"
    os.makedirs(result_path, exist_ok=True)
        
    return args

async def main():
    args = parse_args()
    download()

    limit_questions = 153

    dataset_train = MMLUDataset('dev')
    dataset_val = MMLUDataset('val')
    

    PromptTokens.instance().reset()
    CompletionTokens.instance().reset()

    score = await evaluate(dataset = dataset_val,eval_batch_size = args.batch_size,limit_questions = limit_questions,args=args)

if __name__ == "__main__":
    asyncio.run(main())
