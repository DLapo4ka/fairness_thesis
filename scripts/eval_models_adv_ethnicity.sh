cd /home/dalapko/lib/fairness-rejection;
export TRANSFORMERS_OFFLINE="1"
for pa1 in ethnicity
do
	for pa in age gender country ethnicity
	do
		for seed in 18 19 20
		do
			python fairlib --dataset MTC_${pa} --eval --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.01 --lr 1e-06 --epochs 20 --epochs_since_improvement 5 --data_dir /home/dalapko/MTC_English --base_seed ${seed} --adv_debiasing --adv_lambda 10 --model_name bert-base-cased --weights_dataset_name MTC_${pa1} --weights_dir multilingual/English/opt_acc_mtc_${pa1}_unbal/fairlib_bert_no_sn_MTC_${pa1}_train_Adv_${seed} --exp_id multilingual/English/opt_acc_mtc_${pa}_unbal/fairlib_bert_no_sn_MTC_${pa}_eval_Adv_${seed} --device_id 0
		done
	done
done
