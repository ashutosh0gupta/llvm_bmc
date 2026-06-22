#!/usr/bin/env bash

# > success_without_f.txt
> success.txt

# for file in ./test_runs_without_f/*.txt; do
for file in ./test_runs/*.txt; do
    if grep -q "LLVM_BMC_VERIFICATION_SUCCESSFUL" "$file"; then
        # basename "$file" .txt >> success_without_f.txt
        basename "$file" .txt >> success.txt
    fi
done