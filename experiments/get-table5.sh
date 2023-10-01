#!/bin/bash

# Run get-table-data.sh with table5-benchmarks.sh
#result=`BENCHMARKS="./table5-benchmarks.sh" ./get-table-data.sh --genmc=1 --wb --hmc=2 --imm-wb --cdschecker=3`
result=`BENCHMARKS="./table5-benchmarks.sh" ./get-table-data.sh --hmc=1 --imm-wb --armcbmc=2 --context-bound=6`
#result=`BENCHMARKS="./table5-benchmarks.sh" ./get-table-data.sh --hmc=1 --imm-wb --nidhugg=2 --arm`

# Ignore header and pretty-print rest
# echo "${result}" | head -n 13
# echo "${result}" | tail -n +14 | column -t
echo "${result}" | column -t
