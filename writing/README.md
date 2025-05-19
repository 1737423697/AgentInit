### Evaluation on the Trivia Creative Task

To further assess the generality and robustness of our approach, we conduct experiments on the **Trivia Creative Task**, a creative language generation benchmark that evaluates a model’s capacity for open-ended reasoning and diverse expression.

This evaluation builds on prior experience from projects such as *AutoAgents* and *EvoAgent*, and adapts our framework for application in creative and commonsense-rich tasks.

---

#### Required Modifications Before Running

Before running the evaluation, please ensure the following configurations are updated to allow API access:

- `writing/agentinit/action.py`: set the following fields:
  - `MINE_BASE_URL`
  - `MINE_API_KEYS`
- `writing/util_func.py`: set the same fields:
  - `MINE_BASE_URL`
  - `MINE_API_KEYS`

These settings are required for interaction with the MINE environment used in this task setup.

---

#### Running the Evaluation

You may use the following script to run the evaluation. We support both 5-shot and 10-shot variants:

```bash
cd writing/

# Uncomment one of the following lines depending on the experiment:
# export task=writing      # Use this for N=5 examples per prompt
# export task=writing_10   # Use this for N=10 examples per prompt
export task=writing        # Default: N=5

python3 -u llm_evoagent.py \
    --model_name $MODEL_NAME \
    --data_type deepseek \
    --method autoagents \
    --ind 3
    
Replace $MODEL_NAME with the name of your target model.    
```