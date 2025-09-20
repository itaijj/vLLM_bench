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
### 2. Launch the benchmark
```bash
./run_benchmark
```

## Why vLLM?
vLLM is chosen for its efficient memory usage, high throughput, and native support for OpenAI-compatible REST APIs, making it ideal for local LLM inference.

## How I configure vLLM
I run vLLM with limiting it's maximum concurrent requests to 50 using --max-num-seqs 50 to make the analysis more interesting ( and not finish my CPU/GPU memory).
I also choose Meta-Llama-3.2-1B-Instruct as it fits my GPU memory.

## How I configure GuideLLM benchmark 
GuideLLM is part of the vLLM project so it is natural to choose it if use vLLM.
I configured it to save all benchmark results to benchmark-results folder to be later analyzed by python code.
I configured --rate-type throughput and changed the env variable GUIDELLM__MAX_CONCURRENCY values multiple times to control the level of concurrency while sending benchmark requests as asked by part 3 analysis.
each level of GUIDELLM__MAX_CONCURRENCY creates a a json in benchmark-results folder which responds to a point in the graphs asked by part 3.

I also set --max-requests 100 to make the benchmark run short ( auto value is 1000 which takes more than 1h per run),
I set prompt_tokens=128,output_tokens=64 to make it supported by the chosen LLM while also not too slow.

## Results and analysis

[link text](benchmark_metrics_summary.csv)

## A graph showing throughput (output tokens/sec) vs. the number of concurrent requests
https://github.com/itaijj/vLLM_bench/blob/main/plots/throughput.png?raw=true

## A graph showing throughput (output tokens/sec) vs. the number of concurrent requests
https://github.com/itaijj/vLLM_bench/blob/main/plots/TTFT.png?raw=true





