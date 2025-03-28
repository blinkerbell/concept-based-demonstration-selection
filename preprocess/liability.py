# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

import datasets
import numpy as np
import json

from fewshot_gym_dataset import FewshotGymDataset, FewshotGymTextToTextDataset

class Liability(FewshotGymTextToTextDataset):
    
    def __init__(self):
        self.hf_identifier = "liability"
        self.task_type = "text to text"
        self.license = "unknown"

    def get_train_test_lines(self, dataset):

        lines = self.map_hf_dataset_to_list(dataset, "train")

        np.random.seed(self.seed)
        np.random.shuffle(lines)
        
        n = len(lines)

        train_lines = lines[:int(0.99*n)]
        test_lines = lines[int(0.99*n):]

        return train_lines, test_lines

    def map_hf_dataset_to_list(self, hf_dataset, split_name):
        lines = []
        np.random.seed(self.seed)
        for datapoint in hf_dataset[split_name]:
            lines.append((datapoint["input"], datapoint["output"]))
        return lines

    def load_dataset(self):
        return datasets.load_dataset("hyperinfer/selfsupervised-ds")

def main():

    with open('../config/random_seed.json') as f:
        seed = json.load(f)["seed"]

    dataset = Liability()
    dataset.seed = seed  # Pass seed to dataset instance
    
    train, dev, test = dataset.generate_k_shot_data(k=32, seed=seed, path="../data/")

if __name__ == "__main__":
    main()