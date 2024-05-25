cd /home/dalapko/lib/fairness-rejection;
# training for BTEO debiasing method
# here we use the same hyperparameters as for vanilla model

for pa in age gender country ethnicity
do
    for seed in 18 19 20
    do
        python fairlib --dataset MTC_${pa} --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.01 --lr 1e-06 --epochs 20 --epochs_since_improvement 5 --BT Resampling --BTObj EO --early_stopping_criterion max_balanced_dto --data_dir /home/dalapko/MTC_English --base_seed ${seed} --model_name bert-base-cased --exp_id multilingual/English/opt_acc_mtc_${pa}_unbal/fairlib_bert_no_sn_MTC_${pa}_train_BTEO_${seed} --device_id 0;
    done
done

# --joint_protected_attrs age gender country --num_groups 8 
