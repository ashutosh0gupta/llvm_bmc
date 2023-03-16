#!/usr/bin/bash

rm /tmp/cbmc_out.cpp

run=./scripts/run-example.sh
pldi19=examples/kbound/omkar/bench
k=10
l=1
n=2
# ex=02-slc-spinlock
# ex=01-tl-btlock
# ex=03-dq-deque
ex=burns-safe-fenced

#spec=01-tl-btlock
spec=burns
# ns=(2 3 4 5 6)
# kinds=("unsafe" "safe")

# ns=(2)
kinds=("safe")
# kinds=("safe")
# kinds=("opt-unsafe")

#$kind=unsafe

TIMEFORMAT=%R
# echo -e "Name\t\t\tKind\tN K  L Result Time"
# for kind in ${kinds[@]}; do
#     #echo -n -e "$ex\t$kind\t$n $k $l "
#     echo -n -e "$ex\t\t$n $k $l "
#     #time $run $l $k $pldi19/$ex-$kind.cpp $pldi19/$spec-$n.spec
#     time $run $l $k $pldi19/$ex.cpp $pldi19/$spec.spec
# done


exes=( ("burns-safe-fenced","burns") )
echo -e "Name\t\t\tKind\tN K  L Result Time"
for ex in ${exes[@]}; do
    echo "$ex"
    #echo -n -e "$ex\t$kind\t$n $k $l "
    # echo -n -e "$ex\t\t$n $k $l "
    # time $run $l $k $pldi19/$ex.cpp $pldi19/$spec.spec
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


#./llvmbmc --unwind 2 --context-bound 10 -k examples/kbound/pldi19-benchmark/02-slc-spinlock-safe.cpp -s examples/kbound/pldi19-benchmark/01-tl-btlock-2.spec

# ./llvmbmc --unwind 2 --context-bound 10 -k examples/kbound/pldi19-benchmark/04-qu-queue.cpp -s examples/kbound/pldi19-benchmark/03-dq-deque.spec 
