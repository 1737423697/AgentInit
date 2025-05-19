#!/usr/bin/env python
# coding: utf-8

from abc import ABC
from typing import Optional

from tenacity import retry, stop_after_attempt, wait_fixed
from .action_output import ActionOutput
from .common import OutputParser
import openai
from tenacity import retry, wait_random_exponential, stop_after_attempt
import itertools
MINE_BASE_URL = ""
MINE_API_KEYS =  ""


# @retry(wait=wait_random_exponential(max=100), stop=stop_after_attempt(10000))
async def a_evaluator_construction(messages, model_name, data_type='qwen'):
    if data_type == 'openai':
        # openai.api_key = os.environ["OPENAI_API_KEY"]
        openai.api_key = MINE_API_KEYS
        openai.api_base = MINE_BASE_URL
        result = openai.ChatCompletion.create(
            model=model_name,
            messages=messages,
            temperature=0,
            stop=None)
        clean_result = result["choices"][0]["message"]["content"]

        clean_result = result["choices"][0]["message"]["content"]
    elif data_type == 'qwen' or 'deepseek':
        openai.api_key = MINE_API_KEYS
        openai.api_base = MINE_BASE_URL
        # print(model_name)
        # print(messages)
        response = openai.ChatCompletion.create(
            model=model_name,
            messages=messages,
            temperature=0,
            stream = True,
            stop=None)

        clean_result = ""
        for chunk in response:
            if 'choices' in chunk and len(chunk['choices']) > 0:
                delta = chunk['choices'][0].get('delta', {})
                content = delta.get('content')
                if content:
                    clean_result += content
                    # print(content, end='', flush=True)
        return clean_result
class Action(ABC):
    def __init__(self, name: str = '', context=None, llm_name:str = ''):
        self.name: str = name
        self.llm_name = llm_name
        self.context = context
        self.prefix = ""
        self.profile = ""
        self.desc = ""
        self.content = ""
        self.instruct_content = None
    def __str__(self):
        return self.__class__.__name__

    def __repr__(self):
        return self.__str__()


    
    # async def _aask(self, prompt: str, system_msgs: Optional[list[str]] = None) -> str:
    #     """Append default prefix"""
    #     system_prompt = 
    #     user_prompt = 
    #     message = [{'role':'system','content':system_prompt},{'role':'user','content':user_prompt}]
    #     response = await self.llm.agen(message)
    #     return response
    # @retry(stop=stop_after_attempt(3), wait=wait_fixed(10))
    async def _aask(self, prompt: str,system_msgs: Optional[list[str]] = None):
        system_prompt = "You are a helpful assistant."
        user_prompt = prompt
        message = [{'role':'system','content':system_prompt},{'role':'user','content':user_prompt}]
        content = await a_evaluator_construction(message,self.llm_name)
        return content


    @retry(stop=stop_after_attempt(3), wait=wait_fixed(10))
    async def _aask_v1(self, prompt: str, output_class_name: str,
                       output_data_mapping: dict,
                       system_msgs: Optional[list[str]] = None) -> ActionOutput:
        """Append default prefix"""
        system_prompt = "You are a helpful assistant."
        user_prompt = prompt
        message = [{'role':'system','content':system_prompt},{'role':'user','content':user_prompt}]
        content = await a_evaluator_construction(message,self.llm_name)
        if '\n' not in content:
            return ActionOutput(content, '')
        # print("-----------Message------------")
        # print(message)
        output_class = ActionOutput.create_model_class(output_class_name, output_data_mapping)
        try:
            parsed_data = OutputParser.parse_data_with_mapping(content, output_data_mapping)
            instruct_content = output_class(**parsed_data) if output_class(**parsed_data) else ""
        except Exception as e:
            print(f"Error parsing data: {content}")
            instruct_content = None
        return ActionOutput(content, instruct_content)

    async def run(self, *args, **kwargs):
        """Run action"""
        raise NotImplementedError("The run method should be implemented in a subclass.")
