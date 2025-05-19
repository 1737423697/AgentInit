import asyncio
import re
from autogen_agentchat.agents import  AssistantAgent, UserProxyAgent
from autogen_agentchat.base import TaskResult
from autogen_agentchat.conditions import ExternalTermination, TextMentionTermination, MaxMessageTermination
from autogen_agentchat.teams import RoundRobinGroupChat
from autogen_agentchat.ui import Console
from autogen_core import CancellationToken
import aiohttp
from autogen_ext.models.openai import OpenAIChatCompletionClient
from tenacity import retry, stop_after_attempt, wait_exponential, retry_if_exception_type
import random
MINE_BASE_URL = ""
MINE_API_KEYS = ""
MODEL_INFOS = {
    "qwen/qwen-2.5-72b-instruct": {
        "name": "qwen/qwen-2.5-72b-instruct", 
        "parameters": {
            "max_tokens": 1024,
        },
        "family": "gpt-4o",  
        "functions": [],  
        "vision": False,  
        "json_output": False,  
        "function_calling": False  
    },
    "deepseek/deepseek-v3/community": {
        "name": "deepseek/deepseek-v3/community",
        "parameters": {
            "max_tokens": 1024,
        },
        "family": "gpt-4o",
        "functions": [],
        "vision": False,
        "json_output": False,
        "function_calling": False
    },
}
class RetryableOpenAIClient():
    def __init__(self, model, base_url, api_key, model_info):
        self.model = model
        self.base_url = base_url
        self.api_key = api_key
        self.model_info = model_info
    @retry(stop=stop_after_attempt(10),wait=wait_exponential(max=10))
    async def create(self, *args, **kwargs):
        
        new_client = OpenAIChatCompletionClient(
            model=self.model,
            api_key=random.choice(MINE_API_KEYS),
            base_url=self.base_url,
            model_info=self.model_info
        )
        return await new_client.create(*args, **kwargs)
def is_valid_autogen_name(name: str) -> bool:
    return bool(re.fullmatch(r'^[a-zA-Z0-9_-]+$', name))

async def run_team_chat(task: str, llm_name: str,roles:dict, domain) -> str:
    if llm_name not in MODEL_INFOS:
        raise ValueError(f"Unsupported llm_name: {llm_name}")

    model_info = MODEL_INFOS[llm_name]

    model_client = RetryableOpenAIClient(
        model=llm_name,
        base_url=MINE_BASE_URL,
        api_key=random.choice(MINE_API_KEYS),
        model_info=model_info
    )

    DECISION_MAKER_PROMPTS = {
        "mmlu": """
    You are the top decision-maker. I will give you a question and four answer choices: A, B, C, and D.
    Only one answer is correct. You must select the correct answer.
    Your response must **only** contain a single letter: A, B, C, or D.
    Do not include explanations, punctuation, or any extra text.
    """,

        "gsm8k": """
    You are the top decision-maker.
    Good at analyzing and summarizing mathematical problems, judging and summarizing other people's solutions, and giving final answers to math problems.
    You will be given a math problem, analysis and code from other agents. 
    Please find the most reliable answer based on the analysis and results of other agents. 
    Give reasons for making decisions. 
    The last line of your output contains only the final result without any units, for example: The answer is 140.
    """,
        "aqua": """
    You are the top decision-maker.
    Good at analyzing and summarizing mathematical problems, judging and summarizing other people's solutions, and giving final choice to multiple-choice question.
    You will be given a multiple-choice question, analysis and code from other agents. 
    Please find the most reliable answer based on the analysis and results of other agents. 
    Give reasons for making decisions. 
    The last line of your output contains only the final choice with only a capital letter, for example: The answer is A.
    """,
        "humaneval": """
    You are the top decision-maker and are good at analyzing and summarizing other people's opinions, finding errors and giving final answers. And you are an AI that only responds with only python code.
    You will be given a function signature and its docstring by the user.
    You may be given the overall code design, algorithm framework, code implementation or test problems.
    "Write your full implementation (restate the function signature). 
    If the prompt given to you contains code that passed internal testing, you can choose the most reliable reply.
    If there is no code that has passed internal testing in the prompt, you can change it yourself according to the prompt.
    Use a Python code block to write your response. For example:\n```python\nprint('Hello world!')\n```
    Do not include anything other than Python code blocks in your response.
    """,


    }

    decision_maker = AssistantAgent(
            "decision_maker",
            model_client=RetryableOpenAIClient(
                model=llm_name,
                base_url=MINE_BASE_URL,
                api_key=random.choice(MINE_API_KEYS),
                model_info=model_info
                ),
            system_message=DECISION_MAKER_PROMPTS[domain],
    )

    agents = []
    for role_name, system_prompt in roles.items():
        role_name = re.sub(r'\W|^(?=\d)', '_', role_name)
        if not role_name.isidentifier() or not is_valid_autogen_name(role_name):
            continue
        agent = AssistantAgent(
            name=role_name,
            model_client=RetryableOpenAIClient(
                model=llm_name,
                base_url=MINE_BASE_URL,
                api_key=random.choice(MINE_API_KEYS),
                model_info=model_info
                ),
            system_message=system_prompt.strip(),
        )
        agents.append(agent)

    agents.append(decision_maker)
    TERMINATE = MaxMessageTermination(1+len(agents))
    team = RoundRobinGroupChat(agents, termination_condition=TERMINATE)
    result = await team.run(task=task)
    return result.messages[-1].content

if __name__ == "__main__":
    asyncio.run(main())