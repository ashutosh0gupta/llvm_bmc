# import os
# import subprocess
# import glob
# import sys


# SOURCE_DIR = "../examples_1"
# OUTPUT_DIR = "../conversions"
# # gnat-llvm binaries are in scripts/gnat-llvm/
# LLVM_INTERFACE_BIN = os.path.abspath(os.path.join(os.path.dirname(__file__), "gnat-llvm/llvm-interface/bin"))
# LLVM_BIN = "/usr/lib/llvm-19/bin"

# def main():

#     base_dir = os.path.dirname(os.path.abspath(__file__))
#     os.chdir(base_dir)


#     env = os.environ.copy()
#     env["PATH"] = f"{LLVM_INTERFACE_BIN}:{LLVM_BIN}:{env.get('PATH', '')}"


#     if not os.path.exists(OUTPUT_DIR):
#         os.makedirs(OUTPUT_DIR)
#         print(f"Created directory: {OUTPUT_DIR}")


#     files = glob.glob(os.path.join(SOURCE_DIR, "*.adb")) + \
#             glob.glob(os.path.join(SOURCE_DIR, "*.ads"))
    
#     if not files:
#         print(f"No .adb or .ads files found in {SOURCE_DIR}")
#         return

#     print(f"Found {len(files)} files to process.")

#     for file_path in files:
#         filename = os.path.basename(file_path)
#         stem = os.path.splitext(filename)[0]
        
#         ll_output = os.path.join(OUTPUT_DIR, f"{stem}.ll")
#         bc_output = os.path.join(OUTPUT_DIR, f"{stem}.bc")
#         s_output = os.path.join(OUTPUT_DIR, f"{stem}.s")
        
#         print(f"Processing {filename}...")


#         inc_zfp = os.path.abspath("../gnat-llvm/llvm-interface/zfp")
#         inc_gcc = os.path.abspath("../gnat-llvm/llvm-interface/gcc/gcc/ada/gcc-interface")
        
#         cmd_compile = [
#             "llvm-gcc", 
#             f"-I{inc_zfp}", 
#             f"-I{inc_gcc}", 
#             "-S", 
#             "-emit-llvm", 
#             file_path, 
#             "-o", 
#             ll_output
#         ]
        
#         try:
#             subprocess.run(cmd_compile, check=True, env=env, capture_output=True, text=True)
#             print(f"  [OK] Generated {ll_output}")
#         except subprocess.CalledProcessError as e:
#             print(f"  [ERROR] Compilation failed for {filename}")
#             print(f"  STDERR: {e.stderr}")
#             continue


#         cmd_assemble = ["llvm-as", ll_output, "-o", bc_output]
        
#         try:
#             subprocess.run(cmd_assemble, check=True, env=env, capture_output=True, text=True)
#             print(f"  [OK] Generated {bc_output}")
#         except subprocess.CalledProcessError as e:
#             print(f"  [ERROR] Assembly failed for {ll_output}")
#             print(f"  STDERR: {e.stderr}")
#             continue


#         cmd_llc = ["llc", ll_output, "-o", s_output]
        
#         try:
#             subprocess.run(cmd_llc, check=True, env=env, capture_output=True, text=True)
#             print(f"  [OK] Generated {s_output}")
#         except subprocess.CalledProcessError as e:
#             print(f"  [ERROR] Assembly generation failed for {ll_output}")
#             print(f"  STDERR: {e.stderr}")
#             continue

#     print("Done.")

# if __name__ == "__main__":
#     main()


import os
import subprocess
import glob
import sys
import argparse
import shutil


DEFAULT_SOURCE_DIR = "../examples_1"
OUTPUT_DIR = "../conversions"

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

LLVM_INTERFACE_BIN = os.path.abspath(
    os.path.join(BASE_DIR, "gnat-llvm/llvm-interface/bin")
)


def find_llvm_bin():
    """
    Automatically locate LLVM binaries (llvm-as, llc, etc.)
    """

    # 1️⃣ Check if llvm-as is already in PATH
    path = shutil.which("llvm-as")
    if path:
        return os.path.dirname(path)

    # 2️⃣ Search common LLVM install locations
    possible_paths = [
        "/usr/lib/llvm-21/bin",
        "/usr/lib/llvm-20/bin",
        "/usr/lib/llvm-19/bin",
        "/usr/lib/llvm-18/bin",
        "/usr/lib/llvm-17/bin",
        "/usr/local/llvm/bin",
        "/usr/local/bin",
        
    ]

    for p in possible_paths:
        if os.path.exists(os.path.join(p, "llvm-as")):
            return p

    print("Error: LLVM binaries not found.")
    print("Install LLVM or add llvm-as to PATH.")
    sys.exit(1)


def main():

    parser = argparse.ArgumentParser(
        description="Compile Ada files using GNAT-LLVM and generate LLVM IR, BC and Assembly."
    )

    parser.add_argument(
        "-d", "--dir",
        help="Source directory containing Ada files (.adb/.ads)",
        default=DEFAULT_SOURCE_DIR
    )

    parser.add_argument(
        "-f", "--file",
        help="Single Ada file to compile"
    )

    args = parser.parse_args()

    source_dir = args.dir
    source_file = args.file

    llvm_bin = find_llvm_bin()

    print(f"Using LLVM binaries from: {llvm_bin}")

    os.chdir(BASE_DIR)

    env = os.environ.copy()
    env["PATH"] = f"{LLVM_INTERFACE_BIN}:{llvm_bin}:{env.get('PATH', '')}"

    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
        print(f"Created directory: {OUTPUT_DIR}")

    files = []

    if source_file:
        if not os.path.exists(source_file):
            print(f"File not found: {source_file}")
            sys.exit(1)
        files.append(source_file)
    else:
        files = glob.glob(os.path.join(source_dir, "*.adb")) + \
                glob.glob(os.path.join(source_dir, "*.ads"))

    if not files:
        print("No Ada files found.")
        return

    print(f"Found {len(files)} file(s) to process.")

    inc_zfp = os.path.abspath("../gnat-llvm/llvm-interface/zfp")
    inc_gcc = os.path.abspath("../gnat-llvm/llvm-interface/gcc/gcc/ada/gcc-interface")

    for file_path in files:

        filename = os.path.basename(file_path)
        stem = os.path.splitext(filename)[0]

        ll_output = os.path.join(OUTPUT_DIR, f"{stem}.ll")
        bc_output = os.path.join(OUTPUT_DIR, f"{stem}.bc")
        s_output = os.path.join(OUTPUT_DIR, f"{stem}.s")

        print(f"\nProcessing {filename}...")

        cmd_compile = [
            "llvm-gcc",
            f"-I{inc_zfp}",
            f"-I{inc_gcc}",
            "-S",
            "-emit-llvm",
            file_path,
            "-o",
            ll_output
        ]

        try:
            subprocess.run(cmd_compile, check=True, env=env, capture_output=True, text=True)
            print(f"[OK] Generated {ll_output}")
        except subprocess.CalledProcessError as e:
            print(f"[ERROR] Compilation failed for {filename}")
            print(e.stderr)
            continue

        cmd_assemble = [
            "llvm-as",
            ll_output,
            "-o",
            bc_output
        ]

        try:
            subprocess.run(cmd_assemble, check=True, env=env, capture_output=True, text=True)
            print(f"[OK] Generated {bc_output}")
        except subprocess.CalledProcessError as e:
            print(f"[ERROR] llvm-as failed for {ll_output}")
            print(e.stderr)
            continue

        cmd_llc = [
            "llc",
            ll_output,
            "-o",
            s_output
        ]

        try:
            subprocess.run(cmd_llc, check=True, env=env, capture_output=True, text=True)
            print(f"[OK] Generated {s_output}")
        except subprocess.CalledProcessError as e:
            print(f"[ERROR] llc failed for {ll_output}")
            print(e.stderr)
            continue

    print("\nDone.")


if __name__ == "__main__":
    main()