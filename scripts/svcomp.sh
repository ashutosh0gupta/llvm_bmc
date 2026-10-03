#!/usr/bin/bash
#
# Fetch and run the part of the SV-COMP task set that matches this tool:
# bit-vectors, loops, control flow, arrays, heap and floats, as named by the
# repository's own .set files. The huge neural-networks directory is left out,
# it is for neural net verifiers and is 629 MB on its own.
#
# Only the C tasks are fetched; the tree has an unrelated Java half.
#
# This is the curated set, 62 of the 167 directories.
#
# Two notes on what this tool can do with the set as it stands. A task whose
# input_files names a .i stops with "File type is not recognized", since only
# .c, .C and .cpp are accepted; that is 963 of the tasks against 1642 that name
# a .c. And there is no --data-model, so every task compiles at the host's
# widths rather than the ILP32 nearly all of them ask for.
#
#   ./scripts/svcomp.sh                  # download, run and score, in one go
#   ./scripts/svcomp.sh all              # the same thing, named
#   ./scripts/svcomp.sh fetch            # clone or update the task tree
#   ./scripts/svcomp.sh run              # run every task not already done
#   ./scripts/svcomp.sh run BitVectors   # or just one category
#   ./scripts/svcomp.sh report           # score what has run so far
#   ./scripts/svcomp.sh status           # what is on disk and what has run
#   ./scripts/svcomp.sh clean-results    # forget the results, keep the tasks
#
# Nothing is ever done twice. fetch leans on git, which downloads only what is
# missing, and writes a stamp so a second fetch with the same categories is a
# no-op. run writes one .res file per task and skips any task that already has
# one, so it can be interrupted, or re-invoked after adding a category, and it
# picks up where it stopped. Delete a .res file to make that one task rerun.
#
# Env overrides:  TOOL  DIR  UNWIND  TIMEOUT  JOBS  MAXMB  CATS  EXTRA
#                 SKIP_DIRS  DATAMODEL_FLAG
#
set -u
cd "$(dirname "$0")/.."

REPO=https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks.git
DIR=${DIR:-benchmark/svcomp}
RES=${RES:-$DIR/../svcomp_results}
TOOL=${TOOL:-$PWD/llvmbmc}
UNWIND=${UNWIND:-8}
TIMEOUT=${TIMEOUT:-60}
JOBS=${JOBS:-4}
MAXMB=${MAXMB:-1024}          # refuse to grow the tree past this
CATS=${CATS:-BitVectors Loops ControlFlow Arrays Heap Floats}
EXTRA=${EXTRA:-}              # extra llvmbmc flags, e.g. -b
SKIP_DIRS=${SKIP_DIRS:-neural-networks}
STAMP=$DIR/.fetched            # records which categories are checked out
# empty, because the tool has no --data-model yet. Set it to --data-model once
# it does, so a task is compiled at the widths it asks for.
DATAMODEL_FLAG=${DATAMODEL_FLAG:-}

# ---------------------------------------------------------------- helpers

die() { echo "svcomp: $*" >&2; exit 1; }

# megabytes used by a path, 0 if it is not there yet
mb() { [ -e "$1" ] && du -sm "$1" 2>/dev/null | cut -f1 || echo 0; }

# the directories a category's .set file names, minus the ones we skip
cat_dirs() {
  local set_file="$DIR/c/$1.set"
  [ -f "$set_file" ] || return 0
  local skip_re
  skip_re=$(echo "$SKIP_DIRS" | tr ' ' '|')
  grep -vE '^\s*(#|$)' "$set_file" \
    | sed 's#/\*\.yml##' \
    | grep -vE "^(${skip_re})$" \
    | sort -u
}

# the expected verdict for the reachability property, or "" if the task has none
expected_verdict() {
  awk '
    /property_file:/ { prop = $0 }
    /expected_verdict:/ {
      if (prop ~ /unreach-call\.prp/) { print $2; exit }
    }
  ' "$1"
}

# ILP32 or LP64, as the task asks for
task_data_model() {
  awk -F'[:"]' '/data_model:/ { gsub(/[ \t]/,"",$2); gsub(/[ \t]/,"",$3);
                                print ($3 != "" ? $3 : $2); exit }' "$1"
}

# ---------------------------------------------------------------- fetch

# what the current request would check out, as one line
fetch_key() { echo "$CATS | $SKIP_DIRS"; }

do_fetch() {
  mkdir -p "$(dirname "$DIR")"

  # already have exactly these categories: nothing to do
  if [ -f "$STAMP" ] && [ "$(cat "$STAMP")" = "$(fetch_key)" ] \
     && [ -d "$DIR/c" ]; then
    echo "==> tasks already fetched ($(find "$DIR/c" -name '*.yml' | wc -l) tasks, $(mb "$DIR") MB)"
    return 0
  fi

  if [ ! -d "$DIR/.git" ]; then
    echo "==> cloning (shallow, no blobs, sparse)"
    git clone --depth 1 --filter=blob:none --sparse "$REPO" "$DIR" \
      || die "clone failed"
  else
    echo "==> already cloned, fetching what is new"
    git -C "$DIR" fetch --depth 1 origin 2>&1 | tail -2
    git -C "$DIR" reset --hard origin/HEAD >/dev/null 2>&1 \
      || git -C "$DIR" reset --hard FETCH_HEAD >/dev/null 2>&1 || true
  fi

  # c/properties first: in cone mode that also brings in the .set files sitting
  # directly in c/, and those are what say which directories a category holds
  echo "==> reading the category definitions"
  git -C "$DIR" sparse-checkout set c/properties >/dev/null 2>&1 \
    || die "sparse-checkout failed"

  local dirs=() c d
  for c in $CATS; do
    [ -f "$DIR/c/$c.set" ] || { echo "    no such category: $c" >&2; continue; }
    while read -r d; do
      [ -n "$d" ] && dirs+=("c/$d")
    done < <(cat_dirs "$c")
  done
  [ ${#dirs[@]} -gt 0 ] || die "no directories resolved, is the checkout intact?"

  # drop duplicates, several categories share a directory
  mapfile -t dirs < <(printf '%s\n' "${dirs[@]}" | sort -u)
  echo "    ${#dirs[@]} directories from: $CATS"
  echo "    skipping: $SKIP_DIRS"

  local before
  before=$(mb "$DIR")
  echo "==> checking out the tasks (currently ${before} MB)"
  git -C "$DIR" sparse-checkout set "${dirs[@]}" c/properties \
    || die "sparse-checkout failed"

  local after
  after=$(mb "$DIR")
  echo "==> ${after} MB on disk"
  if [ "$after" -gt "$MAXMB" ]; then
    echo
    echo "svcomp: the tree is ${after} MB, over the ${MAXMB} MB limit." >&2
    echo "        Nothing was deleted. Either raise MAXMB, or add the big" >&2
    echo "        directories to SKIP_DIRS and run fetch again:" >&2
    echo >&2
    du -sm "$DIR"/c/*/ 2>/dev/null | sort -rn | head -5 | sed 's/^/          /' >&2
    exit 1
  fi
  fetch_key > "$STAMP"
}

# ---------------------------------------------------------------- run

run_one() {
  local yml=$1
  local dir base exp src res dm
  dir=$(dirname "$yml"); base=$(basename "$yml" .yml)
  res="$RES/$(basename "$dir")/$base.res"
  [ -f "$res" ] && return 0            # already done, leave it alone

  exp=$(expected_verdict "$yml")
  [ -n "$exp" ] || { mkdir -p "$(dirname "$res")"
                     echo "NOPROP -" > "$res"; return 0; }

  src=$(awk -F"'" '/input_files:/ {print $2; exit}' "$yml")
  [ -n "$src" ] || src=$(awk '/input_files:/ {gsub(/[ \t"]/,"",$2); print $2; exit}' "$yml")
  [ -f "$dir/$src" ] || { mkdir -p "$(dirname "$res")"
                          echo "NOSRC -" > "$res"; return 0; }

  # the data model is recorded in the log; passing it needs DATAMODEL_FLAG
  dm=$(task_data_model "$yml")
  local mflag=""
  [ -n "${DATAMODEL_FLAG:-}" ] && [ -n "$dm" ] && mflag="$DATAMODEL_FLAG $dm"

  mkdir -p "$(dirname "$res")"
  local out log
  out=$(mktemp -d); log="${res%.res}.log"

  echo "# task $base  expected=$exp  data_model=${dm:-unset}" > "$log"
  # shellcheck disable=SC2086
  timeout "$TIMEOUT" "$TOOL" -u "$UNWIND" --unreach-check -o "$out/" \
      $mflag $EXTRA "$dir/$src" >> "$log" 2>&1
  local rc=$? verdict got
  rm -rf "$out"

  verdict=$(grep -oE 'LLVM_BMC_VERIFICATION_[A-Z]+' "$log" | head -1)
  case "$rc:$verdict" in
    0:LLVM_BMC_VERIFICATION_SUCCESSFUL) got=true  ;;
    0:LLVM_BMC_VERIFICATION_FAILED)     got=false ;;
    124:*) got=timeout ;;
    *)     got=unsupported ;;
  esac
  # A FAILED whose failing property is the unwinding assertion is not a claim
  # that the program is unsafe, it says the unroll bound was too small. That is
  # "unknown", which scores nothing; calling it false would score a false alarm.
  if [ "$got" = false ] && grep -q 'loop not fully unrolled' "$log"; then
    got=unknown
  fi

  # a bounded checker cannot prove an unbounded true task, so "true" means only
  # that nothing was found up to the bound
  local mark
  if   [ "$got" = "$exp" ];          then mark=CORRECT
  elif [ "$got" = timeout ];         then mark=TIMEOUT
  elif [ "$got" = unsupported ];     then mark=UNSUPPORTED
  elif [ "$got" = unknown ];         then mark=UNKNOWN
  else                                    mark=WRONG
  fi
  echo "$mark $got/$exp" > "$res"
}
export -f run_one expected_verdict task_data_model
export RES TOOL UNWIND TIMEOUT EXTRA DATAMODEL_FLAG

do_run() {
  [ -x "$TOOL" ] || die "no tool at $TOOL (set TOOL=...)"
  [ -d "$DIR/c" ] || die "no task tree at $DIR, run fetch first"

  local want="${1:-}" c ymls=()
  for c in $CATS; do
    [ -n "$want" ] && [ "$c" != "$want" ] && continue
    while read -r d; do
      [ -d "$DIR/c/$d" ] || continue
      while IFS= read -r y; do ymls+=("$y"); done \
        < <(find "$DIR/c/$d" -name '*.yml' | sort)
    done < <(cat_dirs "$c")
  done
  mapfile -t ymls < <(printf '%s\n' "${ymls[@]}" | sort -u)

  local todo=0 y
  for y in "${ymls[@]}"; do
    local r="$RES/$(basename "$(dirname "$y")")/$(basename "$y" .yml).res"
    [ -f "$r" ] || todo=$((todo+1))
  done
  echo "==> ${#ymls[@]} tasks, $todo still to do"
  [ "$todo" -gt 0 ] || { echo "    nothing new to run"; return 0; }

  printf '%s\n' "${ymls[@]}" | xargs -P "$JOBS" -I{} bash -c 'run_one "$@"' _ {}
}

# ---------------------------------------------------------------- status

do_status() {
  echo
  if [ -d "$DIR/c" ]; then
    echo "tasks   : $(find "$DIR/c" -name '*.yml' 2>/dev/null | wc -l) in $(mb "$DIR") MB at $DIR"
  else
    echo "tasks   : none fetched yet"
  fi
  if [ -d "$RES" ]; then
    local n; n=$(find "$RES" -name '*.res' 2>/dev/null | wc -l)
    echo "results : $n"
    if [ "$n" -gt 0 ]; then
      echo
      cat "$RES"/*/*.res 2>/dev/null | awk '{print $1}' | sort | uniq -c \
        | sort -rn | sed 's/^/  /'
    fi
  else
    echo "results : none"
  fi
}

# ---------------------------------------------------------------- report

# The score. A task counts as attempted when it has a reachability property
# and a source on disk; NOPROP and NOSRC are neither passes nor failures, so
# they are not in the denominator.
do_report() {
  [ -d "$RES" ] || die "no results yet, run \"$0 all\" first"
  local n
  n=$(find "$RES" -name '*.res' 2>/dev/null | wc -l)
  [ "$n" -gt 0 ] || die "no results yet, run \"$0 all\" first"

  # one pass over the results, not one per bucket
  local correct wrong unknown timeout unsup noprop nosrc attempted answered
  read -r correct wrong unknown timeout unsup noprop nosrc < <(
    cat "$RES"/*/*.res 2>/dev/null | awk '
      { c[$1]++ }
      END { printf "%d %d %d %d %d %d %d\n",
              c["CORRECT"], c["WRONG"], c["UNKNOWN"], c["TIMEOUT"],
              c["UNSUPPORTED"], c["NOPROP"], c["NOSRC"] }' )
  attempted=$((correct+wrong+unknown+timeout+unsup))
  answered=$((correct+wrong))

  local pct=0 apct=0
  [ "$attempted" -gt 0 ] && pct=$((100*correct/attempted))
  [ "$answered"  -gt 0 ] && apct=$((100*correct/answered))

  echo
  echo "===================== curated set ===================================="
  printf '  PASSED   %d / %d  (%d%%)   of the tasks it was asked to verify\n' \
         "$correct" "$attempted" "$pct"
  printf '           %d / %d  (%d%%)   of the tasks it gave an answer for\n' \
         "$correct" "$answered" "$apct"
  echo "======================================================================"
  echo
  printf '  %-12s %6d  %s\n' \
    correct     "$correct" "verdict matched the expected one" \
    wrong       "$wrong"   "verdict disagreed" \
    unknown     "$unknown" "unroll bound too small; claims nothing" \
    timeout     "$timeout" "over ${TIMEOUT}s" \
    unsupported "$unsup"   "stopped while translating"
  echo
  printf '  %-12s %6d  %s\n' \
    "not run"   "$((noprop+nosrc))" \
    "no reachability property ($noprop) or no source ($nosrc)"
  printf '  %-12s %6d\n' total "$n"

  # only the rows worth looking at: somewhere a task disagreed
  if [ "$wrong" -gt 0 ]; then
    echo
    echo "  disagreeing tasks:"
    grep -l '^WRONG' "$RES"/*/*.res 2>/dev/null \
      | sed "s|^$RES/||; s|\.res$||" | sed 's/^/    /' | head -40
  fi

  echo
  echo "  per category (correct/attempted), busiest first:"
  local d
  for d in "$RES"/*/; do
    [ -d "$d" ] || continue
    local c a
    c=$(awk '$1=="CORRECT"' "$d"/*.res 2>/dev/null | wc -l)
    a=$(awk '$1!="NOPROP" && $1!="NOSRC"' "$d"/*.res 2>/dev/null | wc -l)
    [ "$a" -gt 0 ] || continue
    printf '%08d\t    %-40s %4d/%d\n' "$a" "$(basename "$d")" "$c" "$a"
  done | sort -rn | cut -f2-
  echo
  local root=$PWD
  echo "  detail: $(cd "$RES" && pwd | sed "s|^$root/||")/<category>/<task>.log"
}

# ---------------------------------------------------------------- all

do_all() {
  do_fetch
  do_run "${1:-}"
  do_report
}

# ---------------------------------------------------------------- main

case "${1:-all}" in
  all)           shift; do_all "${1:-}" ;;
  fetch)         do_fetch; do_status ;;
  run)           shift; do_run "${1:-}"; do_report ;;
  report)        do_report ;;
  status)        do_status ;;
  clean-results) rm -rf "$RES"; echo "results cleared, tasks kept" ;;
  *) die "usage: $0 [all|fetch|run|report|status|clean-results] [category]" ;;
esac
