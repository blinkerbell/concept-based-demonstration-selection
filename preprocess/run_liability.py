import os
import argparse

# Set up argument parser
parser = argparse.ArgumentParser(description='Run liability preprocessing specified k value')
parser.add_argument('--k', type=int, required=True, help='The k value')

# Parse arguments
args = parser.parse_args()
k = args.k

commands = []

commands.append(f"python liability.py --do_test --test_k {k}")
commands.append(f"python liability.py --do_train --test_k {k}")

for c in commands:
    os.system(c)
