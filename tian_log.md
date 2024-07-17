2024/07/14

```bash
# run fixmatch for semi-aves
python train.py --dataset semi_aves --num-labeled 5959 --arch resnet50 --init inat --batch-size 32 --mu 5 --lambda-u 1.0 --lr 0.001 --wdecay 1e-4 --threshold 0.8 --total-steps 50000 --expand-labels --seed 1 --out results/aves_fixmatch_bs32_mu1_lmd1.0_thd0.8_lr1e-3_wd1e-4_iter50000

# use the code for reproduce the labeled train + val by setting lambda-u to 0.0 
python train.py --dataset semi_aves --num-labeled 5959 --arch resnet50 --init inat --batch-size 32 --mu 1 --lambda-u 0.0 --lr 0.001 --wdecay 1e-4  --threshold 0.8 --total-steps 15000 --expand-labels --seed 1 --out results/aves_fixmatch_bs32_mu1_lmd0.0_thd0.8_lr1e-3_wd1e-4_iter15000



```