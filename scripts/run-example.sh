#!/usr/bin/bash

# examples/kbound/pldi19-benchmark/01-tl-btlock-safe.cpp

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
fi

./llvmbmc --unwind $1 --context-bound $2 -k $3 -s $4
cbmc /tmp/cbmc_out.cpp --trace > /tmp/tr.tr
./scripts/clean-cmsb.py

tr_file=/tmp/clean.tr
if grep -q "VERIFICATION SUCCESSFUL" "$tr_file"; then
    echo "SAFE"
else
    echo "UNSAFE"
fi
