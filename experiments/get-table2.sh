#!/bin/bash

# Run get-table-data.sh with table2-benchmarks.sh
#result=`BENCHMARKS="./table2-benchmarks.sh" ./get-table-data.sh --genmc=1 --wb --hmc=2 --imm-wb --nidhugg=3 --power --cdschecker=4 --herd=5 --rmem=6 --dartagnan=7 --dart-arm`
#result=`BENCHMARKS="./table2-benchmarks.sh" ./get-table-data.sh --armcbmc=1 --context-bound=1 --hmc=2 --imm-wb --nidhugg=3 --arm `
result=`BENCHMARKS="./table2-benchmarks.sh" ./get-table-data.sh  --armcbmc=1 --context-bound=7`

# Ignore header and pretty-print rest
# echo "${result}" | head -n 13
# echo "${result}" | tail -n +14 | column -t
echo "${result}" | column -t
