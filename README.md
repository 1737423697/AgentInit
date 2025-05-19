# AgentDropout



### About Method

We propose ***AgentInit***, a novel initialization framework for large language model (LLM)-based multi-agent systems. AgentInit strategically orchestrates diverse agent roles and expertise distributions to optimize collaboration effectiveness and efficiency.



<img src="image/MAIN.png" alt="main" style="zoom: 33%;" />



### Requirements

Install anaconda environment

```shell
conda create -n agentinit python=3.10

conda activate agentinit

pip install -r requirements.txt
```

Set url and API keys in `AgentInit/llm/gpt_chat`

```python
MINE_BASE_URL = ""

MINE_API_KEYS = ""
```

Set text encoder in `AgentInit/agentinit/embedder.py`

```python
model_path: str = ''
```

Prepare data from [Huggingface](https://huggingface.co/). And put them in `datasets/`.



### Quick Start

Run AgentInit on MMLU, the same as other datasets: 

```shell
python -u experiments/run_mmlu.py --batch_size 10 --llm_name MODEL_NAME --agent_names AutoAgent
```



Run on different framework:

```shell
python -u experiments_Autogen/run_mmlu.py --batch_size 10 ---llm_name MODEL_NAME 
```



You can also try our pre-generated examples to quickly verify the evaluation results without running the full pipeline:

```shell
python -u example/run_mmlu.py --batch_size 40 --llm_name YOUR QWEN MODEL --agent_names AutoAgent
```



Code framework based on [GPTSwarm](https://github.com/metauto-ai/GPTSwarm), [AgentPrune](https://github.com/yanweiyue/AgentPrune), [AgentDropout](https://github.com/wangzx1219/AgentDropout/) and [AutoAgents](https://github.com/Link-AGI/AutoAgents)