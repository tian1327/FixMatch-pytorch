#!/bin/bash

## ENVIRONMENT SETTINGS
#SBATCH --get-user-env=L          # Replicate login environment

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=aves_fixmatch
##SBATCH --account=132713661936
#SBATCH --time=24:00:00
#SBATCH --ntasks=12
#SBATCH --ntasks-per-node=12
#SBATCH --nodes=1
#SBATCH --mem=60G
#SBATCH --output=slurm_log/%x.%j
#SBATCH --gres=gpu:a100:1             # Request 1 GPUs per node
##SBATCH --gres=gpu:rtx:1 
##SBATCH --gres=gpu:t4:1
#SBATCH --partition=gpu          # Submit job to the gpu queue

##SBATCH --mail-type=ALL 
##SBATCH --mail-user=tian.liu@tamu.edu

##----------- execute python script
#python train.py --dataset semi_aves --num-labeled 5959 --arch resnet50 --init inat --batch-size 32 --mu 5 --lambda-u 1.0 --lr 0.001 --wdecay 1e-4 --threshold 0.8 --total-steps 50000 --expand-labels --seed 1 --out results/fixmatch --no-progress
python train.py --dataset semi_aves --num-labeled 5959 --arch resnet50 --init imagenet --batch-size 32 --mu 5 --lambda-u 1.0 --lr 0.001 --wdecay 1e-4 --threshold 0.8 --total-steps 50000 --expand-labels --seed 1 --out results/fixmatch --no-progress


##----------- Job Environment variables
echo "Job ID: $SLURM_JOBID"
echo "Job submission directory: $SLURM_SUBMIT_DIR"
echo "Temp directory: $TMPDIR"
echo "Scratch directory: $SCRATCH"