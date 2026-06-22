#!/usr/bin/env bash

for file in ../MAYO-LLVM-Examples/results/*.ll; do
    name="$(basename "$file" .ll)"
    outdir="./output_with_f/${name}"
    mkdir -p "$outdir"
    ./llvmbmc "$file" -f "$name" -o "$outdir" --dump-solver-query > "./test_runs/${name}.txt" 2>&1
    
    # ./llvmbmc "$file" -o "./output/${name}/" --dump-solver-query > "./test_runs_without_f/${name}.txt" 2>&1
done
