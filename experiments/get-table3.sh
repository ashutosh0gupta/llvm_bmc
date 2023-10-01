#!/bin/bash

# Run get-table-data.sh with table3-benchmarks.sh
#result=`BENCHMARKS="./table3-benchmarks.sh" ./get-table-data.sh --genmc=1 --wb --hmc=2 --imm-wb --cdschecker=3 --herd=4 --rmem=5 --dartagnan=6 --dart-arm`
#result=`BENCHMARKS="./table3-benchmarks.sh" ./get-table-data.sh --herd=1 --rmem=2 --armcbmc=3 --context-bound=6`
#result=`BENCHMARKS="./table3-benchmarks.sh" ./get-table-data.sh --rmem=1 --armcbmc=2 --context-bound=8`
result=`BENCHMARKS="./table3-benchmarks.sh" ./get-table-data.sh --armcbmc=1 --context-bound=17`

# Ignore header and pretty-print rest
# echo "${result}" | head -n 13
# echo "${result}" | tail -n +14 | column -t
echo "${result}" | column -t
