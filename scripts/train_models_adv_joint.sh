cd /home/dalapko/lib/fairness-rejection;

# train Adv models and eval wrt age, gender, country, ethnicity and joint
export TRANSFORMERS_OFFLINE="1"

for pa in joint 
do
	for seed in 18 19 20
	do
		python fairlib --dataset MTC_${pa} --joint_protected_attrs age gender country --emb_size 768 --num_classes 2 --num_groups 8 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.01 --lr 1e-06 --epochs 20 --epochs_since_improvement 5 --early_stopping_criterion max_balanced_dto --data_dir /home/dalapko/MTC_English --base_seed ${seed} --adv_debiasing --adv_lambda 0.01 --model_name bert-base-cased --exp_id multilingual/English/opt_acc_mtc_${pa}_unbal/fairlib_bert_no_sn_MTC_${pa}_train_Adv_${seed} --device_id 0;
	done
done

# --joint_protected_attrs age gender country --num_groups 8
