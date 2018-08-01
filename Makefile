git = git -c user.name="Auto" -c user.email="auto@auto.com" 

TILER=tiler
BUILDDIR = $(PWD)/build
SRCDIR = $(PWD)/src
LLVM_VERSION=6.0.0
# LLVM_VERSION=3.6.2
LD=ld.gold

all : release

.PHONY : release debug run clean patch test llvm-svn llvm-up deepclean

release : $(BUILDDIR)/buildr/Makefile
	+make -C $(BUILDDIR)/buildr
	cp -f $(BUILDDIR)/buildr/$(TILER) $(TILER)

debug :  $(BUILDDIR)/buildd/Makefile
	+make -C $(BUILDDIR)/buildd
	rm -rf $(TILER)
	ln -s $(BUILDDIR)/buildd/$(TILER) $(TILER)

llvm-svn: export LLVM_VERSION = svn
llvm-svn: $(BUILDDIR)/buildl/Makefile
	echo "$(LLVM_VERSION)"
	+make -C $(BUILDDIR)/buildl
	rm $(TILER)
	ln -s $(BUILDDIR)/buildl/$(TILER) $(TILER)

$(BUILDDIR)/buildr/Makefile: $(BUILDDIR)/z3/buildr/libz3.so
	mkdir -p $(BUILDDIR)/buildr
	cd $(BUILDDIR)/buildr; cmake -DCMAKE_BUILD_TYPE=Release -DTILER=$(TILER) $(SRCDIR)

$(BUILDDIR)/buildd/Makefile: $(BUILDDIR)/z3/buildd/libz3.so $(BUILDDIR)/llvm-$(LLVM_VERSION)/lib/libLLVMCore.a
	mkdir -p $(BUILDDIR)/buildd
	cd $(BUILDDIR)/buildd; cmake -DCMAKE_BUILD_TYPE=Debug -DLLVM_VERSION=$(LLVM_VERSION) -DTILER=$(TILER) $(SRCDIR)

$(BUILDDIR)/buildl/Makefile: $(BUILDDIR)/z3/buildd/libz3.so $(BUILDDIR)/llvm-$(LLVM_VERSION)/lib/libLLVMCore.a
	mkdir -p $(BUILDDIR)/buildl
	cd $(BUILDDIR)/buildl; cmake -DCMAKE_BUILD_TYPE=Debug -DLLVM_VERSION=$(LLVM_VERSION) -DTILER=$(TILER) $(SRCDIR)

clean :
	rm -rf $(BUILDDIR)/buildr
	rm -rf $(BUILDDIR)/buildd
	rm -rf $(BUILDDIR)/buildl
	rm -f tiler
	find -name "*~"| xargs rm -rf

# removes all the downloaded llvms and all the installs
deepclean: clean
	rm -rf $(BUILDDIR)/*

#-----------------------------------------------------------------------------
# Z3 fetch and patch generation

$(BUILDDIR)/z3/README.md :
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR);$(git) clone https://github.com/Z3Prover/z3.git

$(BUILDDIR)/z3/buildr/libz3.so : $(BUILDDIR)/z3/README.md
	rm -rf $(BUILDDIR)/z3/buildr
	mkdir -p $(BUILDDIR)/z3/buildr
	cd $(BUILDDIR)/z3/buildr; cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../
	+make -C $(BUILDDIR)/z3/buildr

$(BUILDDIR)/z3/buildr/libz3.a : $(BUILDDIR)/z3/buildr/libz3.so

$(BUILDDIR)/z3/buildd/libz3.so : $(BUILDDIR)/z3/README.md
	rm -rf $(BUILDDIR)/z3/buildd
	mkdir -p $(BUILDDIR)/z3/buildd
	cd $(BUILDDIR)/z3/buildd; cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ../
	+make -C $(BUILDDIR)/z3/buildd

#---------------------------------------------------------------------------
# fetch and install local llvm with debugging enabled

#$(BUILDDIR)/llvm-$(LLVM_VERSION).src/tools/clang/tools/extra/docs/clang-modernize.rst
$(BUILDDIR)/llvm-$(LLVM_VERSION).src/LLVMBuild.txt:
	cd $(BUILDDIR);wget http://releases.llvm.org/$(LLVM_VERSION)/llvm-$(LLVM_VERSION).src.tar.xz
	cd $(BUILDDIR);wget http://releases.llvm.org/$(LLVM_VERSION)/cfe-$(LLVM_VERSION).src.tar.xz
	cd $(BUILDDIR);wget http://releases.llvm.org/$(LLVM_VERSION)/clang-tools-extra-$(LLVM_VERSION).src.tar.xz
	cd $(BUILDDIR);tar -xvJf llvm-$(LLVM_VERSION).src.tar.xz
	cd $(BUILDDIR);tar -xvJf cfe-$(LLVM_VERSION).src.tar.xz -C llvm-$(LLVM_VERSION).src/tools/; mv llvm-$(LLVM_VERSION).src/tools/cfe-$(LLVM_VERSION).src llvm-$(LLVM_VERSION).src/tools/clang
	cd $(BUILDDIR);tar -xvJf clang-tools-extra-$(LLVM_VERSION).src.tar.xz -C llvm-$(LLVM_VERSION).src/tools/clang/tools; mv llvm-$(LLVM_VERSION).src/tools/clang/tools/clang-tools-extra-$(LLVM_VERSION).src llvm-$(LLVM_VERSION).src/tools/clang/tools/extra

$(BUILDDIR)/llvm-svn.src/LLVMBuild.txt:
	cd $(BUILDDIR);svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm-svn.src
	cd $(BUILDDIR)/llvm-svn.src/tools; svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
	cd $(BUILDDIR)/llvm-svn.src/tools/clang/tools; svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
	cd $(BUILDDIR)/llvm-svn.src/projects; svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
	# cd $(BUILDDIR)/llvm-svn.src/projects; svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx


LLVM_CMAKE_OPTIONS= -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=DEBUG -DLLVM_ENABLE_RTTI:BOOL=TRUE -DLLVM_ENABLE_DUMP=TRUE -DCMAKE_INSTALL_PREFIX=../../llvm-$(LLVM_VERSION) ../

$(BUILDDIR)/llvm-$(LLVM_VERSION)/lib/libLLVMCore.a : $(BUILDDIR)/llvm-$(LLVM_VERSION).src/LLVMBuild.txt
	cd $(BUILDDIR); mkdir -p llvm-$(LLVM_VERSION).src/build; mkdir -p llvm-$(LLVM_VERSION)
	cd $(BUILDDIR)/llvm-$(LLVM_VERSION).src/build;cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=DEBUG -DLLVM_ENABLE_RTTI:BOOL=TRUE -DLLVM_ENABLE_DUMP=TRUE -DCMAKE_INSTALL_PREFIX=../../llvm-$(LLVM_VERSION) ../
	+make -C $(BUILDDIR)/llvm-$(LLVM_VERSION).src/build
	+make -C $(BUILDDIR)/llvm-$(LLVM_VERSION).src/build install

llvm-up: export LLVM_VERSION = svn
llvm-up:
	cd $(BUILDDIR)/llvm-svn.src; svn up
	cd $(BUILDDIR)/llvm-svn.src/tools/clang; svn up
	cd $(BUILDDIR)/llvm-svn.src/tools/clang/tools/extra; svn up
	cd $(BUILDDIR)/llvm-svn.src/projects/compiler-rt; svn up
	cd $(BUILDDIR)/llvm-svn.src/build;cmake $(LLVM_CMAKE_OPTIONS)
	+make -C $(BUILDDIR)/llvm-svn.src/build
	+make -C $(BUILDDIR)/llvm-svn.src/build install

#---------------------------------------------------------------------------

aggregation:
	./tiler -a -f cube -o /tmp ../array-bench/test-suite/algebraic/array-cube.c

cm:
	./tiler -a -f cubemulti -o /tmp ../array-bench/test-suite/algebraic/array-cube-m.c

eqn:
	./tiler -a -f eqnmulti -o /tmp ../array-bench/test-suite/algebraic/array-eqn-m.c

bubble:
	./tiler -a -d -f bubblesort -o /tmp ../array-bench/test-suite/sorting/bubblesort.c

bubble2:
	./tiler -a -d -f bubblesort -o /tmp ../array-bench/test-suite/sorting/bubblesort2.c

runtest:
	./tiler -f main -o /tmp -m 3 -l 0 -t 1 /tmp/test.c

runperiodic:
	./tiler -f periodic -o /tmp -m 3 -l 0 -t 1 ../array-bench/test-suite/periodic/periodic-range2.c

dumpcfg:
	./tiler -a -m 2 -f bubblesort -o /tmp ../array-bench/test-suite/sorting/bubblesort.c
#	./tiler -a -m 2 -f cubemulti -o /tmp ../array-bench/test-suite/algebraic/array-cube-m.c

test: release runtest
