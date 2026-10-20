#!/usr/bin/bash
#
# Build GNAT-LLVM (Ada -> LLVM IR) inside an activated conda environment,
# without root. This is what `make gnat-llvm` does, for a machine where that
# target cannot run: it installs LLVM and a bootstrap Ada compiler with
# `sudo apt`, which a cluster node has neither the packages nor the rights for.
#
#   ./scripts/install_gnat_conda.sh            # every stage, then the smoke test
#   ./scripts/install_gnat_conda.sh verify     # one stage on its own
#
# Stages, in order: preflight bootstrap sources patch compiler wire runtime
# verify. Each leaves a stamp under $PREFIX/.stamps, so running the script
# again only redoes what is missing. "clean" drops the build products and keeps
# the sources; "distclean" removes $PREFIX.
#
# Where the pieces come from:
#   LLVM and clang      the activated environment, through llvm-config
#   bootstrap GNAT      a relocatable tarball of AdaCore's FSF builds,
#   and gprbuild        unpacked under $PREFIX/bootstrap
#
# conda-forge has no Ada compiler and gnat-llvm is itself written in Ada, so
# the bootstrap cannot come from conda. Those two tarballs need no root and
# distclean takes them with it.
#
# Env overrides:
#   PREFIX       where everything goes  (default ../gnat-llvm-build)
#   LLVM_CONFIG  which LLVM to build against  (default the one on PATH)
#   JOBS         parallel jobs          (default nproc)
#   GNAT_REL / GPRBUILD_REL    the bootstrap releases
#   GNAT_LLVM_COMMIT / GCC_COMMIT / BINDINGS_BRANCH
#
# The LLVM version is not free. gnat-llvm talks to LLVM through AdaCore's Ada
# bindings, which exist on a branch per major version and not for every one, so
# the environment has to carry an LLVM the bindings cover. llvmbmc itself links
# LLVM 20 and is a separate build; the two do not have to agree, and on the
# development machine they do not.

set -u
cd "$(dirname "$0")/.."

PREFIX=${PREFIX:-../gnat-llvm-build}
JOBS=${JOBS:-$(nproc)}

# the pair is known good together. AdaCore's release branches pair with their
# internal GNAT snapshots rather than with an FSF branch, so bump both or
# neither
GNAT_LLVM_COMMIT=${GNAT_LLVM_COMMIT:-6153a1d0c817411fc98883a62e822f048d8604a1}
GCC_COMMIT=${GCC_COMMIT:-747ed054dde27829eede8374e417eecd58769c0e}

GNAT_REL=${GNAT_REL:-gnat-14.2.0-1}
GPRBUILD_REL=${GPRBUILD_REL:-gprbuild-24.0.0-2}

GNAT_LLVM_URL=https://github.com/AdaCore/gnat-llvm.git
# gcc.gnu.org answers 429 to a cluster's shared address often enough to matter
GCC_URL=https://github.com/gcc-mirror/gcc.git
BINDINGS_URL=https://github.com/AdaCore/llvm-bindings.git
FSF_URL=https://github.com/alire-project/GNAT-FSF-builds/releases/download

die() { echo "$0: $*" >&2; exit 1; }
say() { printf '==> %s\n' "$*"; }

# resolved without being created, so naming an unknown stage leaves nothing
# behind
PREFIX=$(readlink -m "$PREFIX")
SRC=$PREFIX/gnat-llvm
BOOTSTRAP=$PREFIX/bootstrap
STAMPS=$PREFIX/.stamps
BIN=$SRC/llvm-interface/bin

#---------------------------------------------------------------------------
# preflight
#
# Everything this stage asks about has a one line answer, so it asks about all
# of them and reports every miss at once rather than one per run.
#---------------------------------------------------------------------------
do_preflight() {
  mkdir -p "$STAMPS" || die "cannot create $STAMPS"
  local miss=0
  note() { echo "  - $*" >&2; miss=$((miss+1)); }
  hint() { echo "    $*" >&2; }

  [ "$(uname -m)" = x86_64 ] || note "this script targets x86_64, not $(uname -m)"
  [ -n "${CONDA_PREFIX:-}" ] || note "no CONDA_PREFIX: activate the environment first"

  LLVM_CONFIG=${LLVM_CONFIG:-$(command -v llvm-config || true)}
  if [ -z "$LLVM_CONFIG" ] || [ ! -x "$LLVM_CONFIG" ]; then
    note "no llvm-config on PATH (conda-forge ships it in llvmdev)"
  else
    LLVM_MAJOR=$("$LLVM_CONFIG" --version | cut -d. -f1)
    LLVM_LIBDIR=$("$LLVM_CONFIG" --libdir)
    BINDINGS_BRANCH=${BINDINGS_BRANCH:-llvm-$LLVM_MAJOR}
    if ! git ls-remote --exit-code --heads "$BINDINGS_URL" "$BINDINGS_BRANCH" >/dev/null 2>&1
    then
      note "llvm-bindings has no $BINDINGS_BRANCH branch for LLVM $LLVM_MAJOR"
      hint "it carries: $(git ls-remote --heads "$BINDINGS_URL" 2>/dev/null \
            | sed 's#.*refs/heads/##' | grep -x 'llvm-[0-9]*' | tr '\n' ' ')"
      hint "llvmbmc links LLVM 20, which is not one of them, so gnat-llvm"
      hint "needs an environment of its own:"
      hint "  conda create -n gnatllvm -c conda-forge llvmdev=21 clangdev=21 \\"
      hint "    make cmake git python=3.11 gcc_linux-64 gxx_linux-64"
    fi
    [ -f "$("$LLVM_CONFIG" --includedir)/clang/Basic/Version.h" ] \
      || note "no clang headers beside LLVM $LLVM_MAJOR (conda-forge: clangdev)"
    ls "$LLVM_LIBDIR"/libclang-cpp.so* >/dev/null 2>&1 \
      || note "no libclang-cpp in $LLVM_LIBDIR; the linker is given -lclang-cpp"
  fi

  local t
  for t in git curl tar make python3; do
    command -v "$t" >/dev/null || note "no $t on PATH"
  done

  local avail
  avail=$(df --output=avail -k "$PREFIX" | tail -1)
  [ "$avail" -ge $((9 * 1024 * 1024)) ] \
    || echo "warning: under 9 GB free at $PREFIX ($((avail / 1024 / 1024)) GB)" >&2

  [ "$miss" = 0 ] || die "$miss thing(s) above have to be settled first"
  say "LLVM $LLVM_MAJOR at $LLVM_CONFIG, bindings $BINDINGS_BRANCH"
  touch "$STAMPS/preflight"
}

# the stages after preflight need its findings, and a stage run on its own has
# not been through it, so they are read back rather than assumed
load_env() {
  [ -f "$STAMPS/preflight" ] || do_preflight
  LLVM_CONFIG=${LLVM_CONFIG:-$(command -v llvm-config || true)}
  [ -x "$LLVM_CONFIG" ] || die "no llvm-config; run the preflight stage"
  LLVM_MAJOR=$("$LLVM_CONFIG" --version | cut -d. -f1)
  LLVM_LIBDIR=$("$LLVM_CONFIG" --libdir)
  BINDINGS_BRANCH=${BINDINGS_BRANCH:-llvm-$LLVM_MAJOR}
  # the bootstrap goes first so gcc and gnatmake mean the tarball's GNAT, which
  # is what gprbuild and gnatmake each pick off PATH independently. Two Ada
  # compilers on PATH is the "compiled with different GNAT versions" failure.
  # The stages chain, so each one calls this and the prefix is added once.
  case ":$PATH:" in
    *":$BOOTSTRAP/gnat/bin:"*) ;;
    *) export PATH="$BOOTSTRAP/gnat/bin:$BOOTSTRAP/gprbuild/bin:$(dirname "$LLVM_CONFIG"):$PATH" ;;
  esac
}

#---------------------------------------------------------------------------
# bootstrap: a relocatable GNAT and gprbuild, in place of gnat-14 and gprbuild
#---------------------------------------------------------------------------
do_bootstrap() {
  load_env
  local dl=$PREFIX/dl
  mkdir -p "$dl" "$BOOTSTRAP"

  fetch_tarball() {   # <release tag> <tarball name> <target dir>
    local rel=$1 tgz=$2 dir=$3
    if [ ! -f "$dl/$tgz" ]; then
      say "downloading $tgz"
      curl -fL --retry 3 -o "$dl/$tgz.part" "$FSF_URL/$rel/$tgz" \
        || die "could not download $tgz"
      mv "$dl/$tgz.part" "$dl/$tgz"
    fi
    rm -rf "$dir"; mkdir -p "$dir"
    tar -xzf "$dl/$tgz" -C "$dir" --strip-components=1 \
      || die "could not unpack $tgz"
  }

  fetch_tarball "$GNAT_REL"     "gnat-x86_64-linux-${GNAT_REL#gnat-}.tar.gz" \
                "$BOOTSTRAP/gnat"
  fetch_tarball "$GPRBUILD_REL" "gprbuild-x86_64-linux-${GPRBUILD_REL#gprbuild-}.tar.gz" \
                "$BOOTSTRAP/gprbuild"

  hash -r
  command -v gnatmake >/dev/null  || die "the gnat tarball has no gnatmake"
  command -v gprbuild >/dev/null  || die "the gprbuild tarball has no gprbuild"
  say "bootstrap $(gnatmake --version | head -1), $(gprbuild --version | head -1)"
  touch "$STAMPS/bootstrap"
}

#---------------------------------------------------------------------------
# sources
#
# A pinned commit is fetched by name at depth one. The GCC checkout is the
# Ada front end only as far as we care, but the repository is 1.5 GB and a
# full clone of it is most of the wall clock of this stage.
#---------------------------------------------------------------------------
do_sources() {
  load_env
  [ -f "$STAMPS/bootstrap" ] || do_bootstrap

  fetch_commit() {   # <dir> <url> <commit>
    local dir=$1 url=$2 sha=$3
    if [ ! -d "$dir/.git" ]; then
      mkdir -p "$dir"
      git -C "$dir" init -q
      git -C "$dir" remote add origin "$url"
    fi
    # re-asserted every run, so a directory left by a failed run with the
    # wrong remote repairs itself instead of failing the same way again
    git -C "$dir" remote set-url origin "$url"
    [ "$(git -C "$dir" rev-parse HEAD 2>/dev/null || true)" = "$sha" ] && return 0
    git -C "$dir" fetch -q --depth 1 origin "$sha" || die "could not fetch $sha from $url"
    git -C "$dir" checkout -q -f -B pinned FETCH_HEAD
  }

  say "fetching gnat-llvm $GNAT_LLVM_COMMIT"
  fetch_commit "$SRC" "$GNAT_LLVM_URL" "$GNAT_LLVM_COMMIT"
  say "fetching the GCC Ada front end (~1.5 GB)"
  fetch_commit "$SRC/llvm-interface/gcc" "$GCC_URL" "$GCC_COMMIT"
  ln -sfn gcc/gcc/ada "$SRC/llvm-interface/gnat_src"
  say "GCC BASE-VER $(cat "$SRC/llvm-interface/gcc/gcc/BASE-VER")"

  say "fetching the Ada bindings for LLVM ($BINDINGS_BRANCH)"
  if [ ! -d "$SRC/llvm-bindings/.git" ]; then
    git clone -q --branch "$BINDINGS_BRANCH" --single-branch --depth 1 \
      "$BINDINGS_URL" "$SRC/llvm-bindings" || die "could not clone the bindings"
  fi
  touch "$STAMPS/sources"
}

#---------------------------------------------------------------------------
# patch
#
# Four edits, and each is checked for afterwards. The originals are kept and
# copied back first, so the stage can be re-run.
#---------------------------------------------------------------------------
do_patch() {
  load_env
  [ -f "$STAMPS/sources" ] || do_sources
  cd "$SRC/llvm-interface" || die "no $SRC/llvm-interface"

  local f
  for f in gnat_llvm.gpr tools.gpr; do
    [ -f "$f.orig" ] || cp "$f" "$f.orig"
    cp "$f.orig" "$f"
  done

  # -gnatg is GNAT internal mode and makes warnings fatal, and the bootstrap
  # GNAT warns on front end sources its own version does not
  sed -i 's/Common_Switches := ("-g", "-gnatg", "-gnatep=prep.control",/Common_Switches := ("-g", "-gnatg", "-gnatwU", "-gnatws", "-gnatep=prep.control",/' gnat_llvm.gpr
  sed -i 's/^   Common_Switches := ("-g", "-gnatg");/   Common_Switches := ("-g", "-gnatg", "-gnatwU", "-gnatws");/' tools.gpr

  # a conda environment has libclang-cpp.so and none of the per component
  # archives the stock file asks for, and the rpath keeps the compiler working
  # from a shell that has not activated the environment
  sed -i 's#for Switches ("Ada") use ("-static-libstdc++", "-lclangBasic");#for Switches ("Ada") use ("--driver-mode=g++", "-static-libstdc++", "-lclang-cpp", "-Wl,-rpath,'"$LLVM_LIBDIR"'");#' gnat_llvm.gpr

  # the runtime rule runs sed -f gnat_src/xsintnam.sed, which FSF GCC does not
  # ship at all. It is the one rename.
  printf 's/Ada\\.Interrupts\\.Names/System.Interrupt_Names/g\n' > gnat_src/xsintnam.sed

  grep -q -- '-gnatws' gnat_llvm.gpr || die "gnat_llvm.gpr warning switches not applied"
  grep -q -- '-gnatws' tools.gpr     || die "tools.gpr warning switches not applied"
  grep -q -- '-lclang-cpp' gnat_llvm.gpr || die "gnat_llvm.gpr linker switches not applied"
  [ -s gnat_src/xsintnam.sed ]       || die "xsintnam.sed not written"

  cd - >/dev/null
  touch "$STAMPS/patch"
}

#---------------------------------------------------------------------------
# compiler
#---------------------------------------------------------------------------
do_compiler() {
  load_env
  [ -f "$STAMPS/patch" ] || do_patch
  say "building the compiler on $JOBS cores; this takes a while"
  make -C "$SRC" clean >/dev/null 2>&1
  make -C "$SRC" build LLVM_CONFIG="$LLVM_CONFIG" -j"$JOBS" 2>&1 \
    | tee "$PREFIX/build-compiler.log" \
    | grep -E --line-buffered 'error|Error|\*\*\*'
  [ -x "$BIN/llvm-gcc" ] \
    || die "the compiler did not build; see $PREFIX/build-compiler.log"
  touch "$STAMPS/compiler"
}

#---------------------------------------------------------------------------
# wire
#
# The runtime is built by gprbuild, which finds a compiler through gprconfig.
# Three things have to line up or it falls back to the bootstrap GNAT and the
# runtime build dies on a unit the fresh front end no longer has.
#---------------------------------------------------------------------------
do_wire() {
  load_env
  [ -f "$STAMPS/compiler" ] || do_compiler
  cd "$SRC/llvm-interface" || die "no $SRC/llvm-interface"

  local llvm_triple gcc_triple major t
  llvm_triple=$("$BIN/llvm-gcc" -dumpmachine)
  gcc_triple=$(gcc -dumpmachine)
  say "wiring gprbuild discovery (llvm triple $llvm_triple)"

  # gprconfig's rule builds the driver name as llvm-gcc-<version>. A symlink
  # is not enough: llvm-gcc dispatches on argv[0] and refuses a name it does
  # not know, so the shim execs back through the real one.
  major=$("$BIN/llvm-gcc" -v 2>&1 \
          | grep -oE '^[-a-z]*gcc [^ ]+ ([^ ]+)' | awk '{print $3}' | head -1)
  major=${major:-16}
  rm -f "$BIN/llvm-gcc-$major"
  printf '#!/bin/sh\nexec "$(dirname "$0")/llvm-gcc" "$@"\n' > "$BIN/llvm-gcc-$major"
  chmod +x "$BIN/llvm-gcc-$major"

  for t in gcc gnat gnat1 gnatbind gnatchop gnatclean gnatkr gnatlink gnatls \
           gnatmake gnatname gnatprep; do
    [ -e "$BIN/llvm-$t" ] || continue
    ln -sf "llvm-$t" "$BIN/$t"
    ln -sf "llvm-$t" "$BIN/$llvm_triple-$t"
    ln -sf "llvm-$t" "$BIN/$gcc_triple-$t"
  done

  # gprconfig looks for the runtime at <bin>/../lib/rts-native/adalib, and the
  # Makefile builds it under lib/gnat-llvm/<triple>/rts-native. Without one it
  # does not offer the compiler at all.
  mkdir -p "lib/gnat-llvm/$llvm_triple/rts-native"
  ln -sfn "gnat-llvm/$llvm_triple/rts-native" lib/rts-native

  cd - >/dev/null
  touch "$STAMPS/wire"
}

#---------------------------------------------------------------------------
# runtime
#---------------------------------------------------------------------------
do_runtime() {
  load_env
  [ -f "$STAMPS/wire" ] || do_wire
  local llvm_triple lib
  llvm_triple=$("$BIN/llvm-gcc" -dumpmachine)
  say "building the Ada runtime"
  make -C "$SRC" gnatlib target="$llvm_triple" LLVM_CONFIG="$LLVM_CONFIG" 2>&1 \
    | tee "$PREFIX/build-runtime.log" \
    | grep -E --line-buffered 'error|Error|unexpected program|\*\*\*'
  for lib in libgnat.a libgnarl.a; do
    [ -f "$SRC/llvm-interface/lib/rts-native/adalib/$lib" ] \
      || die "the runtime did not build: $lib missing, see $PREFIX/build-runtime.log"
  done
  say "adalib has $(ls "$SRC/llvm-interface/lib/rts-native/adalib" | wc -l) files"
  touch "$STAMPS/runtime"
}

#---------------------------------------------------------------------------
# verify: Ada to .ll, the IR verifier over it, then a binary that runs
#---------------------------------------------------------------------------
do_verify() {
  load_env
  [ -f "$STAMPS/runtime" ] || do_runtime
  [ -x "$BIN/llvm-gcc" ] || die "no $BIN/llvm-gcc"
  export PATH="$BIN:$PATH"

  local t out
  t=$(mktemp -d) || die "cannot make a temporary directory"
  trap 'rm -rf "$t"' EXIT
  cat > "$t/hello.adb" <<'ADA'
with Ada.Text_IO; use Ada.Text_IO;

procedure Hello is
   Total : Integer := 0;
begin
   for I in 1 .. 10 loop
      Total := Total + I * I;
   end loop;
   Put_Line ("Sum of squares 1..10 =" & Integer'Image (Total));
end Hello;
ADA
  cd "$t" || die "cannot enter $t"

  say "adb to ll"
  llvm-gcc -c -S -emit-llvm hello.adb || die "llvm-gcc could not compile hello.adb"
  grep -q '^target triple' hello.ll   || die "hello.ll carries no target triple"
  say "$(wc -l < hello.ll) lines of IR"
  say "the IR verifies"
  opt -passes=verify hello.ll -o /dev/null || die "the IR does not verify"
  say "a native binary"
  llvm-gnatmake -q hello.adb || die "llvm-gnatmake failed"
  out=$(./hello)
  [ "$out" = "Sum of squares 1..10 = 385" ] || die "hello printed \"$out\""

  cd - >/dev/null
  say "all checks passed"
  echo
  echo "point the tool at it, either in the environment"
  echo "    export GNAT_LLVM_BIN=$BIN"
  echo "or at configure time"
  echo "    cmake -DGNAT_LLVM_BIN=$BIN ..."
  echo
  echo "c2ir also asks the compiler for its system include directories and"
  echo "does it by running plain \"gcc\", so keep one on PATH; a conda"
  echo "environment often has only x86_64-conda-linux-gnu-gcc."
}

do_clean() {
  say "removing the build products, keeping the sources"
  [ -d "$SRC" ] && make -C "$SRC" clean >/dev/null 2>&1
  rm -rf "$SRC/llvm-interface/lib" "$BIN"
  rm -f "$STAMPS"/{compiler,wire,runtime}
}

do_distclean() {
  say "removing $PREFIX"
  rm -rf "$PREFIX"
}

case "${1:-all}" in
  all)        do_preflight; do_verify ;;
  preflight)  do_preflight ;;
  bootstrap)  do_bootstrap ;;
  sources)    do_sources ;;
  patch)      do_patch ;;
  compiler)   do_compiler ;;
  wire)       do_wire ;;
  runtime)    do_runtime ;;
  verify)     do_verify ;;
  clean)      do_clean ;;
  distclean)  do_distclean ;;
  *)          die "unknown stage $1; one of all preflight bootstrap sources" \
                  "patch compiler wire runtime verify clean distclean" ;;
esac
