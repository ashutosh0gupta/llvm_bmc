#!/usr/bin/env python3
import subprocess
import os
from pathlib import Path

def run(cmd, cwd=None):
    print(">>>", " ".join(cmd))
    subprocess.run(cmd, cwd=cwd, check=True)

def clone_repos(build_dir):
    gnat = build_dir / "gnat-llvm"

    if not gnat.exists():
        run(["git","clone","https://github.com/AdaCore/gnat-llvm.git",str(gnat)])

    run(["git","checkout","61e66275"], cwd=gnat)

    gcc = gnat / "llvm-interface" / "gcc"
    if not gcc.exists():
        run(["git","clone","git://gcc.gnu.org/git/gcc.git",str(gcc)])

    bindings = gnat / "llvm-bindings"
    if not bindings.exists():
        run(["git","clone","https://github.com/AdaCore/llvm-bindings.git",str(bindings)])
        run(["git","checkout","llvm-19"], cwd=bindings)

def setup_sources(build_dir):
    link = build_dir/"gnat-llvm/llvm-interface/gnat_src"
    if not link.exists():
        os.symlink("gcc/gcc/ada", link)

def build_llvm(build_dir):
    gnat_dir = build_dir/"gnat-llvm"
    cores = max(1, os.cpu_count()-1)

    run(["make",f"-j{cores}","llvm"], cwd=gnat_dir)

def build_gnat(build_dir):
    llvm_dir = build_dir/"gnat-llvm/llvm-interface"
    cores = max(1, os.cpu_count()-1)

    run(cmd = [
    "make",
    f"-j{cores}",
    'GNATFLAGS=-gnatwU -gnatws',
    "CXXFLAGS=-Wno-error",
    "CFLAGS=-Wno-error",
    "setup",
    "build"
], cwd=llvm_dir)

def main():
    script_dir = Path(__file__).resolve().parent
    root_dir = script_dir.parent

    builds_dir = root_dir/"build"
    builds_dir.mkdir(exist_ok=True)

    print("Build directory:",builds_dir)

    clone_repos(builds_dir)
    setup_sources(builds_dir)

    print("\n=== Building LLVM ===")
    build_llvm(builds_dir)

    print("\n=== Building GNAT LLVM ===")
    build_gnat(builds_dir)

    print("\nBuild complete")
    print(f"export PATH={builds_dir}/gnat-llvm/llvm-interface/bin:$PATH")

if __name__ == "__main__":
    main()