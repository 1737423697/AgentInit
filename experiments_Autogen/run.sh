nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/mmlu_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/mmlu_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/mmlu.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours_full >log/Deepseek/Autogen/mmlu_full.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/mmlu_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/mmlu_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/mmlu.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours_full >log/Qwen/Autogen/mmlu_full.out 2>&1 &

nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/svamp_autoagents1.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/svamp_evoagent1.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/svamp1.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/svamp_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/svamp_autoagents1.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/svamp_evoagent1.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/svamp1.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/svamp_ours.out 2>&1 &

nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/humaneval_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/humaneval_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/humaneval.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours_full >log/Deepseek/Autogen/humaneval_full.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/humaneval_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/humaneval_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/humaneval.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours_full >log/Qwen/Autogen/humaneval_full.out 2>&1 &

nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/gsm8k_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/gsm8k_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/gsm8k.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/gsm8k_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/gsm8k_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/gsm8k_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/gsm8k.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/gsm8k_ours.out 2>&1 &

nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/gsm8k_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/gsm8k_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/mmlu_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/mmlu_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/svamp_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/svamp_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/humaneval_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/humaneval_ours.out 2>&1 &

#remain
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/humaneval_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/humaneval_ours1.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/humaneval_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/humaneval_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/humaneval_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/humaneval_evoagent.out 2>&1 &

nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/humaneval_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/svamp_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/gsm8k_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/mmlu_wo.out 2>&1 &

nohup python -u experiments_Autogen/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/humaneval_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/svamp_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/gsm8k_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/mmlu_wo.out 2>&1 &

#AQUA
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/aqua_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/aqua_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/aqua_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/aqua_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/aqua_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/aqua_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode pre >log/Deepseek/Autogen/aqua_pre.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode pre >log/Qwen/Autogen/aqua_pre.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/aqua_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/aqua_wo.out 2>&1 &

#multiarith
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode ours >log/Deepseek/Autogen/multiarith_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode ours >log/Qwen/Autogen/multiarith_ours.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents >log/Qwen/Autogen/multiarith_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode evoagent >log/Qwen/Autogen/multiarith_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode autoagents >log/Deepseek/Autogen/multiarith_autoagents.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode evoagent >log/Deepseek/Autogen/multiarith_evoagent.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --mode pre >log/Deepseek/Autogen/multiarith_pre.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode pre >log/Qwen/Autogen/multiarith_pre.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community >log/Deepseek/Autogen/multiarith_wo.out 2>&1 &
nohup python -u experiments_Autogen/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct >log/Qwen/Autogen/multiarith_wo.out 2>&1 &

