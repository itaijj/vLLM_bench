export $(grep -v '^#' .env | xargs)

python3 -m vllm.entrypoints.openai.api_server \
  --model meta-llama/Llama-3.2-1B-Instruct \
  --host 0.0.0.0 --port 8000 \
  --quantization bitsandbytes   \
  --max-model-len 1024 \
  --kv-cache-dtype fp8_e5m2 \
  --max-num-seqs 50