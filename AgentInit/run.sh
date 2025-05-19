nohup python -u experiments_vendi_cache/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Vendi/gsm8k1.out 2>&1&
nohup python -u experiments_vendi_cache/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Vendi/gsm8k.out 2>&1&


nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Evo/gsm8k.out 2>&1&
nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Evo/gsm8k.out 2>&1&

nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/gsm8k.out 2>&1&
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Auto/gsm8k.out 2>&1&

#COMPLETE GRAPH SVAMP
nohup python -u experiments_vendi_cache/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Vendi/svamp.out 2>&1&
nohup python -u experiments_vendi_cache/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Vendi/svamp.out 2>&1&


nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Evo/svamp.out 2>&1&
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Evo/svamp.out 2>&1&

nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/svamp.out 2>&1&
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Auto/svamp.out 2>&1&


#Different mode

nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Vendi_layered/mmlu.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Auto/mmlu_layered.out 2>&1&
nohup python -u experiments_Evo/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/mmlu_layered.out 2>&1&
nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Vendi_chain/mmlu.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Auto/mmlu_layered.out 2>&1&
nohup python -u experiments_Evo/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/mmlu_layered.out 2>&1&


nohup python -u experiments_vendi_cache/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Vendi_layered/gsm8k.out 2>&1&
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Auto/gsm8k_layered.out 2>&1&
nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/gsm8k_layered.out 2>&1&
nohup python -u experiments_vendi_cache/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --modeStar > log/Deepseek/Vendi_layered/gsm8k.out 2>&1&
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Auto/gsm8k_layered.out 2>&1&
nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/gsm8k_layered.out 2>&1&

nohup python -u experiments_vendi_cache/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Vendi_layered/svamp.out 2>&1&
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered  > log/Qwen/Auto/svamp_layered.out 2>&1&
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/svamp_layered.out 2>&1&
nohup python -u experiments_vendi_cache/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Vendi_layered/svamp.out 2>&1&
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Auto/svamp_layered.out 2>&1&
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/svamp_layered.out 2>&1&

nohup python -u experiments_vendi_cache/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Vendi_layered/humaneval.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered  > log/Qwen/Auto/humaneval_layered.out 2>&1&
nohup python -u experiments_Evo/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/humaneval_layered.out 2>&1&
nohup python -u experiments_vendi_cache/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Vendi_layered/humaneval.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Auto/humaneval_layered.out 2>&1&
nohup python -u experiments_Evo/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/humaneval_layered.out 2>&1&

nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered  > log/Qwen/Layered/humaneval.out 2>&1&

nohup python -u experiments_vendi_cache/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Vendi_chain/humaneval1.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Auto/humaneval_chain1.out 2>&1&
nohup python -u experiments_Evo/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Evo/humaneval_chain1.out 2>&1&
nohup python -u experiments_vendi_cache/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Vendi_chain/humaneval1.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Auto/humaneval_chain1.out 2>&1&
nohup python -u experiments_Evo/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Evo/humaneval_chain1.out 2>&1&


nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Vendi_chain/mmlu1.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Auto/mmlu_chain1.out 2>&1&
nohup python -u experiments_Evo/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Evo/mmlu_chain1.out 2>&1&
nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Vendi_chain/mmlu1.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Auto/mmlu_chain1.out 2>&1&
nohup python -u experiments_Evo/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Evo/mmlu_chain1.out 2>&1&


nohup python -u experiments_vendi_cache/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Vendi/humaneval.out 2>&1&
nohup python -u experiments_vendi_cache/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Vendi/humaneval.out 2>&1&
nohup python -u experiments_Evo/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Evo/humaneval_empty.out 2>&1&
nohup python -u experiments_Evo/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Evo/humaneval_empty.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/humaneval_empty.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Auto/humaneval_empty.out 2>&1&


nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Vendi/mmlu.out 2>&1&
nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Vendi/mmlu.out 2>&1&

nohup python -u experiments_Autogen/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --mode autoagents > log/Qwen/Autogen/mmlu_autoagents2.out 2>&1

nohup python -u experiments_vendi_cache/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Vendi/mmlu.out 2>&1&


#NORMAL
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent > log/Qwen/Normal/humaneval_complete.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star > log/Qwen/Normal/humaneval_star.out 2>&1&
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/humaneval_layered.out 2>&1&
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent > log/Qwen/Normal/gsm8k_complete.out 2>&1&
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star > log/Qwen/Normal/gsm8k_star.out 2>&1&
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/gsm8k_layered.out 2>&1&
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent > log/Qwen/Normal/svamp_complete.out 2>&1&
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star > log/Qwen/Normal/svamp_star.out 2>&1&
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/svamp_layered.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent > log/Qwen/Normal/mmlu_complete.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star > log/Qwen/Normal/mmlu_star.out 2>&1&
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/mmlu_layered.out 2>&1&

nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/mmlu_chain.out 2>&1 &
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/gsm8k_chain.out 2>&1 &
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/svamp_chain.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/humaneval_chain.out 2>&1 &


nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent > log/Deepseek/Normal/humaneval_complete.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Star > log/Deepseek/Normal/humaneval_star.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Layered > log/Deepseek/Normal/humaneval_layered.out 2>&1 &
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent > log/Deepseek/Normal/gsm8k_complete.out 2>&1 &
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Star > log/Deepseek/Normal/gsm8k_star.out 2>&1 &
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Layered > log/Deepseek/Normal/gsm8k_layered.out 2>&1 &
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent > log/Deepseek/Normal/svamp_complete.out 2>&1 &
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Star > log/Deepseek/Normal/svamp_star.out 2>&1 &
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Layered > log/Deepseek/Normal/svamp_layered.out 2>&1 &
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent > log/Deepseek/Normal/mmlu_complete.out 2>&1 &
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Star > log/Deepseek/Normal/mmlu_star.out 2>&1 &
nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Layered > log/Deepseek/Normal/mmlu_layered.out 2>&1 &

nohup python -u experiments/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Chain > log/Deepseek/Normal/mmlu_chain.out 2>&1 &
nohup python -u experiments/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Chain > log/Deepseek/Normal/gsm8k_chain.out 2>&1 &
nohup python -u experiments/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Chain > log/Deepseek/Normal/svamp_chain.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Chain > log/Deepseek/Normal/humaneval_chain.out 2>&1 &

#MultiArith
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent  > log/Deepseek/Normal/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Chain > log/Deepseek/Normal/multiarith_chain.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Star  > log/Deepseek/Normal/multiarith_star.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Layered > log/Deepseek/Normal/multiarith_layered.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent  > log/Qwen/Normal/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/multiarith_chain.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star  > log/Qwen/Normal/multiarith_star.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/multiarith_layered.out 2>&1 &

nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --mode Chain > log/Deepseek/Chain/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --mode Star  > log/Deepseek/Star/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --mode Layered > log/Deepseek/Layered/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  > log/Deepseek/MAS/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Chain > log/Qwen/Chain/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Star  > log/Qwen/Star/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Layered > log/Qwen/Layered/multiarith.out 2>&1 &
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct > log/Qwen/MAS/multiarith.out 2>&1 &

nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Vendi_layered/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Auto/multiarith_layered.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/multiarith_layered.out 2>&1&
nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Vendi_layered/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Auto/multiarith_layered.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/multiarith_layered.out 2>&1&

nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Vendi_chain/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Auto/multiarith_chain.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Evo/multiarith_chain.out 2>&1&
nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Vendi_chain/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Auto/multiarith_chain.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Evo/multiarith_chain.out 2>&1&

nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Vendi_star/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Auto/multiarith_star.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Evo/multiarith_star.out 2>&1&
nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Vendi_star/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Auto/multiarith_star.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Evo/multiarith_star.out 2>&1&

nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent  > log/Qwen/Vendi/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent  > log/Qwen/Auto/multiarith.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent  > log/Qwen/Evo/multiarith.out 2>&1&
nohup python -u experiments_vendi_cache/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent  > log/Deepseek/Vendi/multiarith.out 2>&1&
nohup python -u experiments/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Auto/multiarith.out 2>&1&
nohup python -u experiments_Evo/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent  > log/Deepseek/Evo/multiarith.out 2>&1&




#AQUA
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent  > log/Deepseek/Normal/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Chain > log/Deepseek/Normal/aqua_chain.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Star  > log/Deepseek/Normal/aqua_star.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names NormalAgent --mode Layered > log/Deepseek/Normal/aqua_layered.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent  > log/Qwen/Normal/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/aqua_chain.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star  > log/Qwen/Normal/aqua_star.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/aqua_layered.out 2>&1 &

nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --mode Chain > log/Deepseek/Chain/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --mode Star  > log/Deepseek/Star/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --mode Layered > log/Deepseek/Layered/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  > log/Deepseek/MAS/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Chain > log/Qwen/Chain/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Star  > log/Qwen/Star/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Layered > log/Qwen/Layered/aqua.out 2>&1 &
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct > log/Qwen/MAS/aqua.out 2>&1 &

nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Vendi_layered/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Auto/aqua_layered.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/aqua_layered.out 2>&1&
nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Vendi_layered/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Auto/aqua_layered.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/aqua_layered.out 2>&1&

nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Vendi_chain/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Auto/aqua_chain.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Evo/aqua_chain.out 2>&1&
nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Vendi_chain/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Auto/aqua_chain.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Evo/aqua_chain.out 2>&1&

nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Vendi_star/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Auto/aqua_star.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Evo/aqua_star.out 2>&1&
nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Vendi_star/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Auto/aqua_star.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Evo/aqua_star.out 2>&1&

nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent  > log/Qwen/Vendi/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent  > log/Qwen/Auto/aqua.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent  > log/Qwen/Evo/aqua.out 2>&1&
nohup python -u experiments_vendi_cache/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent  > log/Deepseek/Vendi/aqua.out 2>&1&
nohup python -u experiments/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Auto/aqua.out 2>&1&
nohup python -u experiments_Evo/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent  > log/Deepseek/Evo/aqua.out 2>&1&

#TODO
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent  > log/Qwen/Normal/humaneval.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/humaneval_chain.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star  > log/Qwen/Normal/humaneval_star.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/humaneval_layered.out 2>&1 &


nohup python -u experiments/gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct  --mode Chain > log/Qwen/Chain/gsm8k1.out 2>&1 &
nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Evo/gsm8k_chain.out 2>&1&
nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Evo/gsm8k_star.out 2>&1&
nohup python -u experiments_Evo/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/gsm8k_layered.out 2>&1&
#Once
nohup python -u experiments_init_once/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/mmlu_init1.out 2>&1&
nohup python -u experiments_init_once/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/gsm8k_init1.out 2>&1&
nohup python -u experiments_init_once/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/aqua_init1.out 2>&1&
nohup python -u experiments_init_once/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/multiarith_init1.out 2>&1&
nohup python -u experiments_init_once/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/svamp_init1.out 2>&1&
nohup python -u experiments_init_once/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/humaneval_init1.out 2>&1&

nohup python -u experiments_auto_once/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/mmlu1.out 2>&1&
nohup python -u experiments_auto_once/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/gsm8k1.out 2>&1&
nohup python -u experiments_auto_once/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/aqua1.out 2>&1&
nohup python -u experiments_auto_once/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/multiarith1.out 2>&1&
nohup python -u experiments_auto_once/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/svamp1.out 2>&1&
nohup python -u experiments_auto_once/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/humaneval1.out 2>&1&

nohup python -u experiments_evo_once/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/mmlu_evo.out 2>&1&
nohup python -u experiments_evo_once/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/gsm8k_evo.out 2>&1&
nohup python -u experiments_evo_once/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/aqua_evo.out 2>&1&
nohup python -u experiments_evo_once/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/multiarith_evo.out 2>&1&
nohup python -u experiments_evo_once/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/svamp_evo.out 2>&1&
nohup python -u experiments_evo_once/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Once/humaneval_evo.out 2>&1&

#k
nohup python -u experiments_k1/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/mmlu_k1.out 2>&1&
nohup python -u experiments_k1/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/gsm8k_k1.out 2>&1&
nohup python -u experiments_k1/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/aqua_k1.out 2>&1&
nohup python -u experiments_k1/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/multiarith_k1.out 2>&1&
nohup python -u experiments_k1/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/svamp_k1.out 2>&1&
nohup python -u experiments_k1/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/humaneval_k1.out 2>&1&

nohup python -u experiments_k5/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/mmlu_k5.out 2>&1&
nohup python -u experiments_k5/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/gsm8k_k5.out 2>&1&
nohup python -u experiments_k5/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/aqua_k5.out 2>&1&
nohup python -u experiments_k5/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/multiarith_k5.out 2>&1&
nohup python -u experiments_k5/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/svamp_k5.out 2>&1&
nohup python -u experiments_k5/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/K/humaneval_k5.out 2>&1&

#Ablation
nohup python -u experiments_w_avgdiv/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/w_avgdiv/mmlu1.out 2>&1&
nohup python -u experiments_w_avgdiv/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/w_avgdiv/gsm8k1.out 2>&1&
nohup python -u experiments_w_avgdiv/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/w_avgdiv/aqua1.out 2>&1&
# nohup python -u experiments_w_avgdiv/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/w_avgdiv/multiarith.out 2>&1&
nohup python -u experiments_w_avgdiv/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/w_avgdiv/svamp1.out 2>&1&
nohup python -u experiments_w_avgdiv/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/w_avgdiv/humaneval1.out 2>&1&

nohup python -u experiments_wo_div/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_div/mmlu1.out 2>&1&
nohup python -u experiments_wo_div/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_div/gsm8k1.out 2>&1&
nohup python -u experiments_wo_div/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_div/aqua1.out 2>&1&
# nohup python -u experiments_wo_div/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_div/multiarith.out 2>&1&
nohup python -u experiments_wo_div/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_div/svamp1.out 2>&1&
nohup python -u experiments_wo_div/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_div/humaneval1.out 2>&1&

nohup python -u experiments_wo_format/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_format/mmlu1.out 2>&1&
nohup python -u experiments_wo_format/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_format/gsm8k1.out 2>&1&
nohup python -u experiments_wo_format/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_format/aqua1.out 2>&1&
# nohup python -u experiments_wo_format/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_format/multiarith.out 2>&1&
nohup python -u experiments_wo_format/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_format/svamp1.out 2>&1&
nohup python -u experiments_wo_format/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_format/humaneval1.out 2>&1&

nohup python -u experiments_wo_select/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_select/mmlu1.out 2>&1&
nohup python -u experiments_wo_select/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_select/gsm8k1.out 2>&1&
nohup python -u experiments_wo_select/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_select/aqua1.out 2>&1&
# nohup python -u experiments_wo_select/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_select/multiarith.out 2>&1&
nohup python -u experiments_wo_select/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_select/svamp1.out 2>&1&
nohup python -u experiments_wo_select/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_select/humaneval1.out 2>&1&

nohup python -u experiments_wo_rel/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/mmlu1.out 2>&1&
nohup python -u experiments_wo_rel/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/gsm8k1.out 2>&1&
nohup python -u experiments_wo_rel/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/aqua1.out 2>&1&
# nohup python -u experiments_wo_rel/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/multiarith.out 2>&1&
nohup python -u experiments_wo_rel/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/svamp1.out 2>&1&
nohup python -u experiments_wo_rel/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/humaneval1.out 2>&1&

#wo_sel_div/new_autoagents
nohup python -u experiments_wo_seldiv/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/mmlu_new.out 2>&1&
nohup python -u experiments_wo_seldiv/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/gsm8k_new.out 2>&1&
nohup python -u experiments_wo_seldiv/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/aqua_new.out 2>&1&
# nohup python -u experiments_wo_rel/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/wo_rel/multiarith.out 2>&1&
nohup python -u experiments_wo_seldiv/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/svamp_new.out 2>&1&
nohup python -u experiments_wo_seldiv/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Auto/humaneval_new.out 2>&1&

#IO
nohup python -u experiments_IO/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  > log/Deepseek/IO/mmlu2.out 2>&1&
nohup python -u experiments_IO/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community   > log/Deepseek/IO/gsm8k2.out 2>&1&
nohup python -u experiments_IO/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  > log/Deepseek/IO/aqua2.out 2>&1&
nohup python -u experiments_IO/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  > log/Deepseek/IO/multiarith2.out 2>&1&
nohup python -u experiments_IO/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community   > log/Deepseek/IO/svamp2.out 2>&1&
nohup python -u experiments_IO/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community   > log/Deepseek/IO/humaneval2.out 2>&1&

nohup python -u experiments_IO/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community  --cot> log/Deepseek/COT/mmlu2.out 2>&1&
nohup python -u experiments_IO/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --cot   > log/Deepseek/COT/gsm8k2.out 2>&1&
nohup python -u experiments_IO/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --cot > log/Deepseek/COT/aqua2.out 2>&1&
nohup python -u experiments_IO/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --cot > log/Deepseek/COT/multiarith2.out 2>&1&
nohup python -u experiments_IO/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --cot > log/Deepseek/COT/svamp2.out 2>&1&
nohup python -u experiments_IO/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --cot  > log/Deepseek/COT/humaneval2.out 2>&1&

#EVO_SVAMP
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Evo/svamp.out 2>&1 &
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Layered > log/Qwen/Evo/svamp_layered.out 2>&1 &
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Star > log/Qwen/Evo/svamp_star.out 2>&1 &
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent --mode Chain > log/Qwen/Evo/svamp_chain.out 2>&1 &

nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Evo/svamp.out 2>&1 &
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Layered > log/Deepseek/Evo/svamp_layered.out 2>&1 &
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Star > log/Deepseek/Evo/svamp_star.out 2>&1 &
nohup python -u experiments_Evo/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent --mode Chain > log/Deepseek/Evo/svamp_chain.out 2>&1 &




nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent  > log/Qwen/Normal/humaneval.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Chain > log/Qwen/Normal/humaneval_chain.out 2>&1 &
nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Layered > log/Qwen/Normal/humaneval_layered.out 2>&1 &
# nohup python -u experiments/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names NormalAgent --mode Star  > log/Qwen/Normal/aqua_star.out 2>&1 &

nohup python -u experiments_Evo/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Evo/mmlu.out 2>&1 &

# batch 1_n
nohup python -u experiments_batch_1_n/run_mmlu.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/1_10/mmlu.out 2>&1&
nohup python -u experiments_batch_1_n/run_aqua.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/1_10/aqua.out 2>&1&
nohup python -u experiments_batch_1_n/run_gsm8k.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/1_10/gsm8k.out 2>&1&
nohup python -u experiments_batch_1_n/run_multiarith.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/1_10/multiarith.out 2>&1&
nohup python -u experiments_batch_1_n/run_svamp.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/1_10/svamp.out 2>&1&
nohup python -u experiments_batch_1_n/run_humaneval.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/1_10/humaneval.out 2>&1&
# batch n_n
nohup python -u experiments_batch_n_n/run_mmlu.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/10_10/mmlu.out 2>&1&
nohup python -u experiments_batch_n_n/run_aqua.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/10_10/aqua.out 2>&1&
nohup python -u experiments_batch_n_n/run_gsm8k.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/10_10/gsm8k.out 2>&1&
nohup python -u experiments_batch_n_n/run_multiarith.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/10_10/multiarith.out 2>&1&
nohup python -u experiments_batch_n_n/run_svamp.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/10_10/svamp.out 2>&1&
nohup python -u experiments_batch_n_n/run_humaneval.py --batch_size 10 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Batch/10_10/humaneval.out 2>&1&
#random
nohup python -u experiments_random/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Random/mmlu.out 2>&1&
nohup python -u experiments_random/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Random/aqua.out 2>&1&
nohup python -u experiments_random/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Random/gsm8k.out 2>&1&
nohup python -u experiments_random/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Random/multiarith.out 2>&1&
nohup python -u experiments_random/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Random/svamp.out 2>&1&
nohup python -u experiments_random/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Random/humaneval.out 2>&1&

#OBJ figure
nohup python -u experiments_k1_obj/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Obj/mmlu_k1_full.out 2>&1&
nohup python -u experiments_k3_obj/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Obj/mmlu_k3_full.out 2>&1&
nohup python -u experiments_k5_obj/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Obj/mmlu_k5_full.out 2>&1&
nohup python -u experiments_wo_format_obj/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Obj/mmlu_woformat_full.out 2>&1&
nohup python -u experiments_random_obj/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Obj/mmlu_random_full.out 2>&1&

#worst (MMLU record Objectives)
nohup python -u experiments_worst/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worst/mmlu.out 2>&1&
nohup python -u experiments_worst/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worst/aqua.out 2>&1&
nohup python -u experiments_worst/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worst/gsm8k.out 2>&1&
nohup python -u experiments_worst/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worst/multiarith.out 2>&1&
nohup python -u experiments_worst/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worst/svamp.out 2>&1&
nohup python -u experiments_worst/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worst/humaneval.out 2>&1&

#worstselector(MMLU record Objectives)
nohup python -u experiments_worstselector/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worstselect/mmlu.out 2>&1&
nohup python -u experiments_worstselector/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worstselect/aqua.out 2>&1&
nohup python -u experiments_worstselector/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worstselect/gsm8k.out 2>&1&
nohup python -u experiments_worstselector/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worstselect/multiarith.out 2>&1&
nohup python -u experiments_worstselector/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worstselect/svamp.out 2>&1&
nohup python -u experiments_worstselector/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Analyze/Worstselect/humaneval1.out 2>&1&

nohup python -u experiments_full/run_mmlu.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Full/mmlu.out 2>&1&
nohup python -u experiments_full/run_aqua.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Full/aqua.out 2>&1&
nohup python -u experiments_full/run_gsm8k.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Full/gsm8k.out 2>&1&
nohup python -u experiments_full/run_multiarith.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Full/multiarith.out 2>&1&
nohup python -u experiments_full/run_svamp.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Full/svamp.out 2>&1&
nohup python -u experiments_full/run_humaneval.py --batch_size 40 --llm_name qwen/qwen-2.5-72b-instruct --agent_names AutoAgent > log/Qwen/Full/humaneval1.out 2>&1&

nohup python -u experiments_full/run_mmlu.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Full/mmlu.out 2>&1&
nohup python -u experiments_full/run_aqua.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Full/aqua.out 2>&1&
nohup python -u experiments_full/run_gsm8k.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Full/gsm8k.out 2>&1&
nohup python -u experiments_full/run_multiarith.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Full/multiarith.out 2>&1&
nohup python -u experiments_full/run_svamp.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Full/svamp.out 2>&1&
nohup python -u experiments_full/run_humaneval.py --batch_size 40 --llm_name deepseek/deepseek-v3/community --agent_names AutoAgent > log/Deepseek/Full/humaneval1.out 2>&1&