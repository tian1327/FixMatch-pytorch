2024/07/14

```bash
# run fixmatch for semi-aves
python train.py --dataset semi_aves --num-labeled 5959 --arch resnet50 --init inat --batch-size 64 --mu 5 --lr 0.01 --threshold 0.8 --total-steps 50000 --expand-labels --seed 1 --out results/aves_fixmatch

```