# Makefile — build GNAT-LLVM (Ada -> LLVM IR) on Ubuntu 24.04 LTS.
#
#   make gnat-llvm     build everything, then verify   (the main target)
#   make verify        re-run the smoke test only
#   make help          list all targets
#
# Individual stages can be run on their own: deps, sources, patch, compiler,
# wire, runtime, path. Each stage records a stamp under $(STAMPS), so re-running
# `make gnat-llvm` only redoes what is missing.
#
#   make gnat-llvm SKIP_DEPS=1     skip apt/LLVM install (packages already present)
#   make gnat-llvm PREFIX=/opt/gl  build somewhere other than ~/gnat-llvm-build
#
# Needs ~9 GB free disk, a network connection, and sudo (unless SKIP_DEPS=1).

SHELL       := /bin/bash
# -e and pipefail, but deliberately not -u: bash sources /etc/bash.bashrc for
# non-interactive shells started by sshd, and Ubuntu's copy reads PS1 unguarded,
# which -u turns into noise on every recipe line.
.SHELLFLAGS := -e -o pipefail -c
.ONESHELL:
.DELETE_ON_ERROR:

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
# PREFIX   ?= $(HOME)/gnat-llvm-build
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PREFIX       ?= $(MAKEFILE_DIR)gnat-llvm-build
SRC      := $(PREFIX)/gnat-llvm
BOOTSTRAP:= $(PREFIX)/bootstrap-bin
STAMPS   := $(PREFIX)/.stamps
BIN      := $(SRC)/llvm-interface/bin

LLVM_VER    ?= 21
LLVM_DIR    := /usr/lib/llvm-$(LLVM_VER)
LLVM_CONFIG := $(LLVM_DIR)/bin/llvm-config

GNAT_VER ?= 14
SKIP_DEPS ?= 0

# Pinned upstream revisions.
#
# AdaCore's gnat-llvm release branches (25.x, 26.x) pair with AdaCore's *internal*
# GNAT snapshots rather than FSF release branches, so pairing a release branch
# with an FSF gcc branch reliably fails — either on front-end entities the
# sources lack, or on the compiler demanding runtime units GCC no longer ships.
# The pair below is known good. Bump both together or neither.
GNAT_LLVM_COMMIT ?= 6153a1d0c817411fc98883a62e822f048d8604a1
GCC_COMMIT       ?= 747ed054dde27829eede8374e417eecd58769c0e
BINDINGS_BRANCH  ?= llvm-21

# Keep these comments on their own lines: make preserves the whitespace *before*
# a trailing `#`, which would silently append spaces to the URL.
# GCC comes from the GitHub mirror because gcc.gnu.org rate-limits (HTTP 429).
GNAT_LLVM_URL := https://github.com/AdaCore/gnat-llvm.git
GCC_URL       := https://github.com/gcc-mirror/gcc.git
BINDINGS_URL  := https://github.com/AdaCore/llvm-bindings.git

# The bootstrap toolchain must come first so `gcc`/`gnatmake` mean GNAT $(GNAT_VER).
export PATH := $(BOOTSTRAP):$(LLVM_DIR)/bin:$(PATH)

CYAN := \033[1;36m
RED  := \033[1;31m
OFF  := \033[0m

.PHONY: gnat-llvm all deps sources patch compiler wire runtime path verify \
        help clean distclean check-env

gnat-llvm: verify
all: gnat-llvm

help:
	@echo "Targets:"
	@echo "  gnat-llvm   full build + smoke test (default)"
	@echo "  deps        install LLVM $(LLVM_VER), GNAT $(GNAT_VER), build tools   [sudo]"
	@echo "  sources     fetch pinned gnat-llvm / GCC front-end / llvm-bindings"
	@echo "  patch       apply the local source fixes"
	@echo "  compiler    build llvm-gcc, llvm-gnat1, llvm-gnatmake, ..."
	@echo "  wire        make the fresh compiler discoverable by gprbuild"
	@echo "  runtime     build libgnat.a / libgnarl.a"
	@echo "  path        add the toolchain to ~/.bashrc and ~/.profile"
	@echo "  verify      compile Ada -> .ll, verify the IR, build and run a binary"
	@echo "  clean       remove build products, keep the fetched sources"
	@echo "  distclean   remove $(PREFIX) entirely"
	@echo
	@echo "Options: SKIP_DEPS=1  PREFIX=<dir>  LLVM_VER=<n>  GNAT_VER=<n>"

# ---------------------------------------------------------------------------
# 0. Environment sanity
# ---------------------------------------------------------------------------
check-env:
	@if [ "$$(uname -m)" != x86_64 ]; then
	    printf '$(RED)error:$(OFF) this Makefile targets x86_64 (got %s)\n' "$$(uname -m)" >&2; exit 1
	fi
	if ! grep -q 'VERSION_ID="24.04"' /etc/os-release 2>/dev/null; then
	    echo "warning: not Ubuntu 24.04 — package names may differ" >&2
	fi
	avail=$$(df --output=avail -k / | tail -1)
	if [ "$$avail" -lt $$((9 * 1024 * 1024)) ]; then
	    echo "warning: less than 9 GB free on / ($$((avail / 1024 / 1024)) GB)" >&2
	fi
	# Advisory only. check-env runs on every invocation, so a transient blip here
	# must not fail a build that has nothing left to fetch; the `sources` stage
	# fails loudly on its own if the network really is down.
	if ! curl -fsS -o /dev/null --max-time 20 --retry 2 https://github.com; then
	    echo "warning: could not reach github.com — fetching sources may fail" >&2
	fi

$(STAMPS):
	@mkdir -p $@

# ---------------------------------------------------------------------------
# 1. Dependencies
#
# noble's archive tops out at LLVM 19, so LLVM 21 comes from apt.llvm.org.
#
# libstdc++-$(GNAT_VER)-dev is not optional: clang selects the *newest* GCC
# install dir it can find (GCC $(GNAT_VER), pulled in by gnat-$(GNAT_VER)).
# Without the matching libstdc++ there, llvm_wrapper.cc fails to compile with
# "'cstdint' file not found" and then fails to link with "cannot find -lstdc++".
# ---------------------------------------------------------------------------
deps: $(STAMPS)/deps
$(STAMPS)/deps: | $(STAMPS)
	@if [ "$(SKIP_DEPS)" = 1 ]; then
	    printf '$(CYAN)==> skipping dependency install (SKIP_DEPS=1)$(OFF)\n'
	    if [ ! -x "$(LLVM_CONFIG)" ]; then
	        printf '$(RED)error:$(OFF) LLVM $(LLVM_VER) not found at $(LLVM_CONFIG)\n' >&2; exit 1
	    fi
	else
	    printf '$(CYAN)==> installing dependencies$(OFF)\n'
	    sudo -v
	    if [ ! -x "$(LLVM_CONFIG)" ]; then
	        tmp=$$(mktemp -d)
	        curl -fsSL -o "$$tmp/llvm.sh" https://apt.llvm.org/llvm.sh
	        chmod +x "$$tmp/llvm.sh"
	        sudo "$$tmp/llvm.sh" $(LLVM_VER)
	        rm -rf "$$tmp"
	    fi
	    sudo apt-get update -qq
	    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq \
	        build-essential git make cmake python3 pkg-config \
	        libncurses-dev zlib1g-dev libzstd-dev \
	        gnat-$(GNAT_VER) gprbuild g++-$(GNAT_VER) libstdc++-$(GNAT_VER)-dev \
	        llvm-$(LLVM_VER)-dev llvm-$(LLVM_VER)-tools clang-$(LLVM_VER) \
	        lld-$(LLVM_VER) libclang-$(LLVM_VER)-dev libclang-cpp$(LLVM_VER)-dev
	    # gprbuild and gnatmake each pick an Ada compiler off PATH. With GNAT 13's
	    # backend still installed they disagree, and the build dies with
	    #   "gnat.ads" and "gen_il-main.adb" compiled with different GNAT versions
	    # gprbuild depends only on libgnat-13, not the compiler, so this is safe.
	    if dpkg -l gnat-13-x86-64-linux-gnu 2>/dev/null | grep -q '^ii'; then
	        sudo DEBIAN_FRONTEND=noninteractive apt-get remove -y -qq gnat-13-x86-64-linux-gnu
	    fi
	fi
	command -v gnatmake-$(GNAT_VER) >/dev/null || {
	    printf '$(RED)error:$(OFF) gnat-$(GNAT_VER) is missing\n' >&2; exit 1; }
	if dpkg -l gnat-13-x86-64-linux-gnu 2>/dev/null | grep -q '^ii'; then
	    printf '$(RED)error:$(OFF) remove gnat-13-x86-64-linux-gnu (v13/v14 object mismatch)\n' >&2; exit 1
	fi
	# Bootstrap dir: pin every Ada tool to the -$(GNAT_VER) variant.
	rm -rf $(BOOTSTRAP); mkdir -p $(BOOTSTRAP)
	for t in gcc cpp gnat gnatbind gnatchop gnatclean gnatkr gnatlink gnatls \
	         gnatmake gnatname gnatprep; do
	    if [ -x "/usr/bin/$$t-$(GNAT_VER)" ]; then
	        ln -sf "/usr/bin/$$t-$(GNAT_VER)" "$(BOOTSTRAP)/$$t"
	    fi
	done
	ln -sf /usr/bin/gcc-$(GNAT_VER) "$(BOOTSTRAP)/$$(gcc-$(GNAT_VER) -dumpmachine)-gcc"
	touch $@

# ---------------------------------------------------------------------------
# 2. Sources
# ---------------------------------------------------------------------------
sources: $(STAMPS)/sources
# check-env is order-only: it is .PHONY, so as a normal prerequisite it would be
# "newer" on every run and force the whole stamp chain to rebuild from scratch.
$(STAMPS)/sources: $(STAMPS)/deps | check-env
	@fetch() {   # <dir> <url> <commit>
	    if [ ! -d "$$1/.git" ]; then
	        mkdir -p "$$1"; git -C "$$1" init -q; git -C "$$1" remote add origin "$$2"
	    fi
	    # Always (re)assert the URL rather than only on first init, so a repo left
	    # behind by a failed run with a bad remote repairs itself on the next run.
	    git -C "$$1" remote set-url origin "$$2"
	    if [ "$$(git -C "$$1" rev-parse HEAD 2>/dev/null || true)" != "$$3" ]; then
	        git -C "$$1" fetch -q --depth 1 origin "$$3"
	        git -C "$$1" checkout -q -f -B pinned FETCH_HEAD
	    fi
	}
	printf '$(CYAN)==> fetching gnat-llvm$(OFF)\n'
	fetch "$(SRC)" "$(GNAT_LLVM_URL)" "$(GNAT_LLVM_COMMIT)"
	printf '$(CYAN)==> fetching GCC Ada front-end (~1.5 GB)$(OFF)\n'
	fetch "$(SRC)/llvm-interface/gcc" "$(GCC_URL)" "$(GCC_COMMIT)"
	ln -sfn gcc/gcc/ada $(SRC)/llvm-interface/gnat_src
	echo "    GCC BASE-VER: $$(cat $(SRC)/llvm-interface/gcc/gcc/BASE-VER)"
	printf '$(CYAN)==> fetching Ada bindings for LLVM ($(BINDINGS_BRANCH))$(OFF)\n'
	if [ ! -d "$(SRC)/llvm-bindings/.git" ]; then
	    git clone -q --branch $(BINDINGS_BRANCH) --single-branch --depth 1 \
	        $(BINDINGS_URL) $(SRC)/llvm-bindings
	fi
	touch $@

# ---------------------------------------------------------------------------
# 3. Source patches
# ---------------------------------------------------------------------------
patch: $(STAMPS)/patch
$(STAMPS)/patch: $(STAMPS)/sources
	@printf '$(CYAN)==> patching sources$(OFF)\n'
	cd $(SRC)/llvm-interface
	# (a) -gnatg (GNAT internal mode) implies warnings-as-errors, and GNAT
	#     $(GNAT_VER) warns on GCC 16 front-end code that GNAT 16 does not, e.g.
	#       sem_ch12.adb: warning: renamed variable "Assoc" is not referenced
	#     -gnatwn restores normal, non-fatal warning mode.
	for f in gnat_llvm.gpr tools.gpr; do
	    [ -f "$$f.orig" ] || cp "$$f" "$$f.orig"
	    cp "$$f.orig" "$$f"
	done
	sed -i 's/("-g", "-gnatg", "-gnatep=prep.control",/("-g", "-gnatg", "-gnatwn", "-gnatep=prep.control",/' gnat_llvm.gpr
	sed -i 's/^   Common_Switches := ("-g", "-gnatg");/   Common_Switches := ("-g", "-gnatg", "-gnatwn");/' tools.gpr
	grep -q -- -gnatwn gnat_llvm.gpr
	grep -q -- -gnatwn tools.gpr
	# (b) The runtime rule runs `sed -f $$(GNAT_SRC)/xsintnam.sed a-intnam.ads`,
	#     but xsintnam.sed is not part of FSF GCC at all. It is just the
	#     Ada.Interrupts.Names -> System.Interrupt_Names rename.
	printf 's/Ada\\.Interrupts\\.Names/System.Interrupt_Names/g\n' > gnat_src/xsintnam.sed
	touch $@

# ---------------------------------------------------------------------------
# 4. The compiler
# ---------------------------------------------------------------------------
compiler: $(STAMPS)/compiler
$(STAMPS)/compiler: $(STAMPS)/patch
	@printf '$(CYAN)==> building the compiler (this takes a while; %s cores)$(OFF)\n' "$$(nproc)"
	cd $(SRC)
	$(MAKE) clean >/dev/null 2>&1 || true
	$(MAKE) build LLVM_CONFIG=$(LLVM_CONFIG) 2>&1 \
	    | tee $(PREFIX)/build-compiler.log \
	    | grep -E --line-buffered 'error|Error|\*\*\*' || true
	if [ ! -x "$(BIN)/llvm-gcc" ]; then
	    printf '$(RED)error:$(OFF) compiler build failed — see $(PREFIX)/build-compiler.log\n' >&2
	    exit 1
	fi
	touch $@

# ---------------------------------------------------------------------------
# 5. Make the fresh compiler discoverable by gprbuild
#
# The runtime is built by gprbuild, which finds a compiler via gprconfig. Three
# things must line up, or gprbuild silently falls back to the *bootstrap* GNAT
# and the runtime build dies with "file s-finmas.ads not found" — GNAT 14 wants
# the old finalization scheme that GCC 16 replaced with Finalization_Primitives.
# ---------------------------------------------------------------------------
wire: $(STAMPS)/wire
$(STAMPS)/wire: $(STAMPS)/compiler
	@cd $(SRC)/llvm-interface
	# Debian/Ubuntu's GCC reports x86_64-linux-gnu; LLVM reports
	# x86_64-pc-linux-gnu. gnat-llvm's Makefile derives --target from
	# `gcc -dumpmachine`, so on Ubuntu it asks for a triple llvm-gcc does not
	# claim and gprconfig rejects it. (On Arch the two agree, which is why this
	# only bites on Debian derivatives.)
	llvm_triple=$$($(BIN)/llvm-gcc -dumpmachine)
	gcc_triple=$$(gcc -dumpmachine)
	printf '$(CYAN)==> wiring gprbuild discovery (llvm triple: %s)$(OFF)\n' "$$llvm_triple"
	# (a) gprconfig's GNAT_LLVM rule builds the driver name as llvm-gcc-<version>.
	#     A symlink is not enough: llvm-gcc dispatches on argv[0] and rejects any
	#     name it does not recognise ("unexpected program name ..., exiting"), so
	#     use a shim that execs back through the real name.
	major=$$($(BIN)/llvm-gcc -v 2>&1 \
	         | grep -oE '^[-a-z]*gcc [^ ]+ ([^ ]+)' | awk '{print $$3}' | head -1 || true)
	major=$${major:-16}
	rm -f "$(BIN)/llvm-gcc-$$major"
	printf '#!/bin/sh\nexec "$$(dirname "$$0")/llvm-gcc" "$$@"\n' > "$(BIN)/llvm-gcc-$$major"
	chmod +x "$(BIN)/llvm-gcc-$$major"
	# (b) Plain and target-prefixed aliases, so gprbuild resolves the C compiler
	#     and the Ada tools to this toolchain instead of /usr/bin.
	for t in gcc gnat gnat1 gnatbind gnatchop gnatclean gnatkr gnatlink gnatls \
	         gnatmake gnatname gnatprep; do
	    [ -e "$(BIN)/llvm-$$t" ] || continue
	    ln -sf "llvm-$$t" "$(BIN)/$$t"
	    ln -sf "llvm-$$t" "$(BIN)/$$llvm_triple-$$t"
	    ln -sf "llvm-$$t" "$(BIN)/$$gcc_triple-$$t"
	done
	# (c) gprconfig looks for the runtime at <bin>/../lib/rts-native/adalib/, but
	#     the Makefile builds it under lib/gnat-llvm/<triple>/rts-native/. Without
	#     a runtime it will not offer the compiler at all.
	mkdir -p "lib/gnat-llvm/$$llvm_triple/rts-native"
	ln -sfn "gnat-llvm/$$llvm_triple/rts-native" lib/rts-native
	touch $@

# ---------------------------------------------------------------------------
# 6. The Ada runtime
# ---------------------------------------------------------------------------
runtime: $(STAMPS)/runtime
$(STAMPS)/runtime: $(STAMPS)/wire
	@printf '$(CYAN)==> building the Ada runtime (libgnat / libgnarl)$(OFF)\n'
	llvm_triple=$$($(BIN)/llvm-gcc -dumpmachine)
	cd $(SRC)
	$(MAKE) gnatlib target="$$llvm_triple" LLVM_CONFIG=$(LLVM_CONFIG) 2>&1 \
	    | tee $(PREFIX)/build-runtime.log \
	    | grep -E --line-buffered 'error|Error|unexpected program|\*\*\*' || true
	for lib in libgnat.a libgnarl.a; do
	    if [ ! -f "$(SRC)/llvm-interface/lib/rts-native/adalib/$$lib" ]; then
	        printf '$(RED)error:$(OFF) runtime build failed: %s missing — see $(PREFIX)/build-runtime.log\n' "$$lib" >&2
	        exit 1
	    fi
	done
	echo "    adalib: $$(ls $(SRC)/llvm-interface/lib/rts-native/adalib | wc -l) files"
	touch $@

# ---------------------------------------------------------------------------
# 7. PATH
#
# ~/.bashrc covers interactive shells, ~/.profile covers login shells: Ubuntu's
# stock ~/.bashrc returns early when non-interactive, so ~/.bashrc on its own
# leaves `bash -lc ...` without the toolchain on PATH.
# ---------------------------------------------------------------------------
path: $(STAMPS)/runtime
	@for rc in $(HOME)/.bashrc $(HOME)/.profile; do
	    [ -e "$$rc" ] || continue
	    if ! grep -q 'GNAT-LLVM toolchain' "$$rc" 2>/dev/null; then
	        printf '$(CYAN)==> adding GNAT-LLVM to PATH in %s$(OFF)\n' "$$rc"
	        printf '\n# GNAT-LLVM toolchain\nexport PATH="%s:%s/bin:$$PATH"\n' \
	            "$(BIN)" "$(LLVM_DIR)" >> "$$rc"
	    fi
	done

# ---------------------------------------------------------------------------
# 8. Smoke test — Ada -> .ll, verify the IR, then build and run a real binary
# ---------------------------------------------------------------------------
verify: path
	@if [ ! -x "$(BIN)/llvm-gcc" ]; then
	    printf '$(RED)error:$(OFF) $(BIN)/llvm-gcc not found — run `make gnat-llvm`\n' >&2; exit 1
	fi
	export PATH="$(BIN):$(LLVM_DIR)/bin:$$PATH"
	t=$$(mktemp -d); trap 'rm -rf "$$t"' EXIT
	cat > "$$t/hello.adb" <<-'ADA'
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
	cd "$$t"
	printf '$(CYAN)==> .adb -> .ll$(OFF)\n'
	llvm-gcc -c -S -emit-llvm hello.adb
	grep -q '^target triple' hello.ll
	echo "    hello.ll: $$(wc -l < hello.ll) lines"
	printf '$(CYAN)==> .adb -> .bc$(OFF)\n'
	llvm-gcc -c -emit-llvm hello.adb && test -s hello.bc
	printf '$(CYAN)==> IR verifies$(OFF)\n'
	opt -passes=verify hello.ll -o /dev/null
	printf '$(CYAN)==> native executable$(OFF)\n'
	rm -f hello.o hello.ali
	llvm-gnatmake -q hello.adb
	out=$$(./hello); echo "    ./hello -> $$out"
	[ "$$out" = "Sum of squares 1..10 = 385" ]
	printf '$(CYAN)==> ALL CHECKS PASSED$(OFF)\n\n'
	echo "GNAT-LLVM is ready. Open a new shell, or:"
	echo "    export PATH=\"$(BIN):$(LLVM_DIR)/bin:\$$PATH\""
	echo
	echo "    llvm-gcc -c -S -emit-llvm file.adb    # -> file.ll"
	echo "    llvm-gcc -c    -emit-llvm file.adb    # -> file.bc"
	echo "    llvm-gnatmake main.adb                # -> native executable"

# ---------------------------------------------------------------------------
# Cleanup
# ---------------------------------------------------------------------------
clean:
	@printf '$(CYAN)==> removing build products (sources kept)$(OFF)\n'
	if [ -d "$(SRC)" ]; then $(MAKE) -C $(SRC) clean >/dev/null 2>&1 || true; fi
	rm -rf $(SRC)/llvm-interface/lib $(BIN)
	rm -f $(STAMPS)/compiler $(STAMPS)/wire $(STAMPS)/runtime

distclean:
	@printf '$(CYAN)==> removing $(PREFIX)$(OFF)\n'
	rm -rf $(PREFIX)
