#!/usr/bin/bash

run=./scripts/run-example.sh
pldi19=examples/kbound/pldi19-benchmark
k=10
l=1
n=2
ex=01-tl-btlock
ns=(2 3 4 5 6)
# kinds=("unsafe" "safe")

# ns=(2)
# kinds=("unsafe")
# kinds=("safe")
kinds=("opt-unsafe")
# ns=(2)

#$kind=unsafe

TIMEFORMAT=%R
echo -e "Name\t\tKind\tN K  L Result Time"
for kind in ${kinds[@]}; do
    for n in ${ns[@]}; do
        echo -n -e "$ex\t$kind\t$n $k $l "
        time $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-$n.spec
    done
done

#$run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-2.spec
#$run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-3.spec
#$run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-4.spec
#$run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-5.spec
#$run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-6.spec

# $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-2.spec
# $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-3.spec
# $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-4.spec
# $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-5.spec
# $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$ex-6.spec