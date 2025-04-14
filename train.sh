METHOD=direct
LR=1e-2
N_PREFIX=10
TASK=tune
SPLIT=train
STEP=1000
BATCH=64
SEED=$(python -c "import json; print(json.load(open('config/random_seed.json'))['seed'])")
MODEL="kkirchheim/german-gpt2-medium"
MODEL_NAME="german-gpt2-medium"
CUDA_VISIBLE_DEVICES=0 python train.py --gpt2 $MODEL --seed $SEED --task $TASK --split $SPLIT --method $METHOD --n_gpu 1 --tensorize_dir tensorized --out_dir checkpoints/$MODEL_NAME/$TASK-$SPLIT/prefix={$N_PREFIX}-{$METHOD}-lr={$LR}-initByVocab --batch_size $BATCH --lr $LR --n_prefix_tokens $N_PREFIX --num_training_steps $STEP
