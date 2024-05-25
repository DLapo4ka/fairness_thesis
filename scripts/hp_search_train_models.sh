cd /home/dalapko/lib/fairness-rejection;

# train vanilla and PA-specific LEACE models on several languages of MTC, early stopping by accuracy
# en
export TRANSFORMERS_OFFLINE="1"

# hyperparameter search

for bs in 16 32
do
    for dp in 0.0 0.1
    do
        for wd in 0.0 0.01
        do
            for lr in 0.001 0.0001 0.00001 0.000001
            do
                for seed in 35
                do
                    python fairlib --dataset MTC_age --emb_size 768 --num_classes 2 --num_groups 2 --group_agg_power -1 --encoder_architecture BERT --batch_size ${bs} --test_batch_size 32 --dropout ${dp} --weight_decay ${wd} --lr ${lr} --epochs 20 --epochs_since_improvement 5 --data_dir /home/dalapko/MTC_English --base_seed ${seed} --model_name "bert-base-cased" --exp_id hp_search_mtc/English/fairlib_bert_MTC_${bs}_${dp}_${wd}_${lr}_${seed} --device_id 0;
                done
            done
        done
    done
done

