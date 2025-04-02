while getopts "k:" opt; do
  case "$opt" in
    k)
      k="$OPTARG"
      ;;
    *)
      echo "Usage: source script.sh -k <value>"
      return 1
      ;;
  esac
done

if [ -z "$k" ]; then
  echo "Error: -k argument is required."
  echo "Usage: source script.sh -k <value>"
  return 1
fi

echo "k = $k"

# Generate random seed
cd config
python -c "
import random
import json
with open('random_seed.json', 'w') as f:
    json.dump({'seed': random.randint(0, 2**32 - 1)}, f)
"
cd ..

# Download and preprocess the data
cd preprocess
#huggingface-cli login --token="xyz"
python run_liability.py --k $k
cd ..
