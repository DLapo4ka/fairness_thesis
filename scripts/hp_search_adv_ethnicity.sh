cd /home/dalapko/lib/fairness-rejection;
export TRANSFORMERS_OFFLINE="1"

# hyperparameter search for Adv model, ethnicity attribute

for lmbd in 0.0001 0.001 0.01 0.1 1 10 100
do
	python fairlib --dataset MTC_ethnicity --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.01 --lr 1e-06 --epochs 20 --epochs_since_improvement 5 --early_stopping_criterion max_balanced_dto --data_dir /home/dalapko/MTC_English --base_seed 1 --adv_debiasing --adv_lambda ${lmbd} --model_name bert-base-cased --exp_id hp_search_new_data/fairlib_bert_MTC_ethnicity_adv/${lmbd} --device_id 0
done 
