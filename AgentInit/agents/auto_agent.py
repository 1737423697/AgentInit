from typing import List,Any,Dict
import re
import asyncio

from AgentInit.graph.node import Node
from AgentInit.agents.agent_registry import AgentRegistry
from AgentInit.llm.llm_registry import LLMRegistry
from AgentInit.prompt.prompt_set_registry import PromptSetRegistry
from AgentInit.tools.search.wiki import search_wiki_main
from datasets.aqua_dataset import aqua_get_predict
from AgentInit.tools.coding.python_executor import PyExecutor, execute_code_get_return
from datasets.gsm8k_dataset import gsm_get_predict


def find_strings_between_pluses(text):
    return re.findall(r'\@(.*?)\@', text)

@AgentRegistry.register('AutoAgent')
class AutoAgent(Node):
    def __init__(self, id: str | None =None, role:str = None,  domain: str = "", llm_name: str = "", ROLE_PROMPT:dict = {}):
        super().__init__(id, "AutoAgent" ,domain, llm_name)
        self.llm = LLMRegistry.get(llm_name)
        self.role = role
        self.domain = domain
        if not ROLE_PROMPT:
            self.constraint = ""
        else:
            self.constraint = ROLE_PROMPT[self.role]
        
    async def _process_inputs(self, raw_inputs:Dict[str,str], spatial_info:Dict[str,Dict], temporal_info:Dict[str,Dict], **kwargs)->List[Any]:
        """ To be overriden by the descendant class """
        """ Process the raw_inputs(most of the time is a List[Dict]) """              
        system_prompt = f"{self.constraint}"
        # if self.domain == 'humaneval':
        #     system_prompt+=\
        #     "Use a Python code block to write your response. For example:```python\nprint('Hello world!')```.Do not include anything other than Python code blocks in your response."
        if self.domain == 'gsm8k':
            system_prompt += \
            'If you need to provide a final answer, please do so in the format: The answer is [Answer]. Your answer should be an integer.'

        user_prompt = f"The task is: {raw_inputs['task']}\n" 
        spatial_str = ""
        temporal_str = ""
        for id, info in spatial_info.items():
            if self.domain == 'humaneval':
                if info['output'].startswith("```python") and info['output'].endswith("```"):
                    output = info['output'].lstrip("```python\n").rstrip("\n```")
                    is_solved, feedback, state = PyExecutor().execute(output, self.internal_tests, timeout=10)
                    if is_solved and len(self.internal_tests):
                        return "is_solved", info['output']
                    spatial_str += f"Agent {id} as a {info['role']}:\n\nThe code written by the agent is:\n\n{info['output']}\n\n Whether it passes internal testing? {is_solved}.\n\nThe feedback is:\n\n {feedback}.\n\n"
                else:
                    spatial_str += f"Agent {id} as a {info['role']} provides the following info: {info['output']}\n\n"


            else: 
                if 'None.' in (info['output'] if isinstance(info['output'], list) else [info['output']]):
                    continue
                spatial_str += f"Agent {id}, role is {info['role']}, output is:\n\n {info['output']}\n\n"

        for id, info in temporal_info.items():
            if 'None.' in (info['output'] if isinstance(info['output'], list) else [info['output']]):
                continue
            temporal_str += f"Agent {id}, role is {info['role']}, output is:\n\n {info['output']}\n\n"
            
        user_prompt += f"At the same time, the outputs of other agents are as follows:\n\n{spatial_str} \n\n" if len(spatial_str) else ""
        user_prompt += f"In the last round of dialogue, the outputs of other agents were: \n\n{temporal_str}" if len(temporal_str) else ""
        return system_prompt, user_prompt
                
    
    def extract_example(self, prompt: str) -> list:
        prompt = prompt['task']
        lines = (line.strip() for line in prompt.split('\n') if line.strip())

        results = []
        lines_iter = iter(lines)
        for line in lines_iter:
            if line.startswith('>>>'):
                function_call = line[4:]
                expected_output = next(lines_iter, None)
                if expected_output:
                    results.append(f"assert {function_call} == {expected_output}")

        return results

    def _execute(self, input:Dict[str,str],  spatial_info:Dict[str,Dict], temporal_info:Dict[str,Dict],**kwargs):
        """ To be overriden by the descendant class """
        """ Use the processed input to get the result """
        if self.domain == 'humaneval':
            self.internal_tests = self.extract_example(input)
        system_prompt, user_prompt = self._process_inputs(input, spatial_info, temporal_info)
        message = [{'role':'system','content':system_prompt},{'role':'user','content':user_prompt}]
        response = self.llm.gen(message)
        return response

    async def _async_execute(self, input:Dict[str,str],  spatial_info:Dict[str,Dict], temporal_info:Dict[str,Dict],**kwargs):
        """ To be overriden by the descendant class """
        """ Use the processed input to get the result """
        if self.domain == 'humaneval':
            self.internal_tests = self.extract_example(input)
        system_prompt, user_prompt = await self._process_inputs(input, spatial_info, temporal_info)
        message = [{'role':'system','content':system_prompt},{'role':'user','content':user_prompt}]
        response = await self.llm.agen(message)
        if self.domain == 'gsm8k' or self.domain == 'aqua':
            if response.startswith("```python") and response['output'].endswith("```"):
                answer = execute_code_get_return(response.lstrip("```python\n").rstrip("\n```"))
                response += f"\nthe answer is {answer}"
        return response