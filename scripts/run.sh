#!/usr/bin/bash

./llvmbmc --context-bound 6 -k examples/kbound/pldi19-benchmark/tl-btlock.cpp
cbmc /tmp/cbmc_out.cpp --trace > /tmp/tr.tr
./scripts/clean-cmsb.py 
