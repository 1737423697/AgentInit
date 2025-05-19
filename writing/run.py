import sys
from io import StringIO
import openai
import json
import os
from tqdm import tqdm
import pdb
import logging
import sys
import argparse
from langchain.chat_models import AzureChatOpenAI
from langchain.prompts import (
    ChatPromptTemplate,
    MessagesPlaceholder,
    SystemMessagePromptTemplate,
    HumanMessagePromptTemplate
)
# import google.generativeai as genai
from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory
from langchain import LLMChain
import numpy as np
import requests
import os
import subprocess
import time
import re
import importlib.util
import os
import pickle
from util_func import *
import sys
from io import StringIO
from threading import Thread, Event
import traceback
import asyncio
from concurrent.futures import ThreadPoolExecutor


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--model_name", type=str, default="gpt-3.5-turbo-1106")
    parser.add_argument("--data_type", type=str, default="openai")
    parser.add_argument("--method", type=str, default="evoagent")
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--end", type=int, default=31)
    parser.add_argument("--ind", type=int, default=3)
    args = parser.parse_args()
    model_name = args.model_name
    data_type = args.data_type
    method = args.method
    task_name = os.environ["task"]
    if task_name == 'writing':
        test_data = read_jsonline('data/trivia_creative_writing/trivia_creative_writing_100_n_5.jsonl')
    elif task_name == 'writing_10':
        test_data = read_jsonline('data/trivia_creative_writing/trivia_creative_writing_100_n_10.jsonl')


    total_files = len(test_data)
    progress_file = f"results/{task_name}_{data_type}_{method}.txt"
    start_index = get_last_processed_index(progress_file)
    azure = False
    with tqdm(total=total_files, desc="Processing files", initial=start_index) as pbar:
        for i, data in enumerate(test_data[start_index:], start=start_index):

            topic = data["topic"]
            questions = '\n'.join(data["questions"])
            n = len(data["questions"])
            prompt = f'''Write a short and coherent story about {topic} that incorporates the answers to the following {n} questions: \n{questions}\nAnswer:'''.strip()
            input_data = f'''Write a short and coherent story about {topic} that incorporates the answers to the following {n} questions: \n{questions}\nAnswer:'''.strip()

            messages = message_construction(model_name, prompt)

            if method == "evoagent":
                clean_result = evaluator_construction(messages, model_name, prompt, data_type)
                answer_list, answer = collaboration_func(args.ind, input_data, clean_result, model_name, data_type)
            elif method == "refine":
                clean_result = evaluator_construction(messages, model_name, prompt, data_type)
                answer_list, answer = refine_func(args.ind, input_data, clean_result, model_name, data_type)
            elif method == "spp":
                clean_result = evaluator_construction(messages, model_name, prompt, data_type)
                answer_list, answer = spp_func(args.ind, input_data, clean_result, model_name, data_type)
            elif method == "direct":
                clean_result = evaluator_construction(messages, model_name, prompt, data_type)
                answer = clean_result
                answer_list = []
            elif method == 'cot':
                messages = message_construction(model_name, "Let's think step by step"+prompt)
                clean_result = evaluator_construction(messages, model_name, prompt, data_type)
                answer = clean_result
                answer_list = []
            elif method == "agentinit":
                clean_result = evaluator_construction(messages, model_name, prompt, data_type)
                result = asyncio.run(init_func(args.ind, input_data, clean_result, model_name, data_type))
                answer_list, answer = result

            if 'writing' in task_name:
                data["final_answer"] = answer
                data["answer_list"] = answer_list
                correct_count = 0
                question_count = len(data["answers"])
                for ans_to_question in data["answers"]:
                    for ans in ans_to_question:
                        if ans.lower() in answer.lower():
                            correct_count += 1
                            break
                data["info"] = {'correct_count': correct_count, 'question_count': question_count}

            with open(progress_file.split('.txt')[0] + '.jsonl', 'a+', encoding='utf-8') as f:
                line = json.dumps(data, ensure_ascii=False)
                f.write(line + '\n')

            update_progress(progress_file, i + 1)
            pbar.update(1)
            # break
