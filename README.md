# Local LLM Inference with vLLM

This project uses vLLM as the inference server for Meta-Llama-3.2-1B-Instruct because it provides high-throughput, memory-efficient inference with OpenAI-compatible REST API support.

## Quickstart
Make sure you have nvidia GPU with at least 4GB of Dedicated GPU memory and recently released linux OS ( tested on Ubuntu 22.04.5 LTS  ) with Python version >= 3.10.12
### 1. Install vLLM

#### Using pip (recommended for Linux/Mac/Windows with Python 3.8+):
```bash
pip install vllm
```

### 3. Launch the vLLM Server
make sure you have a user and asked in hugging face for access for the model you chose ( in this eample [meta-llama/Llama-3.2-1B-Instruct](https://huggingface.co/meta-llama/Llama-3.2-1B-Instruct) )
and got Hugging face generated token (https://huggingface.co/settings/tokens)
replace "you_hf_token" with the generated token in the following command

export HUGGING_FACE_HUB_TOKEN="you_hf_token";python3 -m vllm.entrypoints.openai.api_server \
  --model meta-llama/Llama-3.2-1B-Instruct \
  --host 0.0.0.0 --port 8000 \
  --quantization bitsandbytes   \
  --max-model-len 1024 \
  --kv-cache-dtype fp8_e5m2 \
  --max-num-seqs 50


### 4. Example API Request

#### Chat Completions (OpenAI format):
```bash
curl http://localhost:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "meta-llama/Meta-Llama-3.2-1B-Instruct",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

#### Completions:
```bash
curl http://localhost:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "meta-llama/Meta-Llama-3.2-1B-Instruct",
    "prompt": "Once upon a time,",
    "max_tokens": 50
  }'
```

---

## Why vLLM?
vLLM is chosen for its efficient memory usage, high throughput, and native support for OpenAI-compatible REST APIs, making it ideal for local LLM inference and integration with existing OpenAI tools.

## Cross-Platform Launch Script
See `launch_vllm` script for a quick start on Windows or Linux/Mac.
