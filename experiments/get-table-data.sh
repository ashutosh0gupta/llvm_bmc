#!/bin/bash

# Script that runs experiments and produces the data for a LaTeX
# table.
#
# This script requires getopt from the util-linux package.
# It assumes that genmc, nidhuggc, hmc, rmem, dartagnan, and cdschecker
# are all installed. It also assumes that an environment variable
# PATHTOCDS points to CDSChecker's installation.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, you can access it online at
# http://www.gnu.org/licenses/gpl-2.0.html.
#
# Author: Michalis Kokologiannakis <mixaskok@gmail.com>


################################################################################
# ENVIRONMENT VARIABLES
################################################################################

source ./terminal.sh

# The directory with all the tests
TEST_DIR="${TEST_DIR:-./benchmarks}"

# A list of all the benchmarks to run
BENCHMARKS="${BENCHMARKS:-./table1-benchmarks.sh}"

# Timeout for all benchmarks
TIMEOUT=30m

source "${BENCHMARKS}"
declare -a tool_res


################################################################################
# TOOL BINARIES
################################################################################

# GenMC
GenMC="${GenMC:-genmc}"

# HMC
HMC="${HMC:-genmc}"

# Nidhugg
NIDHUGG="${Nidhugg:-nidhuggc}"

# ARMCBMB
PATHTOARMCBMC="/home/ubuntu/POPL2024/Tools/llvm_bmc"
ARMCBMC="${ARMCBMC:-${PATHTOARMCBMC}/llvmbmc}"
ARMCBMC_TEMP="/tmp" 
CBMC="${CBMC:-cbmc}"

# CDSChecker
#PATHTOCDS="/home/ubuntu/POPL2024/Tools/cdschecker"
#CDSCHECKER="${PATHTOCDS}/run.sh"

# herd
HERD="${HERD:-herd7}"

# rmem
PATHTORMEM="/home/ubuntu/POPL2024/Tools/rmem"
RMEM="${RMEM:-${PATHTORMEM}/promisingOpt}"

# Dartagnan
#Z3JAVA="/home/ubuntu/POPL2024/Tools/Dat3M/lib"
PATHTODART="/home/ubuntu/POPL2024/Tools/Dat3M"
DARTAGNAN="${DARTAGNAN:-${PATHTODART}/dartagnan/target/dartagnan-3.1.1.jar}"


################################################################################
# SCRIPT PARAMETERS (PRINTING, ETC)
################################################################################

COL_SEP="|"
ROW_SEP="|"
PRINT_EXECS="no"
TIMEOUT_SYMBOL="◷"
FAILURE_SYMBOL="✗"



################################################################################
# RUNNING THE DIFFERENT TOOLS
################################################################################

# RUNNING NIDHUGG
#################

runnidhuggtest() {
    dir=$1
    model="$2"
    vars=0
    time_total=0
    explored_total=0
    for t in "${dir}"/variants/*.c
    do
	vars=$((vars+1))
	command="timeout ${TIMEOUT} ${NIDHUGG} ${test_args} -- ${model} ${unroll} ${nidhugg_args} ${t} 2>&1"
	output=`eval $command`
	res=$?
	explored=`echo "${output}" | awk '/Trace count/ { print $3 }'`
	blocked=`echo "${output}" | awk '/Trace count/ { print $5 }'`
	time=`echo "${output}" | awk '/time/ { print substr($4, 1, length($4)) }'`
	[[ -z "${explored}" ]] && explored="0"
	[[ -z "${time}" ]] && time="0"
	time_total=`echo "${time_total}+${time}" | bc -l`
	explored_total=`echo "${explored_total}+${explored}" | bc -l`
    done

    #echo $res
    #echo $output
    echo $command
    if test $res -eq 124; then
        average_explored="${TIMEOUT_SYMBOL}"
	average_time="${TIMEOUT_SYMBOL}"
    elif test $res -eq 0; then
        echo "-------- safe for nidhugg"
        average_explored=`echo "scale=0; ${explored_total}/${vars}" | bc -l`
        average_time=`echo "scale=2; ${time_total}/${vars}" | bc -l`
    elif test "${res}" -eq 42 # detect error
    then
        echo "-------- error for nidhugg"
        verage_explored=`echo "scale=0; ${explored_total}/${vars}" | bc -l`
        average_time=`echo "scale=2; ${time_total}/${vars}" | bc -l`
    else
        average_explored="${FAILURE_SYMBOL}"
	average_time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
        nidhugg_result=`printf "%s ${COL_SEP} %s" "${average_explored}" "${average_time}"`
    else
	nidhugg_result=`printf "%s" "${average_time}"`
    fi

    if test -n "${tool_res[$nid_col]}"
    then
	tool_res["${nid_col}"]="${tool_res[$nid_col]} ${COL_SEP} ${nidhugg_result}"
    else
    	tool_res["${nid_col}"]="${nidhugg_result}"
    fi
}

runnidhugg() {
    name="$1"
    tool_res["${nid_col}"]=""
    for m in "${run_sc}" "${run_obs}" "${run_tso}" "${run_pso}" "${run_power}" "${run_arm}"
    do
	if test -z "$m"
	then
	    continue
	fi
	runnidhuggtest "${TEST_DIR}/nidhugg/${name}" "$m"
    done
}

runarmcbmctest() {
    name=$1
    dir="${TEST_DIR}"/armcbmc/"$name"
    cbd="$2"
    time_total=0
    unwind=`echo "${unroll##*=}"`
    OK_LLVMBMC="LLVM_BMC_VERIFICATION_SUCCESSFUL"
    SUCCESSFUL_CBMC="VERIFICATION SUCCESSFUL"
    FAILED_CBMC="VERIFICATION FAILED"
    #echo "------------"
    #echo $unwind
    t="${dir}${n}"/"$name${n}".c
    if [[ -z $unwind ]]
    then
        command1="timeout ${TIMEOUT} ${ARMCBMC} --context-bound ${cbd} -k ${t} 2>&1"
    else
    	command1="timeout ${TIMEOUT} ${ARMCBMC} --unwind ${unwind} --context-bound ${cbd} -k ${t} 2>&1"
    fi
    echo $command1
    output1=`eval $command1`
    if [[ $output1 == *"${OK_LLVMBMC}"* ]]
    then
    	if [[ -z $unwind ]]
    	then
    	     command2="timeout ${TIMEOUT} /usr/bin/time -p ${CBMC} ${ARMCBMC_TEMP}/${name}${n}.c.cbmc_out.cpp 2>&1"
    	else
    	     command2="timeout ${TIMEOUT} /usr/bin/time -p ${CBMC} --unwind ${unwind} ${ARMCBMC_TEMP}/${name}${n}.c.cbmc_out.cpp 2>&1"
    	fi
	#echo $command2 
	output2=`eval $command2`
	res=$?
	#echo $output2
        #echo ${res}
    else
	echo ">>>>>>>> ERROR with LLVMBMC <<<<<<<<< "
	echo "Command1:\n"
	echo $command1
	echo "Output1:\n" 
	echo $output1
    fi 
    #echo $command2
    
    #file_found=`echo "${output}" | grep "No such file or directory"`
    #echo $output2
    #echo ${res}
    #echo $output2
    if test "${res}" -eq 124
    then
        #echo " --- 1"
        explored="${TIMEOUT_SYMBOL}"
	time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0 && [[ $output2 == *"${SUCCESSFUL_CBMC}"* ]]
    then
        echo " ++++++++ safe for armcbmc"
    	# Some more work needs to done here
    	#echo " >>>>>>>>>>>> TODO"
    	#echo $command2
	time=`echo "${output2}" | awk '/real/ { print $2 }'`
    elif test "${res}" -eq 10 && [[ $output2 == *"${FAILED_CMBMC}"* ]]
    then
    	# Some more work needs to done here
    	#echo " >>>>>>>>>>>> TODO"
    	#echo $command2
    	echo " ++++++++ error for armcbmc"
    	time=`echo "${output2}" | awk '/real/ { print $2 }'`
    else
        #echo " --- 3"
        echo ">>>>>>>> FAILURE <<<<<<<<< "
        echo "Command2:"
	echo $command2
	echo "Output2:" 
	echo $output2
        explored="${FAILURE_SYMBOL}"
	time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
         #echo " === 1"
        armcbmc_result=`printf "%s ${COL_SEP} %s" "${explored}" "${time}"`
    else
        #echo " === 2"
	armcbmc_result="${time}"
    fi    
    #echo ${armcbmc_result}
    #echo "......"
    #echo $armcbmc_col
    tool_res["${armcbmc_col}"]="${armcbmc_result}"
}

runarmcbmc() {
    name="$1"
    tool_res["${armcbmc_col}"]=""
    runarmcbmctest "${name}" "$run_cbd"
}

# RUNNING CDSCHECKER
####################

runcdstest() {
    dir="$1"
    # testname=`echo "${dir}" | awk '{ print tolower($0) }'`
    testname="${dir}${n}"
    cds_args="-m 2 -y" && [[ -f "${PATHTOCDS}/benchmarks/${testname}/args.in" ]] \
	    && cds_args=`head -1 "${PATHTOCDS}/benchmarks/${testname}/args.in"`
    output=`timeout "${TIMEOUT}" /usr/bin/time -p "${CDSCHECKER}" \
    	    "${PATHTOCDS}/benchmarks/${testname}/${testname}" \
            "${cds_args}" 2>&1`

    res="$?"
    if test "${res}" -eq 124
    then
        explored="${TIMEOUT_SYMBOL}"
	time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0
    then
        explored=`echo "${output}" | awk '/bug-free/ { print $6 }'`
        time=`echo "${output}" | awk '/real/ { print $2 }'` 
    else
        explored="${FAILURE_SYMBOL}"
	time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
        result=`printf "%s ${COL_SEP} %s" "${explored}" "${time}"`
    else
	result="${time}"
    fi    
    tool_res["${cds_col}"]="${result}"
}

runcdschecker() {
    if [[ -z "${PATHTOCDS}" ]]
    then
	echo 'CDSChecker path not specified!'
	exit 1
    fi
    name="$1"
    tool_res["${cds_col}"]=""
    runcdstest "${name}"
}


# RUNNING GENMC
###############

rungenmctest() {
    dir=$1
    model=$2
    vars=0
    time_total=0
    explored_total=0
    checker_args="" && [[ -f "${dir}/genmc.in" ]] && checker_args=`head -1 "${dir}/genmc.in"`
    for t in "${dir}"/variants/*.c
    do
	vars=$((vars+1))
	command="timeout ${TIMEOUT} ${GenMC} ${model} ${unroll} ${genmc_args} ${checker_args} -- ${test_args} ${t} 2>&1"
	output=`eval $command`
	res=$?
	explored=`echo "${output}" | awk '/explored/ { print $6 }'`
	time=`echo "${output}" | awk '/time/ { print substr($4, 1, length($4)-1) }'`
	[[ -z "${explored}" ]] && explored="0"
	[[ -z "${time}" ]] && time="0"
	time_total=`echo "${time_total}+${time}" | bc -l`
	explored_total=`echo "${explored_total}+${explored}" | bc -l`
    done

    if test "${res}" -eq 124
    then
        average_explored="${TIMEOUT_SYMBOL}"
	average_time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0
    then
        average_explored=`echo "scale=0; ${explored_total}/${vars}" | bc -l`
        average_time=`echo "scale=2; ${time_total}/${vars}" | bc -l`
    elif test "${res}" -eq 42 # detect error
    then
        #echo "--------"
        average_explored=`echo "scale=0; ${explored_total}/${vars}" | bc -l`
        average_time=`echo "scale=2; ${time_total}/${vars}" | bc -l`
    else
        average_explored="${FAILURE_SYMBOL}"
	average_time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
        genmc_result=`printf "%s ${COL_SEP} %s" "${average_explored}" "${average_time}"`
    else
	genmc_result="${average_time}"
    fi

    if test -n "${tool_res[$genmc_col]}"
    then
	tool_res["${genmc_col}"]="${tool_res[$genmc_col]} ${COL_SEP} ${genmc_result}"
    else
    	tool_res["${genmc_col}"]="${genmc_result}"
    fi
}

rungenmc() {
    name="$1"
    tool_res["${genmc_col}"]=""
    for m in "${run_weakra}" "${run_mo}" "${run_wb}"
    do
	if test -z "$m"
	then
	    continue
	fi
	rungenmctest "${TEST_DIR}/genmc/${name}" "$m"
    done
}

# RUNNING HMC
#############

runhmctest() {
    dir=$1
    model=$2
    vars=0
    time_total=0
    explored_total=0
    checker_args="" && [[ -f "${dir}/genmc.in" ]] && checker_args=`head -1 "${dir}/genmc.in"`
    for t in "${dir}"/variants/*.c
    do
	vars=$((vars+1))
	command="timeout ${TIMEOUT} ${HMC} ${model} ${unroll} ${hmc_args} ${checker_args} -- ${test_args} ${t} 2>&1"
	output=`eval $command`
	#echo $output
	res=$?
	explored=`echo "${output}" | awk '/explored/ { print $6 }'`
	time=`echo "${output}" | awk '/time/ { print substr($4, 1, length($4)-1) }'`
	[[ -z "${explored}" ]] && explored="0"
	[[ -z "${time}" ]] && time="0"
	time_total=`echo "${time_total}+${time}" | bc -l`
	explored_total=`echo "${explored_total}+${explored}" | bc -l`
    done
    #echo ${res}
    echo $command
    #echo $output
    if test "${res}" -eq 124
    then
        average_explored="${TIMEOUT_SYMBOL}"
	average_time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0
    then
        echo "-------- safe for hmc"
        average_explored=`echo "scale=0; ${explored_total}/${vars}" | bc -l`
        average_time=`echo "scale=2; ${time_total}/${vars}" | bc -l`
    elif test "${res}" -eq 42 # detect error
    then
        echo " -------- error for hmc"
        average_explored=`echo "scale=0; ${explored_total}/${vars}" | bc -l`
        average_time=`echo "scale=2; ${time_total}/${vars}" | bc -l`
    else
        echo " ====== FAILURE for hmc"
        average_explored="${FAILURE_SYMBOL}"
	average_time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
        hmc_result=`printf "%s ${COL_SEP} %s" "${average_explored}" "${average_time}"`
    else
	hmc_result="${average_time}"
    fi

    if test -n "${tool_res[$hmc_col]}"
    then
	tool_res["${hmc_col}"]="${tool_res[$hmc_col]} ${COL_SEP} ${hmc_result}"
    else
    	tool_res["${hmc_col}"]="${hmc_result}"
    fi
}

runhmc() {
    name="$1"
    tool_res["${hmc_col}"]=""
    for m in "${run_immwb}" "${run_immmo}"
    do
	if test -z "$m"
	then
	    continue
	fi
	runhmctest "${TEST_DIR}/genmc/${name}" "$m"
    done
}

# RUNNING HERD
##############

runherdtest() {
    dir=$1
    model="$2"
    testname="${dir}${n}/${name}.litmus"
    output=`timeout "${TIMEOUT}" "${HERD}" -model "${model}.cat" "${testname}"  2>&1`
    res="$?"
    command="${TIMEOUT} ${HERD} -model ${model}.cat ${testname} 2>&1"
    echo $command
    echo $output
    echo $res

    file_found=`echo "${output}" | grep "No such file or directory"`
    if test "${res}" -eq 124
    then
        explored="${TIMEOUT_SYMBOL}"
	time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0 && test -z "${file_found}"
    then
        explored=`echo "${output}" | awk '/Positive/ { print $2 }'`
    	time=`echo "${output}" | awk '/Time/ { print $3 }'`
	time=`printf "%.2f" "${time}"`
    else
        explored="${FAILURE_SYMBOL}"
	time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
        herd_result=`printf "%s ${COL_SEP} %s" "${explored}" "${time}"`
    else
	herd_result="${time}"
    fi    
    tool_res["${herd_col}"]="${herd_result}"
}

runherd() {
    name="$1"
    tool_res["${herd_col}"]=""
    for m in "${run_herdarm}"
    do
	if test -z "$m"
	then
	    continue
	fi
	runherdtest "${TEST_DIR}/herd/${name}" "$m"
    done
}

# RUNNING RMEM
##############

runrmemtest() {
    dir=$1
    model="$2"
    shmem_file="${dir}${n}/shared_memory.txt"
    testname="${dir}${n}/${name}.litmus"
    checker_args="" && [[ -f "${dir}/args.in" ]] && checker_args=`head -1 "${dir}/args.in"`
    command="timeout ${TIMEOUT} ${RMEM} -interactive false -shared_memory ${shmem_file} -pp_hex true ${testname}"
    echo $command
    output=`timeout "${TIMEOUT}" "${RMEM}" -interactive false -shared_memory "${shmem_file}" -pp_hex true "${testname}" 2>&1`
   res="$?"
   echo ">>>> rmem"
   echo $output
   echo $res
   if test "${res}" -eq 124
    then
        explored="${TIMEOUT_SYMBOL}"
	time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0
    then
        explored=`echo "${output}" | awk '/*> via/ { print $1 }'`
        time=`echo "${output}" | awk '/Runtime/ { print $2 }'`
	time=`printf "%.2f" "${time}"`
    else
        explored="${FAILURE_SYMBOL}"
	time="${FAILURE_SYMBOL}"	
    fi

    if test "${PRINT_EXECS}" = "yes"
    then
        rmem_result=`printf "%s ${COL_SEP} %s" "${explored}" "${time}"`
    else
	rmem_result="${time}"
    fi
    tool_res["${rmem_col}"]="${rmem_result}"
}

runrmem() {
    name="$1"
    tool_res["${rmem_col}"]=""
    for m in "${run_prom}"
    do
	if test -z "$m"
	then
	    continue
	fi
	runrmemtest "${TEST_DIR}/rmem/${name}" "$m"
    done
}

# RUNNING DARTAGNAN
##########################

declare -a dart_cat_to_target

rundarttest() {
    dir="$1"
    suffix=".pts" && [[ -f "${dir}${n}/${name}.litmus" ]] && suffix=".litmus"
    testname="${dir}${n}/${name}${suffix}"
    unroll_val="" && [[ -f "${dir}${n}/dart_unroll.in" ]] && unroll_val=`head -1 "${dir}${n}/dart_unroll.in"`
    catfile="${PATHTODART}/cat/$2.cat"
    dart_args="" && [[ -f "${dir}/args.in" ]] && dart_args=`head -1 "${dir}/args.in"`
    if test "${unroll_val}" == ""; then
        command="timeout ${TIMEOUT} /usr/bin/time -p java -jar ${DARTAGNAN} ${dart_args}  -cat  ${catfile} -t ${dart_cat_to_target[$2]} -i ${testname}"
        echo $command
        output=`LD_LIBRARY_PATH="${Z3JAVA}" timeout ${TIMEOUT} /usr/bin/time -p java -jar \
                "${DARTAGNAN}" "${dart_args}" -cat "${catfile}" \
	        -t "${dart_cat_to_target[$2]}" -i "${testname}" 2>&1`
	#echo $output
    else
        output=`LD_LIBRARY_PATH="${Z3JAVA}" timeout ${TIMEOUT} /usr/bin/time -p java -jar \
               "${DARTAGNAN}" "${dart_args}" -cat "${catfile}" \
	        -t "${dart_cat_to_target[$2]}" -i "${testname}" -unroll "${unroll_val}" 2>&1`
	echo $output
    fi

    res="$?" 
    if test "${res}" -eq 124
    then
	time="${TIMEOUT_SYMBOL}"
    elif test "${res}" -eq 0
    then
        time=`echo "${output}" | awk '/real/ { print $2 }'`
    else
	time="${FAILURE_SYMBOL}"	
    fi

    tool_res["${dart_col}"]="${time}"
}

rundartagnan() {
    name="$1"
    tool_res["${dart_col}"]=""
    for m in "${run_dartpower}" "${run_dartarm}"
    do
	if test -z "$m"
	then
	    continue
	fi
	rundarttest "${TEST_DIR}/dartagnan/${name}" "$m"
    done
}


# INVOKE ALL TOOLS
##################

runalltools() {
    dir=$1
    name=$2
    IFS=',' read -ra ADDR <<< "${benchmarks[$dir]}"
    for args in "${ADDR[@]}"; do
	unroll=`echo $args | cut -d ';' -f1`
	if test "${unroll}" == "NO_UNROLL"
	then
	    unroll=""
	fi
	test_args=`echo $args | cut -d ';' -f2`
	n=`echo ${test_args} |
	   awk ' { if (match($0, /-DN=[0-9]+/)) print substr($0, RSTART+4, RLENGTH-4) } '`

	[[ -n "${nid_col}" ]] && runnidhugg "${name%.*}"
	[[ -n "${cds_col}" ]] && runcdschecker "${name%.*}"
	[[ -n "${hmc_col}" ]] && runhmc "${name%.*}"
	[[ -n "${genmc_col}" ]] && rungenmc "${name%.*}"
	[[ -n "${rmem_col}" ]] && runrmem "${name%.*}"
	[[ -n "${herd_col}" ]] && runherd "${name%.*}"
	[[ -n "${dart_col}" ]] && rundartagnan "${name%.*}"
	[[ -n "${armcbmc_col}" ]] && runarmcbmc "${name%.*}"

	printf "${name%.*}/${n} "
	for i in $(seq 1 "${toolnum}")
	do
	    #echo ${COL_SEP}
	    printf "${COL_SEP} ${tool_res[$i]} "
	done; echo "${ROW_SEP}"
    done
}

runbenchmarks() {
    for dir in "${!benchmarks[@]}"
    do
	name="${dir##*/}"
	runalltools "${dir}" "${name}"
    done
}


################################################################################
# COMMAND-LINE ARGUMENTS PARSING
################################################################################

# test whether arrays are supported
arrtest[0]='test' ||
    (echo 'Failure: arrays not supported in this version of bash.' && exit 2)

# test whether getopt works
getopt --test > /dev/null
if [[ $? -ne 4 ]]; then
    echo "`getopt --test` failed in this environment."
    exit 1
fi

# command-line arguments
SHORT=o:
LONG=cdschecker:,nidhugg:,sc,tso,pso,power,arm,optimal,observers,genmc:,mo,wb,hmc:,imm-wb,imm-mo,dartagnan:,dart-arm,dart-power,rmem:,herd:,output:,armcbmc:,context-bound:

# temporarily store output to be able to check for errors
PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")
if [[ $? -ne 0 ]]; then
    # getopt has complained about wrong arguments to stdout
    exit 2
fi
# use eval with "$PARSED" to properly handle the quoting
eval set -- "$PARSED"

toolnum=0
# actually parse the options until we see --
while true; do
    case "$1" in
        --cdschecker)
            [[ "$2" -gt 0 ]] && cds_col="$2" && tool["${cds_col}"]=cdschecker
	    ((++toolnum))
            shift 2
            ;;
        --nidhugg)
            [[ "$2" -gt 0 ]] && nid_col="$2" && tool["${nid_col}"]=nidhugg
	    ((++toolnum))
            shift 2
            ;;
        --armcbmc)
            [[ "$2" -gt 0 ]] && armcbmc_col="$2" && tool["${armcbmc_col}"]=armcbmc
	    ((++toolnum))
            shift 2
            ;;
        --context-bound)
            run_cbd="$2"
            shift 2
            ;;
	--genmc)
	    [[ "$2" -gt 0 ]] && genmc_col="$2" && tool["${genmc_col}"]=genmc
	    ((++toolnum))
	    shift 2
	    ;;
	--hmc)
	    [[ "$2" -gt 0 ]] && hmc_col="$2" && tool["${hmc_col}"]=hmc
	    ((++toolnum))
	    shift 2
	    ;;
	--rmem)
	    [[ "$2" -gt 0 ]] && rmem_col="$2" && tool["${rmem_col}"]=rmem
	    ((++toolnum))
	    shift 2
	    ;;
	--herd)
	    [[ "$2" -gt 0 ]] && herd_col="$2" && tool["${herd_col}"]=herd
	    ((++toolnum))
	    shift 2
	    ;;
	--dartagnan)
	    [[ "$2" -gt 0 ]] && dart_col="$2" && tool["${dart_col}"]=dartagnan
	    ((++toolnum))
	    shift 2
	    ;;
	--mo)
	    run_mo="-mo"
	    shift
	    ;;
	--wb)
	    run_wb="-wb"
	    shift
	    ;;
	--imm-wb)
	    run_immwb="-imm -wb"
	    shift
	    ;;
	--imm-mo)
	    run_immmo="-imm -mo"
	    shift
	    ;;
	--sc)
	    run_sc="--sc"
	    shift
	    ;;
	--tso)
	    run_tso="--tso"
	    shift
	    ;;
	--pso)
	    run_pso="--pso"
	    shift
	    ;;
	--power)
	    run_power="--power"
	    shift
	    ;;
	--arm)
	    run_arm="--arm"
	    shift
	    ;;    
	--observers)
	    run_obs="--sc --observers --optimal"
	    shift
	    ;;
	--dart-arm)
	    run_dartarm="arm"
            dart_cat_to_target["${run_dartarm}"]="arm"
	    shift
	    ;;
	--dart-power)
	    run_dartpower="power"
            dart_cat_to_target["${run_dartpower}"]="power"
	    shift
	    ;;
        -o|--output)
            out_file="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

#NIDHUGG_DEFAULTS
#################
nidhugg_args="--disable-mutex-init-requirement"
[[ -z "${run_tso}" ]] && [[ -z "${run_pso}" ]] && [[ -z "${run_power}" ]] && [[ -z "${run_arm}" ]] && run_sc="--sc"

#GenMC DEFAULTS
###############
genmc_args="${GENMC_ARGS:-}"
[[ -z "${run_mo}" ]] && run_wb="-wb"

#HMC DEFAULTS
#############
hmc_args="${HMC_ARGS:-}"
[[ -z "${run_immmo}" ]] && run_immwb="-imm -wb"

#DARTAGNAN DEFAULTS
###################
[[ -z "${run_dartpower}" ]] && run_dart="arm"

#RMEM DEFAULTS
##############
run_prom="promising"

#HERD DEFAULTS
##############
run_herdarm="aarch64"


printnidhuggmodes() {
    [[ -n "${run_sc}" ]]  && printf "SC "
    [[ -n "${run_obs}" ]] && printf "SCo "
    [[ -n "${run_tso}" ]] && printf "TSO "
    [[ -n "${run_pso}" ]] && printf "PSO "
    [[ -n "${run_power}" ]] && printf "POWER "
    [[ -n "${run_arm}" ]] && printf "ARM "
}

printgenmcmodes() {
    [[ -n "${run_mo}" ]] && printf "MO "
    [[ -n "${run_wb}" ]] && printf "WB "
}

printcdscheckermodes() {
    printf "C11 "
}

printhmcmodes() {
    [[ -n "${run_immmo}" ]] && printf "IMM-MO "
    [[ -n "${run_immwb}" ]] && printf "IMM-WB "
}

printrmemmodes() {
    [[ -n "${run_prom}" ]] && printf "PROMISING "
}

printherdmodes() {
    [[ -n "${run_herdarm}" ]] && printf "ARM "
}

printdartagnanmodes() {
    [[ -n "${run_dartpower}" ]] && printf "POWER "
    [[ -n "${run_dartarm}" ]] && printf "ARM "
}

printheader() {
    # print a dummy header (LaTeX comment)
    printf "\n%% "; printline
    printf "%% Nidhugg: column order among sc, tso, pso, power, arm: sc < tso < pso < power < arm\n"
    printf "%% GenMC: column order among mo, wb: mo < wb\n"
    printf "%% HMC: column order among mo, wb: mo < wb\n"
    printf "%% Dartagnan: column order among power, arm: power < arm\n"
    printf "%% "; printline
}

printnamesandmodes() {
    # print tool names and modes
    # printf "\n%% ";printline
    printf "benchmark ${COL_SEP}"
    for i in $(seq 1 "${toolnum}")
    do
	printf " ${tool[$i]} ${COL_SEP}"
    done; echo ''
    # printf "\n%% ";printline
    
#    printf "%% "
#    for i in $(seq 1 "${toolnum}")
#    do
#	[[ "${tool[$i]}" == "nidhugg" ]] && printnidhuggmodes
#	[[ "${tool[$i]}" == "genmc" ]]   && printgenmcmodes
#	[[ "${tool[$i]}" == "hmc" ]]   && printhmcmodes
#	[[ "${tool[$i]}" == "cdschecker" ]]  && printcdscheckermodes
#	[[ "${tool[$i]}" == "rmem" ]]  && printrmemmodes
#	[[ "${tool[$i]}" == "herd" ]]  && printherdmodes
#	[[ "${tool[$i]}" == "dartagnan" ]]  && printdartagnanmodes
#    done;
#    printf "\n%% ";printline
}

printtable() {
    #printheader

    printnamesandmodes

    # print actual table data
    runbenchmarks
}

printtable
