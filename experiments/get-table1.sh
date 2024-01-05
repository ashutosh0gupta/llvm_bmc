#!/bin/bash

# Run get-table-data.sh with table1-benchmarks.sh
#result=`BENCHMARKS="./table1-benchmarks.sh" ./get-table-data.sh --hmc=1 --imm-wb --nidhugg=2 --arm --armcbmc=3 --context-bound=8`
#result=`BENCHMARKS="./table1-benchmarks.sh" ./get-table-data.sh --armcbmc=1 --context-bound=5`
#result=`BENCHMARKS="./table1-benchmarks.sh" ./get-table-data.sh --armcbmc=1 --context-bound=18`
#result=`BENCHMARKS="./table1-benchmarks.sh" ./get-table-data.sh --herd=1 --armcbmc=2 --context-bound=8`
result=`BENCHMARKS="./table1-benchmarks.sh" ./get-table-data.sh --dartagnan=1 --dart-arm`
# Ignore header and pretty-print rest
# echo "${result}" | head -n 13
# echo "${result}" | tail -n +14 | column -t
echo "${result}" | column -t 
