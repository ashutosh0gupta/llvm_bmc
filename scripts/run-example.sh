#!/usr/bin/bash

# examples/kbound/pldi19-benchmark/01-tl-btlock-safe.cpp

timeout=300s

if [ "$#" -ne 6 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./run-example.sh [unwind] [context-bound] [file-name] [spec-file] [tmp path]  [memory-model]"
    exit 0
fi

tmp_path=$5
# tmp_path="./tmp/"
# if [ -w /tmp/ ]; then
#     tmp_path="/tmp"
# fi

# rm $tmp_path/cbmc_out.cpp || true

fname=$(basename ${3})

spec_option=
if [[ "$4" != "-" ]]; then
    spec_option="-s $4"
fi

# debug="--trace"
debug=

echo "./llvmbmc --unwind $1 -o $tmp_path --context-bound $2 --memory-model $6 -k $3 $spec_option"
./llvmbmc --unwind $1 -o $tmp_path --context-bound $2 --memory-model $6 -k $3 $spec_option > /dev/null 2>&1
timeout $timeout cbmc $tmp_path/$fname.cbmc_out.cpp --unwind $1 $debug > $tmp_path/$fname.tr.tr 2>&1

tr_file=$tmp_path/$fname.tr.tr

if [ -f "$tr_file" ]; then
    if grep -q "VERIFICATION SUCCESSFUL" "$tr_file"; then
        echo -n "SAFE   "
    elif grep -q "VERIFICATION FAILED" "$tr_file"; then
        # ./scripts/clean-cbmc.py $tmp_path $fname
        echo -n "UNSAFE "
    elif grep -q "CONVERSION ERROR" "$tr_file"; then
        echo -n "ERROR  "     
    else
        echo -n "TO     "        
    fi
else
    echo -n "TO     "
fi
