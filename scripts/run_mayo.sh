#!/usr/bin/bash
#
# Run every MAYO example through llvmbmc and record what happened.
#
#   ./scripts/run_mayo.sh                 # run everything, then write the report
#   ./scripts/run_mayo.sh report          # rebuild the report from an existing log
#   ./scripts/run_mayo.sh run compute_A   # one example only
#
# One file per directory. The subdirectories of an example are mutated copies
# of the same program, so only <dir>/<dir>.ll is run.
#
# Two files are written:
#   $OUT/mayo_output.log   every command and all of its output
#   $OUT/mayo_report.txt   the counts, the per file table and the messages
#
# Env overrides:
#   MAYO     where the examples are   (default ../mayo_examples/test_mayo)
#   TOOL     the binary               (default ./llvmbmc)
#   OUT      where the two files go   (default benchmark/mayo_runs)
#   GRAN     --memory-granularity     (default 8)
#   UNWIND   -u                       (default 1)
#   ENTRY    -f                       (default main)
#   TIMEOUT  seconds per file, 0 for no limit  (default 0)
#   EXTRA    extra flags for every run
#   SMT      1 to ask for the translation only, and record how big it is
#
# The two rewrites the generated harness needs are off in the tool by default
# and are passed here unless told otherwise:
#   FOLD     1 (default) adds --fold-readonly-globals
#   MEMLOOPS 1 (default) adds --rewrite-mem-loops
# FOLD=0 MEMLOOPS=0 reproduces what the tool does with the files as they are.
#
# Nothing is capped by default, which is the point of running this on a big
# machine. Note that a semidebug binary carries AddressSanitizer and the large
# examples can take the machine down with no limit on them; build with
# "make release" for a long run, or set ASAN_OPTIONS=hard_rss_limit_mb=NNNN
# in the environment yourself.

set -u
cd "$(dirname "$0")/.."

MAYO=${MAYO:-../mayo_examples/test_mayo}
TOOL=${TOOL:-./llvmbmc}
OUT=${OUT:-benchmark/mayo_runs}
GRAN=${GRAN:-8}
UNWIND=${UNWIND:-1}
ENTRY=${ENTRY:-main}
TIMEOUT=${TIMEOUT:-0}
EXTRA=${EXTRA:-}
SMT=${SMT:-0}
FOLD=${FOLD:-1}
MEMLOOPS=${MEMLOOPS:-1}

LOG="$OUT/mayo_output.log"
REPORT="$OUT/mayo_report.txt"

die() { echo "$*" >&2; exit 1; }

# a line the report can be rebuilt from, so a run that is cut short still
# accounts for the files it did finish
mark() { echo "=== RESULT $1 $2 rc=$3 ${4:-} ==="; }

run_all() {
  local want="${1:-}"
  [ -d "$MAYO" ] || die "no examples at $MAYO (set MAYO=...)"
  [ -x "$TOOL" ] || die "no tool at $TOOL (set TOOL=...)"
  mkdir -p "$OUT"

  local dirs=() d n
  while IFS= read -r d; do
    n=$(basename "$d")
    [ -n "$want" ] && [ "$n" != "$want" ] && continue
    dirs+=("$d")
  done < <(find "$MAYO" -mindepth 1 -maxdepth 1 -type d | sort)
  [ ${#dirs[@]} -gt 0 ] || die "no examples found${want:+ called $want}"

  # one example adds to the log rather than replacing it, so re-running a
  # single file does not throw away a sweep that took hours. do_report keeps
  # the last result it finds for a name
  if [ -n "$want" ] && [ -f "$LOG" ]; then
    { echo; echo "# re-run of $want at $(date -Is)"; } >> "$LOG"
  else
    {
      echo "########################################################"
      echo "# started    $(date -Is)"
      echo "# host       $(uname -n)  $(uname -sr)"
      echo "# tool       $TOOL"
      echo "# examples   $MAYO  (${#dirs[@]} of them)"
      echo "# settings   -f $ENTRY -u $UNWIND -b -n --memory-granularity $GRAN fold=$FOLD memloops=$MEMLOOPS smt=$SMT $EXTRA"
      echo "# timeout    ${TIMEOUT}s (0 means none)"
      echo "########################################################"
    } > "$LOG"
  fi

  local i=0 total=${#dirs[@]}
  for d in "${dirs[@]}"; do
    n=$(basename "$d")
    i=$((i+1))
    local ll="$d/$n.ll"
    printf '[%3d/%3d] %-38s ' "$i" "$total" "$n"

    {
      echo
      echo "========================================================"
      echo "## $n"
      echo "## started $(date -Is)"
    } >> "$LOG"

    if [ ! -f "$ll" ]; then
      echo "## no $n.ll in $d" >> "$LOG"
      mark NOFILE "$n" - "secs=0 msg=no $n.ll in the directory" >> "$LOG"
      echo "NOFILE"
      continue
    fi

    # the whole command, so the log says exactly what produced the output
    local cmd=( "$TOOL" -f "$ENTRY" -u "$UNWIND" -b -n
                --memory-granularity "$GRAN" -o "$OUT/$n/" )
    # without -n there is no property at all and every file "succeeds"
    [ "$FOLD" != 0 ]     && cmd+=( --fold-readonly-globals )
    [ "$MEMLOOPS" != 0 ] && cmd+=( --rewrite-mem-loops )
    [ "$SMT" != 0 ]      && cmd+=( --smt-only )
    # shellcheck disable=SC2206
    [ -n "$EXTRA" ] && cmd+=( $EXTRA )
    cmd+=( "$ll" )
    [ "$TIMEOUT" != "0" ] && cmd=( timeout "$TIMEOUT" "${cmd[@]}" )

    mkdir -p "$OUT/$n"
    echo "## command  ${cmd[*]}" >> "$LOG"

    local t0 t1 rc
    t0=$(date +%s)
    "${cmd[@]}" >> "$LOG" 2>&1
    rc=$?
    t1=$(date +%s)

    # this file's output only: everything since its own banner. From the LAST
    # one, since a re-run of a single example leaves the earlier banner above
    local sect verdict res msg
    sect=$(awk -v pat="^## $n\$" '$0 ~ pat { buf = "" }
                                  { buf = buf $0 "\n" }
                                  END { printf "%s", buf }' "$LOG")
    verdict=$(printf '%s\n' "$sect" \
              | grep -oE 'LLVM_BMC_VERIFICATION_[A-Z]+' | head -1)

    # the verdict decides whenever there is one. a sanitizer build can exit non
    # zero after a complete run, over a leak report of its own, so the return
    # code on its own would call a finished FAILED something else
    if   printf '%s\n' "$sect" | grep -q LLVM_BMC_TRANSLATION_SUCCESSFUL
    then res=TRANSLATED
    elif [ "$verdict" = LLVM_BMC_VERIFICATION_SUCCESSFUL ]; then res=SUCCESS
    elif [ "$verdict" = LLVM_BMC_VERIFICATION_FAILED ];     then res=FAILED
    elif [ "$rc" = 124 ];                                   then res=TIMEOUT
    elif printf '%s\n' "$sect" | grep -qE 'hard rss limit exhausted|allocator is out of memory|out-of-memory'
    then res=MEMORY
    else res=ERROR
    fi

    # the first message, for the report's grouping
    msg=$(printf '%s\n' "$sect" \
          | grep -oE 'Error - [^(]*' | head -1 | sed 's/[[:space:]]*$//')
    if [ "$res" = MEMORY ] && [ -z "$msg" ]; then
      msg=$(printf '%s\n' "$sect" \
            | grep -oE 'hard rss limit exhausted.*|allocator is out of memory.*' \
            | head -1)
    fi
    [ -n "$msg" ] || msg="-"

    # how much formula came out, which is what says a run that got easier did
    # not get easier by losing the program
    local nass=0
    [ -f "$OUT/$n/test.smt2" ] && nass=$(grep -c '^(assert' "$OUT/$n/test.smt2")

    echo "## finished $(date -Is)  rc=$rc  $((t1-t0))s  asserts=$nass" >> "$LOG"
    mark "$res" "$n" "$rc" "secs=$((t1-t0)) asserts=$nass msg=$msg" >> "$LOG"
    printf '%-10s %4ss %8s\n' "$res" "$((t1-t0))" "$nass"
  done

  echo "# finished   $(date -Is)" >> "$LOG"
}

do_report() {
  [ -f "$LOG" ] || die "no log at $LOG, run \"$0\" first"

  # name|result|secs|msg, one row per example. A re-run of a single file adds a
  # second line for it, so the last one wins
  local rows
  rows=$(sed -n 's/^=== RESULT \(\S*\) \(\S*\) rc=\(\S*\) secs=\(\S*\) asserts=\(\S*\) msg=\(.*\) ===$/\2|\1|\4|\5|\6/p' "$LOG" \
         | awk -F'|' '{ last[$1] = $0 } END { for (k in last) print last[k] }' | sort)

  {
    echo "MAYO run report"
    echo
    grep -E '^# (started|finished|host|tool|examples|settings|timeout)' "$LOG"
    echo
    echo "counts"
    echo "------"
    printf '%s\n' "$rows" | awk -F'|' 'NF { print $2 }' \
      | sort | uniq -c | sort -rn | awk '{ printf "  %5d %s\n", $1, $2 }'
    echo "  ---"
    printf '  %5d total\n' "$(printf '%s\n' "$rows" | grep -c .)"
    echo
    echo "per file"
    echo "--------"
    printf '  %-38s %-10s %6s %9s  %s\n' FILE RESULT SECS ASSERTS MESSAGE
    printf '%s\n' "$rows" \
      | awk -F'|' 'NF { printf "  %-38s %-10s %6s %9s  %s\n", $1, $2, $3, $4, $5 }'
    echo
    echo "messages, most common first"
    echo "---------------------------"
    printf '%s\n' "$rows" | awk -F'|' 'NF { print $5 }' \
      | grep -v '^-$' | sort | uniq -c | sort -rn | awk '{ n=$1; $1=""; printf "  %5d %s\n", n, substr($0,2) }'
  } > "$REPORT"

  cat "$REPORT"
  echo
  echo "full output: $LOG"
  echo "report:      $REPORT"
}

case "${1:-run}" in
  report) do_report ;;
  run)    run_all "${2:-}"; echo; do_report ;;
  *)      run_all "$1";     echo; do_report ;;
esac
