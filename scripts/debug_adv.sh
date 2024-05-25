cd /home/dalapko/lib/fairness-rejection;
# hyperparameter search for Adv debiasing method
# here we use base parameters (such as bs, lr, etc) from hypersearch for base model, and tune only method specific parameters (adv_lambda)
# after hypersearch we use the same method with best parameters to train model with Adv
# NB! Don't forget to add this parameter: " --early_stopping_criterion max_balanced_dto" in the training scripts for Adv model


python fairlib --dataset MTC_age --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.0001 --lr 3e-05 --epochs 1 --epochs_since_improvement 5 --early_stopping_criterion max_balanced_dto --data_dir /home/dalapko/MTC_English --base_seed 1 --adv_debiasing --adv_lambda 1 --model_name bert-base-cased --exp_id DEBUG_adv_loading/fairlib_bert_MTC_age_adv_1/1 --device_id 0;

python fairlib --dataset MTC_age --eval --emb_size 768 --num_classes 2 --group_agg_power -1 --encoder_architecture BERT --batch_size 16 --test_batch_size 32 --dropout 0.1 --weight_decay 0.0001 --lr 3e-05 --epochs 1 --epochs_since_improvement 5 --early_stopping_criterion max_balanced_dto --data_dir /home/dalapko/MTC_English --base_seed 1 --adv_debiasing --adv_lambda 1 --model_name bert-base-cased --weights_dir DEBUG_adv_loading/fairlib_bert_MTC_age_adv_1/1 --exp_id DEBUG_adv_loading/fairlib_bert_MTC_age_adv_loaded_1/1 --device_id 0


