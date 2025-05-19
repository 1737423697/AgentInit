#!/usr/bin/env python
# coding: utf-8
"""
@Time    : 2023/5/11 14:43
@Author  : alexanderwu
@From    : https://github.com/geekan/MetaGPT/blob/main/metagpt/actions/action.py
"""
from abc import ABC
from typing import Optional

from tenacity import retry, stop_after_attempt, wait_fixed
from AgentInit.llm.llm_registry import LLMRegistry
from .action_output import ActionOutput
from .common import OutputParser

class Action(ABC):
    def __init__(self, name: str = '', context=None, llm_name:str = ''):
        self.name: str = name
        self.llm = LLMRegistry.get(llm_name)
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
        content = await self.llm.agen(message)
        return content


    @retry(stop=stop_after_attempt(3), wait=wait_fixed(10))
    async def _aask_v1(self, prompt: str, output_class_name: str,
                       output_data_mapping: dict,
                       system_msgs: Optional[list[str]] = None) -> ActionOutput:
        """Append default prefix"""
        system_prompt = "You are a helpful assistant."
        user_prompt = prompt
        message = [{'role':'system','content':system_prompt},{'role':'user','content':user_prompt}]
        content = await self.llm.agen(message)
        if '\n' not in content:
            return ActionOutput(content, '')
        # print("-----------Message------------")
        # print(message)
        output_class = ActionOutput.create_model_class(output_class_name, output_data_mapping)
        try:
            parsed_data = OutputParser.parse_data_with_mapping(content, output_data_mapping)
            instruct_content = output_class(**parsed_data) if output_class(**parsed_data) else ""
        except Exception as e:
            print(f"Error parsing data: {content}\nException: {e}")
            instruct_content = None
        return ActionOutput(content, instruct_content)

    async def run(self, *args, **kwargs):
        """Run action"""
        raise NotImplementedError("The run method should be implemented in a subclass.")
