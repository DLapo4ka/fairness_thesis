cd /home/dalapko/lib/fairness-rejection;

# train vanilla and PA-specific LEACE models on several languages of MTC, early stopping by accuracy
# en
# train vanilla models and eval wrt age, gender, country
export TRANSFORMERS_OFFLINE="1"
for seed in 18 19 20
do
	python3 fairlib --dataset MTC_age --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 16 --dropout 0.1 --weight_decay 0.01 --lr 1e-06 --epochs 20 --epochs_since_improvement 5 --data_dir /home/dalapko/MTC_English --base_seed ${seed} --model_name bert-base-cased --exp_id multilingual/English/opt_acc_mtc_age_unbal/fairlib_bert_no_sn_MTC_age_vanilla_${seed} --device_id 0;

# --LEACE --leace_mode="last"(/cls/all)
done
