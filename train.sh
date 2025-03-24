METHOD=channel
LR=1e-2
N_PREFIX=10
TASK=tune
SPLIT=train
SEED=$(python -c "import json; print(json.load(open('config/random_seed.json'))['seed'])")
MODEL="kkirchheim/german-gpt2-medium"
CUDA_VISIBLE_DEVICES=0 python train.py --gpt2 $MODEL --task $TASK --split $SPLIT --seed $SEED --method $METHOD --n_gpu 1 --tensorize_dir tensorized --out_dir checkpoints/$MODEL/$TASK-$SPLIT/prefix={$N_PREFIX}-{$METHOD}-lr={$LR}-initByVocab --batch_size 8 --lr $LR --n_prefix_tokens $N_PREFIX --num_training_steps 1000
