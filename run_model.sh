#!/bin/bash
wget https://quoref-dataset.s3-us-west-2.amazonaws.com/xlnet_baseline_model/xlnet_quoref_model.tar.gz
tar -xvzf xlnet_quoref_model.tar.gz
python run_squad.py --do_eval --do_lower_case --train_file null --predict_file /quoref/nolabels.json --output_dir xlnet_quoref_model_out --model_type xlnet --model_name_or_path xlnet-base-cased
cp xlnet_quoref_model_out/predictions_.json /results/predictions.json
