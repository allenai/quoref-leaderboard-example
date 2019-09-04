# XLNet QA Baseline for Quoref
This repository shows an example submission to the [Quoref leaderboard](https://leaderboard.allenai.org/quoref). The model is [XLNet](https://arxiv.org/abs/1906.08237) based QA model
implemented by HuggingFace in [pytorch-transformers](https://github.com/huggingface/pytorch-transformers). You can find a description of the Quoref dataset and the baseline models in our
[EMNLP 2019 paper](https://www.semanticscholar.org/paper/Quoref%3A-A-Reading-Comprehension-Dataset-with-Dasigi-Liu/3838387ea8dd1bb8c2306be5a63c1c120075c5a2).

The main script is [run_model.sh](run_model.sh) which downloads the XLNet QA model trained on Quoref from S3 and predicts from `/quoref/nolabels.json`, which is the location at which the leaderboard
mounts the input file. It runs two different Beaker experiments for development and test sets, and in both experiments, the input file is mounted at the same location.

Follow the instructions below to create a [Docker](https://www.docker.com) container and publish it as a [Beaker](https://beaker.org/) image, which can then be submitted as a leaderboard entry.

## Requirements

* [Docker](https://www.docker.com)
* [Beaker](https://beaker.org)

## Submitting to the leaderboard

Follow the these steps in the repository root directory:

1. Create a docker image:

        docker build -t xlnet_quoref_model .

2. Upload an image to beaker:

        beaker image create -n my-quoref-model-image xlnet_quoref_model:latest

   **NOTE:** The image name (e.g., `my-quoref-model-image`) should be unique in beaker under your account.

3. Make a submission:
   * Follow the steps on the [Quoref leaderboard](https://leaderboard.allenai.org/quoref/submissions/public) to gain access to making submissions.
   * On the new submission form, make sure to enter your image name (e.g., `my-quoref-model-image`).

