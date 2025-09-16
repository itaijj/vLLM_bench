# vLLM_bench
Create a folder for you project
mkdir vllm-llama3
cd vllm-llama3

Build the Docker Image

docker build -t vllm-llama3 .

Run the Container ( if you have GPU)
docker run --gpus all -p 8000:8000 vllm-llama3

This will start an OpenAI-compatible API server on port 8000.

Test the API

query the LLM model using

curl http://localhost:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "meta-llama/Meta-Llama-3-8B-Instruct",
    "prompt": "Write a short haiku about AI.",
    "max_tokens": 50
  }'
