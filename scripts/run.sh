#!/usr/bin/bash

run=./scripts/run-example.sh
pldi19=examples/kbound/pldi19-benchmark

#$run 1 10 $pldi19/01-tl-btlock-safe.cpp $pldi19/01-tl-btlock-safe.spec
#$run 1 10 $pldi19/01-tl-btlock-safe.cpp $pldi19/01-tl-btlock-safe-3.spec
$run 1 10 $pldi19/01-tl-btlock-safe.cpp $pldi19/01-tl-btlock-safe-4.spec
#$run 1 10 $pldi19/01-tl-btlock-safe.cpp $pldi19/01-tl-btlock-safe-5.spec
#$run 1 10 $pldi19/01-tl-btlock-safe.cpp $pldi19/01-tl-btlock-safe-6.spec
