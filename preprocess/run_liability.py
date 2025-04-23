import os
import argparse

k = 100

commands = []

commands.append(f"python liability.py --do_test --test_k {k}")
commands.append(f"python liability.py --do_train --test_k {k}")

for c in commands:
    os.system(c)
