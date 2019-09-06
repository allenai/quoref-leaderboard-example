#!/bin/bash
wget https://quoref-dataset.s3-us-west-2.amazonaws.com/xlnet_baseline_model/xlnet_quoref_model.tar.gz
tar -xvzf xlnet_quoref_model.tar.gz
# Copying the input file to /tmp because /quoref in read-only.
cp /quoref/nolabels.json /tmp/input.json
python run_squad.py --do_eval --do_lower_case --train_file null --predict_file /tmp/input.json --output_dir xlnet_quoref_model_out --max_seq_length 512 --doc_stride 128 --model_type xlnet --model_name_or_path xlnet-base-cased
cp xlnet_quoref_model_out/predictions_.json /results/predictions.json
