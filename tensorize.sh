METHOD=direct
N_PREFIX=10
TASK=tune
SPLIT=train
SEED=$(python -c "import json; print(json.load(open('config/random_seed.json'))['seed'])")
MODEL="/beegfs/u/bav0765/RALM/selfsupervised/models--kkirchheim--german-gpt2-medium/snapshots/6f04bd44efb4fcb6c2a45c4de6e91883825ddebb/"
CUDA_VISIBLE_DEVICES=0 python train.py --task $TASK --gpt2 $MODEL --split $SPLIT --tensorize_dir tensorized --seed $SEED --method $METHOD --n_prefix_tokens $N_PREFIX --do_tensorize --n_gpu 1 --n_process 10
