### Interactive Scientific Solving Simulation: ScienceWorld

We choose **ScienceWorld**, a complex interactive environment requiring long-term memory, sub-task decomposition, and scientific and commonsense reasoning. We evaluate 30 scientific tasks in ScienceWorld to demonstrate the capability of **EvoAgent** in solving tasks in more challenging open-world environments.

This evaluation code is adapted from [EvoAgent](https://github.com/siyuyuan/evoagent), and the evaluation pipeline has been customized accordingly.

#### 🔧 Preparation

Install the required dependencies:

```bash
pip install -r requirements.txt
```

Before running the evaluation, please modify the following files:

- `scienceworld/agentinit/embedder.py`: set `model_path` to the desired model location.
- `scienceworld/agentinit/action.py`: set `MINE_BASE_URL` and  `MINE_API_KEYS`.
- `scienceworld/eval_init.py`:
  - set `MINE_BASE_URL` and `MINE_API_KEYS`.
  - set `token_model` to your own tokenizer model/

#### 🚀 Run Evaluation

Use the following script to evaluate all 30 ScienceWorld tasks:

```
cd scienceworld/

for task in {0..29}
do
    python eval_init.py \
        --task_nums $task \
        --output_path logs/$MODEL_NAME \
        --model_name $MODEL_NAME
done
```



#### Directly Test Our Provided Results

If you prefer to bypass rerunning the full evaluation pipeline, you may directly utilize our precomputed results:

```
unzip results.zip
python get_results.py
```