#!/usr/bin/bash
#
# Run every Ada example through llvmbmc and record what happened.
#
#   ./scripts/run_ada.sh                   # run everything, then write the report
#   ./scripts/run_ada.sh report            # rebuild the report from an existing log
#   ./scripts/run_ada.sh run ls_rates      # one unit only
#
# The ForTesting-AG projects are the set, $AG/<project>/<unit>.adb, the
# nineteen units named in UNITS below. An .adb does not say which subprogram to
# verify, so the entry name goes with the unit, and a unit is compiled in its
# own project directory because gnat looks for the specs it withs beside it.
#
# SETS=both adds examples/ada_fixed, eight small units whose entry names and
# unwind bounds are read out of its own commands_to_run. They are a different
# thing: hand written exercises rather than the delivered suite.
#
# Two files are written:
#   $OUT/ada_output.log   every command and all of its output
#   $OUT/ada_report.txt   the counts, the per unit table and the messages
#
# Env overrides:
#   AG       the ForTesting-AG projects (default ../ForTesting-AG)
#   TOOL     the binary                (default ./llvmbmc)
#   OUT      where the two files go    (default benchmark/ada_runs)
#   SETS     ag, fixed or both         (default ag)
#   GRAN     --memory-granularity      (default 8)
#   UNWIND   -u for the AG units       (default 5)
#   TIMEOUT  seconds per unit, 0 for no limit  (default 0)
#   EXTRA    extra flags for every run
#
# gnat-llvm has to be reachable, or every run stops at the compile step:
#   export GNAT_LLVM_BIN=/path/to/gnat-llvm/llvm-interface/bin
#
# A unit that holds no assertion of its own still has the index, range and
# overflow checks -n and -l ask for, which is where the properties come from.
# Several units come out with none at all, and the report says so rather than
# leaving a bare SUCCESS. EXTRA='--ada-runtime-checks --unreach-check' keeps
# the checks gnat itself compiles in and gives those units properties.
#
# Nothing is capped by default, which is the point of running this on a big
# machine: the units that do not answer are solver time, not a failure of the
# tool, and only a run with no limit says how much they need. Set TIMEOUT for
# a sweep on a smaller machine.

set -u
cd "$(dirname "$0")/.."

AG=${AG:-../ForTesting-AG}
TOOL=${TOOL:-./llvmbmc}
OUT=${OUT:-benchmark/ada_runs}
SETS=${SETS:-ag}
GRAN=${GRAN:-8}
UNWIND=${UNWIND:-5}
TIMEOUT=${TIMEOUT:-0}
EXTRA=${EXTRA:-}

LOG="$OUT/ada_output.log"
REPORT="$OUT/ada_report.txt"

# project, unit, entry subprogram
UNITS="\
Guid-test algorithm    algorithm__compangler
Guid-test library      library__bit_and
Guid-test lookup       lookup__output_lookup
Guid-test main         main__stageflags
Guid-test major_cycle  major_cycle__stage2_major
Guid-test math         math__dotproduct
Guid-test minor_cycle  minor_cycle__stage1_minor
nav3      library      library__sqrt_sf
nav3      nav3         nav3__nav3_driver
RateTest  library      library__bit_and
RateTest  ls_rates     ls_rates__ls_rates_main
Seq1      library      library__bit_and
Seq1      seq1         seq1__seq1_driver
Sun-Mag   library      library__bit_and
Sun-Mag   sunmag       sunmag__rmnrnav_driver
test-fp1  library      library__sqrt_sf
test-fp1  test_fp1     test_fp1__fp1_driver
test-fp2  library      library__sqrt_sf
test-fp2  test_fp2     test_fp2__fp2_driver"

die() { echo "$*" >&2; exit 1; }

# a line the report can be rebuilt from, so a run that is cut short still
# accounts for the units it did finish
mark() { echo "=== RESULT $1 $2 rc=$3 ${4:-} ==="; }

# one unit: $1 name for the table, $2 directory to run in, $3 output
# directory, then the arguments for the tool
run_one() {
  local name=$1 wd=$2 od=$3; shift 3
  local cmd=( "$TOOL" "$@" -o "$od/" )
  [ "$TIMEOUT" != 0 ] && cmd=( timeout "$TIMEOUT" "${cmd[@]}" )

  printf '%-34s ' "$name"
  rm -rf "$od"; mkdir -p "$od"
  {
    echo
    echo "========================================================"
    echo "## $name"
    echo "## started $(date -Is)"
    echo "## in      $wd"
    echo "## command ${cmd[*]}"
  } >> "$LOG"

  local t0 t1 rc
  t0=$(date +%s)
  ( cd "$wd" && "${cmd[@]}" ) >> "$LOG" 2>&1
  rc=$?
  t1=$(date +%s)

  # this unit's output only: everything since its own banner, and from the
  # last one, so a re-run of a single unit does not read the earlier section
  local sect res verdict specs msg
  sect=$(awk -v pat="^## $name\$" '$0 ~ pat { buf = "" }
                                   { buf = buf $0 "\n" }
                                   END { printf "%s", buf }' "$LOG")
  verdict=$(printf '%s\n' "$sect" \
            | grep -oE 'LLVM_BMC_VERIFICATION_[A-Z]+' | head -1)
  specs=$(printf '%s\n' "$sect" \
          | grep -oE 'checking [0-9]+ specifications' | grep -oE '[0-9]+' | head -1)
  [ -n "$specs" ] || specs=0

  # the verdict decides whenever there is one. a sanitizer build can exit non
  # zero after a complete run, over a leak report of its own, so the return
  # code on its own would call a finished FAILED something else
  case "$verdict" in
    LLVM_BMC_VERIFICATION_SUCCESSFUL)   res=SUCCESS ;;
    LLVM_BMC_VERIFICATION_FAILED)       res=FAILED ;;
    LLVM_BMC_VERIFICATION_INCONCLUSIVE) res=INCONCLUSIVE ;;
    *)
      if   printf '%s\n' "$sect" | grep -q LLVM_BMC_TRANSLATION_SUCCESSFUL
      then res=TRANSLATED
      elif [ "$rc" = 124 ]; then res=TIMEOUT
      elif printf '%s\n' "$sect" | grep -qE 'hard rss limit exhausted|allocator is out of memory|out-of-memory'
      then res=MEMORY
      else res=ERROR
      fi ;;
  esac

  msg=$(printf '%s\n' "$sect" \
        | grep -oE 'Error - [^(]*' | head -1 | sed 's/[[:space:]]*$//')
  # a unit with no property of its own is translated and nothing is proved, so
  # the table has to say that rather than leave a bare SUCCESS
  if [ -z "$msg" ] \
     && printf '%s\n' "$sect" | grep -q 'no specification was checked'
  then msg="no specification was checked"
  fi
  [ -n "$msg" ] || msg="-"

  echo "## finished $(date -Is)  rc=$rc  $((t1-t0))s  specs=$specs" >> "$LOG"
  mark "$res" "$name" "$rc" "secs=$((t1-t0)) specs=$specs msg=$msg" >> "$LOG"
  printf '%-13s %4ss %6s\n' "$res" "$((t1-t0))" "$specs"
}

run_all() {
  local want="${1:-}"
  [ -x "$TOOL" ] || die "no tool at $TOOL (set TOOL=...)"
  case "$SETS" in ag|fixed|both) ;; *) die "SETS is ag, fixed or both" ;; esac
  [ "$SETS" = fixed ] || [ -d "$AG" ] \
    || die "no projects at $AG (set AG=..., or SETS=fixed)"
  # a unit is compiled in its own project directory, so neither the tool nor
  # the output directory can stay relative
  TOOL=$(cd "$(dirname "$TOOL")" && pwd)/$(basename "$TOOL")
  [ "$SETS" = fixed ] || AG=$(cd "$AG" && pwd)
  mkdir -p "$OUT"
  OUT=$(cd "$OUT" && pwd)
  LOG="$OUT/ada_output.log"
  REPORT="$OUT/ada_report.txt"

  # one unit adds to the log rather than replacing it, so re-running a single
  # unit does not throw away a sweep. do_report keeps the last result per name
  if [ -n "$want" ] && [ -f "$LOG" ]; then
    { echo; echo "# re-run of $want at $(date -Is)"; } >> "$LOG"
  else
    {
      echo "########################################################"
      echo "# started    $(date -Is)"
      echo "# host       $(uname -n)  $(uname -sr)"
      echo "# tool       $TOOL"
      echo "# projects   $AG"
      echo "# sets       $SETS"
      echo "# settings   -b -n -l --memory-granularity $GRAN -u $UNWIND $EXTRA"
      echo "# timeout    ${TIMEOUT}s (0 means none)"
      echo "########################################################"
    } > "$LOG"
  fi

  local ran=0 p n fn
  if [ "$SETS" != fixed ]; then
    while read -r p n fn; do
      [ -n "$want" ] && [ "$n" != "$want" ] && continue
      [ -f "$AG/$p/$n.adb" ] || { echo "$p/$n: no $n.adb under $AG" >&2; continue; }
      ran=$((ran+1))
      # shellcheck disable=SC2206
      run_one "$p/$n" "$AG/$p" "$OUT/$p.$n" -f "$fn" -b -n -l \
              --memory-granularity "$GRAN" -u "$UNWIND" ${EXTRA:-} "$n.adb"
    done <<< "$UNITS"
  fi

  # the last line of commands_to_run carries no newline, so read would drop it
  if [ "$SETS" != ag ] && [ -d examples/ada_fixed ]; then
    local u src
    { cat examples/ada_fixed/commands_to_run; echo; } \
    | while read -r _ _ fn _ u _ _ src; do
      [ -n "${src:-}" ] || continue
      n=$(basename "$src" .adb)
      [ -n "$want" ] && [ "$n" != "$want" ] && continue
      # shellcheck disable=SC2206
      run_one "ada_fixed/$n" . "$OUT/ada_fixed.$n" -f "$fn" -u "$u" \
              ${EXTRA:-} "$src"
    done
  fi

  [ "$SETS" = fixed ] || [ "$ran" -gt 0 ] || [ -z "$want" ] \
    || die "no unit called $want"
  echo "# finished   $(date -Is)" >> "$LOG"
}

do_report() {
  [ -f "$LOG" ] || die "no log at $LOG, run \"$0\" first"

  # name|result|secs|specs|msg, one row per unit. A re-run adds a second line
  # for a name, so the last one wins
  local rows
  rows=$(sed -n 's/^=== RESULT \(\S*\) \(\S*\) rc=\(\S*\) secs=\(\S*\) specs=\(\S*\) msg=\(.*\) ===$/\2|\1|\4|\5|\6/p' "$LOG" \
         | awk -F'|' '{ last[$1] = $0 } END { for (k in last) print last[k] }' | sort)

  {
    echo "Ada run report"
    echo
    grep -E '^# (started|finished|host|tool|projects|sets|settings|timeout)' "$LOG"
    echo
    echo "counts"
    echo "------"
    printf '%s\n' "$rows" | awk -F'|' 'NF { print $2 }' \
      | sort | uniq -c | sort -rn | awk '{ printf "  %5d %s\n", $1, $2 }'
    echo "  ---"
    printf '  %5d total\n' "$(printf '%s\n' "$rows" | grep -c .)"
    echo
    echo "per unit"
    echo "--------"
    printf '  %-26s %-13s %6s %6s  %s\n' UNIT RESULT SECS SPECS MESSAGE
    printf '%s\n' "$rows" \
      | awk -F'|' 'NF { printf "  %-26s %-13s %6s %6s  %s\n", $1, $2, $3, $4, $5 }'
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
