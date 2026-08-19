#!/usr/bin/bash

# sudo apt install gnat gprbuild llvm-21 clang-21 libclang-21-dev


# Cloning Gnat
# git clone https://github.com/AdaCore/gnat-llvm.git
# git checkout 6153a1d0c817411fc98883a62e822f048d8604a1

cd gnat-llvm

# Cloning gcc
git clone git://gcc.gnu.org/git/gcc.git llvm-interface/gcc
cd llvm-interface
git checkout 747ed054dde27829eede8374e417eecd58769c0e
cd ..
ln -s gcc/gcc/ada llvm-interface/gnat_src

# Cloning ada bindings for llvm
git clone https://github.com/AdaCore/llvm-bindings.git
cd llvm-bindings
git checkout 06933d37bf2eb1b363dfe3cff9a48fe0cc3e4e20
cd ..

export LLVM_CONFIG=/usr/lib/llvm-21/bin/llvm-config
export PATH=/usr/lib/llvm-21/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/llvm-21/lib:$LD_LIBRARY_PATH

export LLVM_LIBDIR=$($LLVM_CONFIG --libdir)

# INsert this instead of the current one to make sure the it doesn t break when ubuntu arch etc 
# for Switches ("Ada") use ("-static-libstdc++", "-L" & External ("LLVM_LIBDIR"), "-lclang-cpp");

cat > llvm-interface/gcc/gcc/ada/xsintnam.sed <<'EOF'
s/Ada\.Interrupts\.Names/System.Interrupt_Names/g
EOF

file1="llvm-interface/gnat_llvm.gpr"
file2="llvm-interface/tools.gpr"

grep -q 'Common_Switches := ("-g", "-gnatg", "-gnatwU", "-gnatws",' "$file1" || \
    sed -i 's/Common_Switches := ("-g", "-gnatg",/Common_Switches := ("-g", "-gnatg", "-gnatwU", "-gnatws",/' "$file1"

grep -q 'Common_Switches := ("-g", "-gnatg", "-gnatwU", "-gnatws",' "$file2" || \
    sed -i 's/Common_Switches := ("-g", "-gnatg",/Common_Switches := ("-g", "-gnatg", "-gnatwU", "-gnatws",/' "$file2"

# use this if u facing issues with the libraries
# grep -q 'for Switches ("Ada") use ("-static-libstdc++", "-lclang-cpp");' "$file1" || \
#     sed -i 's/for Switches ("Ada") use ("-static-libstdc++", "-lclangBasic");/for Switches ("Ada") use ("-static-libstdc++", "-lclang-cpp");/' "$file1"

make
