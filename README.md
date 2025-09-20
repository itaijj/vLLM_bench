## Part 1: Deploy an Open-Source LLM

This project uses vLLM as the inference server for Meta-Llama-3.2-1B-Instruct because it provides high-throughput, memory-efficient inference with OpenAI-compatible REST API support.

## Quickstart
Make sure you have nvidia GPU with at least 4GB of Dedicated GPU memory and recently released linux OS ( tested on Ubuntu 22.04.5 LTS  ) 

run 
```bash
pip install -r requirments.txt
```

### Launch the vLLM Server
make sure you have a user and asked in hugging face for access for the model you chose ( in this example [meta-llama/Llama-3.2-1B-Instruct](https://huggingface.co/meta-llama/Llama-3.2-1B-Instruct) )
and got Hugging face generated token (https://huggingface.co/settings/tokens)
replace "you_hf_token" with the generated token in the following command
set up .env file with 
```bash
export HUGGING_FACE_HUB_TOKEN="you_hf_token"
```

then run 
```bash
./run_vllm
```

## Part 2: Benchmark the Deployed Model
### 2. Launch the benchmar
```bash
./run_benchmark
```

## Why vLLM?
vLLM is chosen for its efficient memory usage, high throughput, and native support for OpenAI-compatible REST APIs, making it ideal for local LLM inference and integration with existing OpenAI tools.


