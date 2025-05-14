TRAIN_METHOD=direct
TEST_METHOD=direct
LR=1e-2
N_PREFIX=10
DATASET=liability
TRAIN_TASK=tune
SPLIT=train
MODEL="kkirchheim/german-gpt2-medium"
TRAIN_SIZE=0
STEP=516
K=100
CUDA_VISIBLE_DEVICES=0 python test.py\
    --dataset $DATASET\
    --gpt $MODEL\
    --method $TEST_METHOD\
    --test_batch_size 64\
    --out_dir out/$MODEL\
    --k $K\
    --embedding_dir embeddings/\
    --use_demonstrations\
    --concept_temperature 50\
    --similarity_temperature 0.1\
    --train_size $TRAIN_SIZE\
    --difficulty concept_likelihood\
    --n_prefix_tokens $N_PREFIX\
    --concept_dir concept_likelihood/$MODEL/$TRAIN_TASK-$SPLIT-$TRAIN_SIZE/$DATASET-$TRAIN_METHOD-prefix=$N_PREFIX-lr=$LR-$STEP\
    --prefix_embed_file checkpoints/$MODEL/$TRAIN_TASK-$SPLIT/prefix={$N_PREFIX}-{$TRAIN_METHOD}-lr={$LR}-initByVocab/soft_embeddings-$STEP.pt\
    --prior easiest\
