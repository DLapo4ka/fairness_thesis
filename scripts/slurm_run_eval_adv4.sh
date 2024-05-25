#!/bin/bash
#SBATCH --job-name="fair_eval_adv_joint"
#SBATCH --time=0-1:0
#SBATCH --gpus=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mail-user=dalapko@edu.hse.ru
#SBATCH --mail-type=ALL


module purge
source ~/.bash_profile
conda activate /home/dalapko/fair_env_39
#Executable
./eval_models_adv_joint.sh
