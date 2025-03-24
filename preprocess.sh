# enable virtual environment (as proposed in the original README)
source "env\Scripts\activate"

# Generate random seed
cd config
python -c "
import random
import json
with open('random_seed.json', 'w') as f:
    json.dump({'seed': random.randint(0, 2**32 - 1)}, f)
"

# Reset the data directory
cd ..
rm -r -f data

# Download and preprocess the data
cd preprocess
huggingface-cli login --token="xyz" # data is proprietary and therefore not publicly accessible 
python run_liability.py --k 4 # adjust k as needed

# Quick utf-8 fix for the JSONL files in data/liability
cd ../data/liability
python -c '
import json
import glob

for fname in glob.glob("*.jsonl"):
    with open(fname, "r", encoding="utf-8") as f:
        lines = f.readlines()
    with open(fname, "w", encoding="utf-8") as f:
        for line in lines:
            obj = json.loads(line)
            f.write(json.dumps(obj, ensure_ascii=False) + "\n")
'

# back to main directory
cd ../..