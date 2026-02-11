import os
import subprocess
import glob
import sys


SOURCE_DIR = "../gnat-llvm/examples"
OUTPUT_DIR = "../conversions"
LLVM_INTERFACE_BIN = os.path.abspath("../gnat-llvm/llvm-interface/bin")
LLVM_BIN = "/usr/lib/llvm-19/bin"

def main():

    base_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(base_dir)


    env = os.environ.copy()
    env["PATH"] = f"{LLVM_INTERFACE_BIN}:{LLVM_BIN}:{env.get('PATH', '')}"


    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
        print(f"Created directory: {OUTPUT_DIR}")


    files = glob.glob(os.path.join(SOURCE_DIR, "*.adb")) + \
            glob.glob(os.path.join(SOURCE_DIR, "*.ads"))
    
    if not files:
        print(f"No .adb or .ads files found in {SOURCE_DIR}")
        return

    print(f"Found {len(files)} files to process.")

    for file_path in files:
        filename = os.path.basename(file_path)
        stem = os.path.splitext(filename)[0]
        
        ll_output = os.path.join(OUTPUT_DIR, f"{stem}.ll")
        bc_output = os.path.join(OUTPUT_DIR, f"{stem}.bc")
        s_output = os.path.join(OUTPUT_DIR, f"{stem}.s")
        
        print(f"Processing {filename}...")


        cmd_compile = ["llvm-gcc", "-S", "-emit-llvm", file_path, "-o", ll_output]
        
        try:
            subprocess.run(cmd_compile, check=True, env=env, capture_output=True, text=True)
        except subprocess.CalledProcessError as e:
            print(f"  [ERROR] Compilation failed for {filename}")
            print(f"  STDERR: {e.stderr}")
            continue


        cmd_assemble = ["llvm-as", ll_output, "-o", bc_output]
        
        try:
            subprocess.run(cmd_assemble, check=True, env=env, capture_output=True, text=True)
            print(f"  [OK] Generated {bc_output}")
        except subprocess.CalledProcessError as e:
            print(f"  [ERROR] Assembly failed for {ll_output}")
            print(f"  STDERR: {e.stderr}")
            continue


        cmd_llc = ["llc", ll_output, "-o", s_output]
        
        try:
            subprocess.run(cmd_llc, check=True, env=env, capture_output=True, text=True)
            print(f"  [OK] Generated {s_output}")
        except subprocess.CalledProcessError as e:
            print(f"  [ERROR] Assembly generation failed for {ll_output}")
            print(f"  STDERR: {e.stderr}")
            continue

    print("Done.")

if __name__ == "__main__":
    main()
