#!/bin/bash

## ENVIRONMENT SETTINGS
#SBATCH --get-user-env=L          # Replicate login environment

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=aves_fixmatch
##SBATCH --account=132713661936
#SBATCH --time=8:00:00
#SBATCH --ntasks=8
#SBATCH --ntasks-per-node=8
#SBATCH --nodes=1
#SBATCH --mem=20G
#SBATCH --output=slurm_log/%x.%j
#SBATCH --gres=gpu:a100:1             # Request 1 GPUs per node
##SBATCH --gres=gpu:rtx:1 
##SBATCH --gres=gpu:t4:1
#SBATCH --partition=gpu          # Submit job to the gpu queue

##----------- execute python script
python train.py --dataset semi_aves --num-labeled 5959 --arch resnet50 --init inat --batch-size 32 --mu 5 --lr 0.01 --threshold 0.8 --total-steps 50000 --expand-labels --seed 1 --out results/aves_fixmatch --no-progress


##----------- Job Environment variables
echo "Job ID: $SLURM_JOBID"
echo "Job submission directory: $SLURM_SUBMIT_DIR"
echo "Temp directory: $TMPDIR"
echo "Scratch directory: $SCRATCH"