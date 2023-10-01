#!/bin/bash

# Run get-table-data.sh with table5-benchmarks.sh
#result=`BENCHMARKS="./table5-benchmarks.sh" ./get-table-data.sh --genmc=1 --wb --hmc=2 --imm-wb --cdschecker=3`
result=`BENCHMARKS="./table6-benchmarks.sh" ./get-table-data.sh --hmc=1 --imm-wb --nidhugg=2 --arm --armcbmc=3 --context-bound=5`
#result=`BENCHMARKS="./table6-benchmarks.sh" ./get-table-data.sh --hmc=1 --imm-wb --nidhugg=2 --arm`
result=`BENCHMARKS="./table6-benchmarks.sh" ./get-table-data.sh --armcbmc=1 --context-bound=5`
# Ignore header and pretty-print rest
# echo "${result}" | head -n 13
# echo "${result}" | tail -n +14 | column -t
echo "${result}" | column -t
