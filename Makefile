git = git -c user.name="Auto" -c user.email="auto@auto.com" 

LLVMBMC=llvmbmc
HOME_INSTALLED=~/installed
BUILDDIR = $(PWD)/build
SRCDIR = $(PWD)/src
LLVM_VERSION=6.0.0
# LLVM_VERSION=3.6.2
LD=ld.gold

all : release

.PHONY : release debug run clean patch test llvm-svn llvm-up deepclean

release : $(BUILDDIR)/buildr/Makefile
	+make -C $(BUILDDIR)/buildr
	cp -f $(BUILDDIR)/buildr/$(LLVMBMC) $(LLVMBMC)

debug :  $(BUILDDIR)/buildd/Makefile
	+make -C $(BUILDDIR)/buildd
	rm -rf $(LLVMBMC)
	ln -s $(BUILDDIR)/buildd/$(LLVMBMC) $(LLVMBMC)

llvm-svn: export LLVM_VERSION = svn
llvm-svn: $(BUILDDIR)/buildl/Makefile
	echo "$(LLVM_VERSION)"
	+make -C $(BUILDDIR)/buildl
	rm $(LLVMBMC)
	ln -s $(BUILDDIR)/buildl/$(LLVMBMC) $(LLVMBMC)

$(BUILDDIR)/buildr/Makefile: $(BUILDDIR)/z3/buildr/libz3.so
	mkdir -p $(BUILDDIR)/buildr
	cd $(BUILDDIR)/buildr; cmake -DCMAKE_BUILD_TYPE=Release -DLLVMBMC=$(LLVMBMC) $(SRCDIR)

$(BUILDDIR)/buildd/Makefile: $(BUILDDIR)/z3/buildd/libz3.so $(HOME_INSTALLED)/llvm-$(LLVM_VERSION)/lib/libLLVMCore.a
	mkdir -p $(BUILDDIR)/buildd
	cd $(BUILDDIR)/buildd; cmake -DCMAKE_BUILD_TYPE=Debug -DINSTALLED=$(HOME_INSTALLED) -DLLVM_VERSION=$(LLVM_VERSION) -DLLVMBMC=$(LLVMBMC) $(SRCDIR)

$(BUILDDIR)/buildl/Makefile: $(BUILDDIR)/z3/buildd/libz3.so $(HOME_INSTALLED)/llvm-$(LLVM_VERSION)/lib/libLLVMCore.a
	mkdir -p $(BUILDDIR)/buildl
	cd $(BUILDDIR)/buildl; cmake -DCMAKE_BUILD_TYPE=Debug -DINSTALLED=$(HOME_INSTALLED) -DLLVM_VERSION=$(LLVM_VERSION) -DLLVMBMC=$(LLVMBMC) $(SRCDIR)

clean :
	rm -rf $(BUILDDIR)/buildr
	rm -rf $(BUILDDIR)/buildd
	rm -rf $(BUILDDIR)/buildl
	rm -f llvmbmc
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

#$(HOME_INSTALLED)/llvm-$(LLVM_VERSION).src/tools/clang/tools/extra/docs/clang-modernize.rst
$(HOME_INSTALLED)/llvm-$(LLVM_VERSION).src/LLVMBuild.txt:
	cd $(HOME_INSTALLED);wget http://releases.llvm.org/$(LLVM_VERSION)/llvm-$(LLVM_VERSION).src.tar.xz
	cd $(HOME_INSTALLED);wget http://releases.llvm.org/$(LLVM_VERSION)/cfe-$(LLVM_VERSION).src.tar.xz
	cd $(HOME_INSTALLED);wget http://releases.llvm.org/$(LLVM_VERSION)/clang-tools-extra-$(LLVM_VERSION).src.tar.xz
	cd $(HOME_INSTALLED);tar -xvJf llvm-$(LLVM_VERSION).src.tar.xz
	cd $(HOME_INSTALLED);tar -xvJf cfe-$(LLVM_VERSION).src.tar.xz -C llvm-$(LLVM_VERSION).src/tools/; mv llvm-$(LLVM_VERSION).src/tools/cfe-$(LLVM_VERSION).src llvm-$(LLVM_VERSION).src/tools/clang
	cd $(HOME_INSTALLED);tar -xvJf clang-tools-extra-$(LLVM_VERSION).src.tar.xz -C llvm-$(LLVM_VERSION).src/tools/clang/tools; mv llvm-$(LLVM_VERSION).src/tools/clang/tools/clang-tools-extra-$(LLVM_VERSION).src llvm-$(LLVM_VERSION).src/tools/clang/tools/extra

$(HOME_INSTALLED)/llvm-svn.src/LLVMBuild.txt:
	cd $(HOME_INSTALLED);svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm-svn.src
	cd $(HOME_INSTALLED)/llvm-svn.src/tools; svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
	cd $(HOME_INSTALLED)/llvm-svn.src/tools/clang/tools; svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
	cd $(HOME_INSTALLED)/llvm-svn.src/projects; svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
	# cd $(HOME_INSTALLED)/llvm-svn.src/projects; svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx


LLVM_CMAKE_OPTIONS= -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=DEBUG -DLLVM_ENABLE_RTTI:BOOL=TRUE -DLLVM_ENABLE_DUMP=TRUE -DCMAKE_INSTALL_PREFIX=../../llvm-$(LLVM_VERSION) ../

$(HOME_INSTALLED)/llvm-$(LLVM_VERSION)/lib/libLLVMCore.a : $(HOME_INSTALLED)/llvm-$(LLVM_VERSION).src/LLVMBuild.txt
	cd $(HOME_INSTALLED); mkdir -p llvm-$(LLVM_VERSION).src/build; mkdir -p llvm-$(LLVM_VERSION)
	cd $(HOME_INSTALLED)/llvm-$(LLVM_VERSION).src/build;cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=DEBUG -DLLVM_ENABLE_RTTI:BOOL=TRUE -DLLVM_ENABLE_DUMP=TRUE -DCMAKE_INSTALL_PREFIX=../../llvm-$(LLVM_VERSION) ../
	+make -C $(HOME_INSTALLED)/llvm-$(LLVM_VERSION).src/build
	+make -C $(HOME_INSTALLED)/llvm-$(LLVM_VERSION).src/build install

llvm-up: export LLVM_VERSION = svn
llvm-up:
	cd $(HOME_INSTALLED)/llvm-svn.src; svn up
	cd $(HOME_INSTALLED)/llvm-svn.src/tools/clang; svn up
	cd $(HOME_INSTALLED)/llvm-svn.src/tools/clang/tools/extra; svn up
	cd $(HOME_INSTALLED)/llvm-svn.src/projects/compiler-rt; svn up
	cd $(HOME_INSTALLED)/llvm-svn.src/build;cmake $(LLVM_CMAKE_OPTIONS)
	+make -C $(HOME_INSTALLED)/llvm-svn.src/build
	+make -C $(HOME_INSTALLED)/llvm-svn.src/build install

#---------------------------------------------------------------------------


test: release runtest
