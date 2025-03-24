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

# back to main directory
cd ..
