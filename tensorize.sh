METHOD=direct
N_PREFIX=10
TASK=tune
SPLIT=train
MODEL="kkirchheim/german-gpt2-medium"
CUDA_VISIBLE_DEVICES=0 python train.py\
  --task $TASK\
  --gpt2 $MODEL\
  --split $SPLIT\
  --tensorize_dir tensorized\
  --seed 100\
  --method $METHOD\
  --n_prefix_tokens $N_PREFIX\
  --do_tensorize\
  --n_gpu 1\
  --n_process 10
