Because we will need to install several tools, I recommend to use the following orders when installing them:
1. Install smack. There is a script /bin/build.sh that should be used to install many dependencies.
2. Install Dat3M.
	First install Maven and Java
	Then install LLVM and Clang 
	Then install Dat3M/llvm-passes/atomic-replace
	Then install Dat3M
3. Install GenMC. Follow its instructions but note that I got error with clang-10 and llvm-10. Version 15 works OK. Using ./configure --with-llvm=/usr/lib/llvm-15 can be helpful.
   To install specific LLVM versions, follow instructions in https://apt.llvm.org/
4. Install CBMC.
5. Install HERD7.
	First install opam
	Then follow the tool's instructions
6. Install ARMCBMC. We will need llvm-14-dev package.
7. Install RMEM 


