#!/usr/bin/env sh

WORK_PATH=$(dirname $0)

python -u -W ignore imagenet.py \
    --data /path/to/your/ImageNet \
    -a densenet121 \
    --use_sw \
    --sw_type 2 \
    --num_pergroup 16 \
    --T 5 \
    -j 16 \
    -b 256 \
    --warmup_epochs 0 \
    --base_lr 0.1 \
    --step="30, 60, 90" \
    --epochs 100 \
    --save-path ${WORK_PATH} \
    2>&1 | tee ${WORK_PATH}/log.txt
