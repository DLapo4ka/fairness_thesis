cd /home/dalapko/lib/fairness-rejection;
export TRANSFORMERS_OFFLINE="1"
for pa in age gender country ethnicity
do
	for seed in 18 19 20
	do
		python fairlib --dataset MTC_${pa} --eval --LEACE --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.01 --lr 1e-06 --epochs 20 --epochs_since_improvement 5 --data_dir /home/dalapko/MTC_English --base_seed ${seed} --model_name bert-base-cased --weights_dataset_name MTC_country --weights_dir multilingual/English/opt_acc_mtc_country_unbal/fairlib_bert_no_sn_MTC_country_LEACE_${seed} --exp_id multilingual/English/opt_acc_mtc_${pa}_unbal/fairlib_bert_no_sn_MTC_${pa}_eval_LEACE_${seed} --device_id 0;
	done
done
