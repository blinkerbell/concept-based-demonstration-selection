METHOD=direct
N_PREFIX=10
TASK=tune
SPLIT=train
SEED=$(python -c "import json; print(json.load(open('config/random_seed.json'))['seed'])")
MODEL="kkirchheim/german-gpt2-medium"
CUDA_VISIBLE_DEVICES=0 python train.py\
  --task $TASK\
  --split $SPLIT\
  --tensorize_dir tensorized\
  --seed $SEED\
  --method $METHOD\
  --n_prefix_tokens $N_PREFIX\
  --do_tensorize\
  --n_gpu 1\
  --n_process 10\
  --gpt2 $MODEL
