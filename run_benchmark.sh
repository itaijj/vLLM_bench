

for variable in 1 5 10 15 25 30 35 40 45 50 55 100
do
  # Commands to execute for each item
  echo "Running benchmark with  GUIDELLM__MAX_CONCURRENCY = $variable"
   export GUIDELLM__MAX_CONCURRENCY=40; guidellm benchmark \
  --target "http://localhost:8000" \
  --rate-type throughput \
  --max-requests 100 \
  --data "prompt_tokens=128,output_tokens=64" \
  --output-path "./benchmark-results/throughput-$variable.json"
done