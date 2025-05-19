
from typing import Iterable, Type
from .create_roles_format import CreateRoles
from .check_roles import CheckRoles
from .check_plans import CheckPlans
from pydantic import BaseModel, Field
from tenacity import retry, wait_random_exponential, stop_after_attempt, wait_fixed
import re
import json
import numpy as np
from .Optimizer import Optimizer
from .select_group import SelectGroup
from .embedder import Embedder
import itertools
import collections
from vendi_score import vendi
class Manager(): 
    def __init__(self, llm_name):
        self.state = 0
        self.actions = [CreateRoles, CheckRoles, CheckPlans, SelectGroup]
        self.todo = None
        self.llm_name = llm_name
        self.roles = []
        self.role_embeddings = []
        self.embedder = Embedder()
        self.groups = []
        self.sim_matrix = None
        self.query_sims = None
        self.optimizer = Optimizer()

    def _set_state(self, state):
        """Update the current state."""
        self.state = state
        self.todo = self.actions[self.state](llm_name=self.llm_name)

    def Init_Population(self, min_roles=1, max_roles=5):
        num_roles = len(self.roles)
        groups = []
        
        for k in range(min_roles, max_roles + 1):
            groups.extend(
                [list(indices) for indices in itertools.combinations(range(num_roles), k)]
            )
        
        # print(f"groups: {groups}")
        self.groups = groups
    
    async def _generate_role_embeddings(self):
        if not self.roles:
            return
        agents = [value for role in self.roles for value in role.values()]
        
        embeddings = self.embedder.embed_sentences(agents)
        
        self.role_embeddings = embeddings.tolist() if isinstance(embeddings, np.ndarray) else embeddings


    async def _precompute_similarities(self, query: str):
        query_embed = self.embedder.embed_sentences([query])[0]
        
        embeddings = np.array(self.role_embeddings)
        self.sim_matrix = self.embedder.cosine_similarity(embeddings)
        self.query_sims = self.embedder.cosine_similarity_query([query_embed], embeddings)

    def calculate_objective_1(self, group):
        """Calculate the average similarity of roles in the group with the query."""
        avg_sim = np.mean([self.query_sims[i] for i in group])
        return -avg_sim
    
    def calculate_objective_2(self, group):
        total_sim = 0
        count = 0
        submatrix = self.sim_matrix[np.ix_(group, group)]
        score = vendi.score_K(submatrix)    
        # print(score)
        return -score

    # @retry(wait=wait_fixed(10), stop=stop_after_attempt(5))
    async def _act(self, question):
        roles_plan, suggestions_roles, suggestions_plan = '', '', ''
        suggestions, num_steps = '', 3
        steps, consensus = 0, False
        while not consensus and steps < num_steps:
            self._set_state(0)
            response = await self.todo.run(context = question, history=roles_plan, suggestions=suggestions)
            if '\n' not in response.content:
                print(f'INVALID RESPONSE : ----{response.content}----')
                return {'Normal':'You are a helpful assistant.'}
            roles_plan = str(response.instruct_content)
            if steps == num_steps - 1:
                break
            if 'No Suggestions' not in suggestions_roles or 'No Suggestions' not in suggestions_plan:
            # if 'No Suggestions' not in suggestions_roles:
                self._set_state(1)
                history_roles = f"## Role Suggestions\n{suggestions_roles}\n\n## Feedback\n{response.instruct_content.RoleFeedback}"
                _suggestions_roles = await self.todo.run(response.content, history=history_roles)
                suggestions_roles += _suggestions_roles.instruct_content.Suggestions
                
                self._set_state(2)
                history_plan = f"## Plan Suggestions\n{suggestions_roles}\n\n## Feedback\n{response.instruct_content.PlanFeedback}"
                _suggestions_plan = await self.todo.run(response.content, history=history_plan)
                suggestions_plan += _suggestions_plan.instruct_content.Suggestions


            suggestions = f"## Role Suggestions\n{_suggestions_roles.instruct_content.Suggestions}\n\n## Plan Suggestions\n{_suggestions_plan.instruct_content.Suggestions}"
            if 'No Suggestions' in suggestions_roles and 'No Suggestions' in suggestions_plan:
                consensus = True

            steps += 1


        data = str(response.instruct_content).encode().decode('unicode_escape')
        role_matches = re.findall(r'\{\n\s*"name":[\s\S]*?\s*\n\}', data, re.DOTALL)
        steps_match = re.search(r'Execution Plan=(.*?)RoleFeedback', data, re.DOTALL)

        
        roles = {}
        for match in role_matches:

            role_data = json.loads(match.replace("\\",r"\\"))
            roles[role_data["name"]] = role_data["prompt"]

        steps = []
        seen_steps = set()  
        if steps_match:
            steps_text = steps_match.group(1)+"\n"
            step_matches = re.findall(r"\d+\.\s*\**\[(.*?)\]\**\s*:(\s.*?)\n", steps_text, re.DOTALL)
            for role, action in step_matches:
                step_tuple = (role, action) 
                for role_key in roles.keys():
                    if role_key not in seen_steps and role_key in role:
                        seen_steps.add(role_key)
                        steps.append({"role": role_key, "action": action})

        roles_in_steps={}
        for step in steps:    
            role = step["role"]
            roles_in_steps[role] = roles[role]


        if not roles_in_steps:
            raise

        for role in roles_in_steps.keys():
            role_dict = {role: roles_in_steps[role]}
            self.roles.append(role_dict)
        

        
        await self._generate_role_embeddings()

        await self._precompute_similarities(question)

        role_names = [list(role.keys())[0] for role in self.roles]


        self.Init_Population()

        # Step2. 
        objectives = []
        for group in self.groups:
            objective1 = self.calculate_objective_1(group)
            objective2 = self.calculate_objective_2(group)
            objectives.append((objective1, objective2))
        front = self.optimizer.fast_non_dominated_sort(objectives)
        text = ""
        for i,group_idx in enumerate(front[0]):
            text += f"Group {i+1}:\n"
            group = self.groups[group_idx]
            for idx in group:
                text += f"Role: {list(self.roles[idx].keys())[0]}, Prompt: {list(self.roles[idx].values())[0]}\n"

        self._set_state(3)
        choice_num = await self.todo.run(context=question, groups=text)
        group_idx = front[0][choice_num-1]

        final_roles = collections.defaultdict(str)
        for role_idx in self.groups[group_idx]:
            final_roles[list(self.roles[role_idx].keys())[0]] = list(self.roles[role_idx].values())[0]
        
        if not final_roles:
            raise
        return final_roles