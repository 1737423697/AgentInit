#!/usr/bin/env python
# -*- coding: utf-8 -*-
from typing import List, Tuple
from .action import Action

import re
PROMPT_TEMPLATE = '''
-----
You are a manager and an expert-level ChatGPT prompt engineer with expertise in multiple fields. Your goal is to break down tasks by creating exactly multiple LLM agents, assign them roles, analyze their dependencies, and provide a detailed execution plan. You should continuously improve the role list and plan based on the suggestions in the History section.

# Question or Task
{context}

# Existing Expert Roles
{existing_roles}

# History
{history}

# Steps
You will come up with solutions for any task or problem by following these steps:
1. You should first understand, analyze, and break down the human's problem/task.
2. According to the problem and existing expert roles, you will select the existing expert roles that are needed to solve the problem. You should act as an expert-level ChatGPT prompt engineer and planner with expertise in multiple fields, so that you can better develop a problem-solving plan and provide the best answer. You should follow these principles when selecting existing expert roles: 
2.1. Make full use of the existing expert roles to solve the problem. 
2.2. Follow the requirements of the existing expert roles. Make sure to select the existing expert roles that have cooperative or dependent relationships. 
2.3. You MUST output the details of the selected existing expert roles in JSON blob format. Specifically, the JSON of each selected existing expert role should include its original information.
3. According to the problem and existing expert roles, you will create additional expert roles that are needed to solve the problem. You should act as an expert-level ChatGPT prompt engineer and planner with expertise in multiple fields, so that you can better develop a problem-solving plan and provide the best answer. You should follow these principles when creating additional expert roles:
3.1. The newly created expert role should not have duplicate functions with any existing expert role. If there are duplicates, you do not need to create this role.
3.2. Each new expert role should include a name, a detailed description of their area of expertise, execution suggestions, and prompt templates.
3.3. Determine the number and domains of expertise of each new expert role based on the content of the problem. Please make sure each expert has a clear responsibility and do not let one expert do too many tasks. The description of their area of expertise should be detailed so that the role understands what they are capable of doing. 
3.4. Determine the names of each new expert role based on their domains of expertise. The name should express the characteristics of expert roles. 
3.5. Determine the goals of each new expert role based on their domains of expertise. The goal MUST indicate the primary responsibility or objective that the role aims to achieve. 
3.6. Determine the constraints of each new expert role based on their domains of expertise. The constraints MUST specify limitations or principles that the role must adhere to when performing actions. 
3.7. Provide some suggestions for each agent to execute the task, including but not limited to a clear output, extraction of historical information, and suggestions for execution steps. 
3.8. Generate the prompt template required for calling each new expert role according to its name, description, goal, constraints and suggestions.  A good prompt template should first explain the role it needs to play (name), its area of expertise (description), the primary responsibility or objective that the role aims to achieve (goal), limitations or principles that the role must adhere to when performing actions (constraints), and suggestions for agent to execute the task (suggestions). The prompt MUST follow the following format "You are [description], named [name]. Your goal is [goal], and your constraints are [constraints]. You could follow these execution suggestions: [suggestions].".
3.9. You MUST output the details of created new expert roles in JSON blob format. Specifically, The JSON of new expert roles should have a `name` key (the expert role name), a `description` key (the description of the expert role's expertise domain), a `suggestions` key (some suggestions for each agent to execute the task), and a `prompt` key (the prompt template required to call the expert role). Each JSON blob should only contain one expert role, and do NOT return a list of multiple expert roles. 
4. Finally, based on the content of the problem/task and the expert roles, provide a detailed execution plan with the required steps to solve the problem.
4.1. The execution plan should consist of multiple steps that solve the problem progressively. Make the plan as detailed as possible to ensure the accuracy and completeness of the task. You need to make sure that the summary of all the steps can answer the question or complete the task.
4.2. Each step should assign at least one expert role to carry it out. If a step involves multiple expert roles, you need to specify the contributions of each expert role and how they collaborate to produce integrated results. 
4.3. The description of each step should provide sufficient details and explain how the steps are connected to each other.
4.4. The description of each step must also include the expected output of that step and indicate what inputs are needed for the next step. The expected output of the current step and the required input for the next step must be consistent with each other. Sometimes, you may need to extract information or values before using them. Otherwise, the next step will lack the necessary input.
4.5. Output the execution plan as a numbered list of steps. For each step, please begin with a list of the expert roles that are involved in performing it.

# Suggestions
{suggestions}

# Attention
1. Please adhere to the requirements of the existing expert roles.
2. DO NOT answer the answer directly. You should focus on generating high-performance roles and a detailed plan to effectively address it.
3. If you do not receive any suggestions, you should always consider what kinds of expert roles are required and what are the essential steps to complete the tasks. If you do receive some suggestions, you should always evaluate how to enhance the previous role list and the execution plan according to these suggestions and what feedback you can give to the suggesters.
-----
'''


FORMAT_EXAMPLE = '''
---
## Question or Task:
the input question you must answer / the input task you must finish

## Selected Roles List:
```
JSON BLOB 1,
JSON BLOB 2,
JSON BLOB 3
```

## Created Roles List:
```
JSON BLOB 1,
JSON BLOB 2,
JSON BLOB 3
```

## Execution Plan:
1. [ROLE 1, ROLE2, ...]: STEP 1
2. [ROLE 1, ROLE2, ...]: STEP 2
2. [ROLE 1, ROLE2, ...]: STEP 3

## RoleFeedback
feedback on the historical Role suggestions

## PlanFeedback
feedback on the historical Plan suggestions
---
'''

OUTPUT_MAPPING = {
    "Selected Roles List": (str, ...),
    "Created Roles List": (str, ...),
    "Execution Plan": (str, ...),
    "RoleFeedback": (str, ...),
    "PlanFeedback": (str, ...),
}

FORMATER_PROMPT = '''
-----
You are a formatting expert. I will provide you with an agent planner's task execution plan, and you must strictly follow the requirements below. Extract the corresponding information and present it exactly in the specified format.
# Content to Format:
{raw_content}


# Format Requirements
1. Organize content into these sections:
   - Selected Roles List (JSON blobs)
   - Created Roles List (JSON blobs) 
   - Execution Plan (numbered list) For each step, begin with a list of the expert roles involved in performing it.
   - RoleFeedback (feedback on the historical Role suggestions)
   - PlanFeedback (feedback on the historical Plan suggestions)

2. Your final output should ALWAYS in the following format:
{format_example}

3. Use '##' for section headers
4. Ensure all expert roles are properly formatted. Each JSON blob should only contain one expert role, and do NOT return a list of multiple expert roles. Here is an example of a valid JSON blob:
{{{{
    "name": “ROLE NAME",
    "description": "ROLE DESCRIPTONS",
    "suggestions": "EXECUTION SUGGESTIONS",
    "prompt": "ROLE PROMPT",
}}}}

-----
'''

class CreateRoles(Action):

    def __init__(self, name="CreateRolesTasks", context=None, llm_name=None):
        super().__init__(name, context, llm_name)

    async def run(self, context, history='', suggestions=''):

        from . import ROLES_LIST
        # print(f"question: {question}")
        prompt = PROMPT_TEMPLATE.format(context=context, existing_roles=ROLES_LIST, history=history, suggestions=suggestions)
        rsp = await self._aask(prompt)
        format_rsp = await self._aask_v1(FORMATER_PROMPT.format(format_example=FORMAT_EXAMPLE, raw_content=rsp), "task", OUTPUT_MAPPING)
        return format_rsp


class AssignTasks(Action):
    async def run(self, *args, **kwargs):
        # Here you should implement the actual action
        pass
