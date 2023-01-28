#!/usr/bin/bash

# examples/kbound/pldi19-benchmark/01-tl-btlock-safe.cpp

timeout=300s

if [ "$#" -ne 4 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./run-example.sh [unwind] [context-bound] [spec-file] [file-name]"
    exit 0
fi

echo "./llvmbmc --unwind $1 --context-bound $2 -k $3 -s $4"
./llvmbmc --unwind $1 --context-bound $2 -k $3 -s $4 > /dev/null 2>&1
timeout $timeout cbmc /tmp/cbmc_out.cpp --unwind $1 --trace > /tmp/tr.tr 2>&1
./scripts/clean-cmsb.py

tr_file=/tmp/tr.tr

if [ -f "$tr_file" ]; then
    if grep -q "VERIFICATION SUCCESSFUL" "$tr_file"; then
        echo -n "SAFE   "
    elif grep -q "VERIFICATION FAILED" "$tr_file"; then
        echo -n "UNSAFE "
    else
        echo -n "TO     "        
    fi
else
    echo -n "TO     "
fi
