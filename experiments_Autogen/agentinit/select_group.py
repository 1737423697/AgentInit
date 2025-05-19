#!/usr/bin/env python
# -*- coding: utf-8 -*-
from typing import List, Tuple
from .action import Action

import re
PROMPT_TEMPLATE = '''
You are tasked with selecting the best group of experts to help answer a given question. Consider the relevance and effectiveness of each group's composition. 

# Question or Task
{context}

# Groups
{groups}

Follow these steps:
1. Analyze the Question: Identify its scope and complexity.
2. Evaluate Each Group: Assess the relevance of the roles in each group to the question. Compare the strengths and weaknesses of each group.
3. Make a Justified Choice: Select the most suitable group based on the above analysis.

# Attention 
1. A larger group is not necessarily better—some roles may be redundant or even negatively impact the results if they are not relevant to the question. Conversely, if the question requires a broad knowledge base, a more diverse group may be advantageous.
2. If a group includes agents that are not aligned with the question, might divert the topic, or may cause unnecessary repetition in the workflow, such agents should be considered detrimental and the group less preferable.
3. The last line of your response MUST be 'Choice: Group X' where X is the number of the selected group. For example, 'Choice: Group 1'.

'''

class SelectGroup(Action):

    def __init__(self, name="CreateRolesTasks", context=None, llm_name=None):
        super().__init__(name, context, llm_name)

    async def run(self, context,groups):
        
        # print(f"question: {question}")
        prompt = PROMPT_TEMPLATE.format(context=context, groups = groups)
        rsp = await self._aask(prompt)
        # print(rsp)
        match = re.search(r"Choice:\s*Group\s*(\d+)", rsp)
        if match:
            group_idx = int(match.group(1))
            # print("Selected Group:", group_idx)
        return group_idx


class AssignTasks(Action):
    async def run(self, *args, **kwargs):
        # Here you should implement the actual action
        pass
