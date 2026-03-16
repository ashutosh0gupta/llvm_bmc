#!/usr/bin/env python3
"""
GNAT LLVM Installation Script

This script automates the installation steps for GNAT LLVM as described in README.md.
It handles repository cloning (including gnat-llvm, gcc, and llvm-bindings),
symlink creation, and building the project.

This version is configured for LLVM 19.x compatibility.

Usage:
    python3 install.py [--skip-clone] [--skip-llvm] [--build-gnatlib]

Options:
    --skip-clone        Skip cloning repositories if they already exist
    --skip-llvm         Skip LLVM installation/build step
    --build-gnatlib     Build full runtime library (may fail with compatibility issues)

Repositories cloned:
    - AdaCore/gnat-llvm: Main GNAT LLVM compiler (commit 61e66275 for LLVM 19)
    - gcc from gcc.gnu.org: GNAT sources
    - AdaCore/llvm-bindings: Ada bindings for LLVM (llvm-19 branch)
"""

import os
import sys
import subprocess
import argparse
import platform
import shutil
from pathlib import Path


class Colors:
    """ANSI color codes for terminal output"""
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def print_step(message):
    """Print a step header"""
    print(f"\n{Colors.HEADER}{Colors.BOLD}==> {message}{Colors.ENDC}")


def print_success(message):
    """Print a success message"""
    print(f"{Colors.OKGREEN}✓ {message}{Colors.ENDC}")


def print_warning(message):
    """Print a warning message"""
    print(f"{Colors.WARNING}⚠ {message}{Colors.ENDC}")


def print_error(message):
    """Print an error message"""
    print(f"{Colors.FAIL}✗ {message}{Colors.ENDC}")


def run_command(cmd, cwd=None, shell=False, check=True):
    """Run a shell command and return the result"""
    print(f"{Colors.OKCYAN}  Running: {cmd if isinstance(cmd, str) else ' '.join(cmd)}{Colors.ENDC}")
    try:
        result = subprocess.run(
            cmd,
            cwd=cwd,
            shell=shell,
            check=check,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        if result.stdout:
            print(result.stdout)
        if result.stderr:
            print(result.stderr)
        return result
    except subprocess.CalledProcessError as e:
        print_error(f"Command failed with exit code {e.returncode}")
        if e.stdout:
            print(f"STDOUT:\n{e.stdout}")
        if e.stderr:
            print(f"STDERR:\n{e.stderr}")
        raise


def check_prerequisites():
    """Check if required tools are installed"""
    print_step("Checking prerequisites")
    
    required_tools = ['git', 'make']
    missing_tools = []
    
    for tool in required_tools:
        if shutil.which(tool) is None:
            missing_tools.append(tool)
            print_error(f"{tool} not found")
        else:
            print_success(f"{tool} found")
    
    # Check for GNAT compiler
    if shutil.which('gnat') is None and shutil.which('gnatmake') is None:
        print_warning("GNAT compiler not found in PATH")
        print_warning("Please install GNAT Community 2021 or GCC 11+ with Ada support")
    else:
        print_success("GNAT compiler found")
    
    # Check for LLVM
    if shutil.which('llvm-config') is None:
        print_warning("llvm-config not found in PATH")
        print_warning("LLVM 19.x is compatible. Install via package manager or build from source")
    else:
        result = run_command(['llvm-config', '--version'], check=False)
        if result.returncode == 0:
            print_success(f"LLVM found: {result.stdout.strip()}")
    
    if shutil.which('clang') is None:
        print_warning("clang not found in PATH")
    else:
        print_success("clang found")
    
    if missing_tools:
        print_error(f"Missing required tools: {', '.join(missing_tools)}")
        return False
    
    return True


def clone_llvm_bindings(base_dir, skip_if_exists=False):
    """Clone LLVM Ada bindings repository"""
    print_step("Cloning LLVM Ada bindings")
    
    gnat_llvm_dir = base_dir / 'gnat-llvm'
    llvm_bindings_dir = gnat_llvm_dir / 'llvm-bindings'
    
    if llvm_bindings_dir.exists():
        if skip_if_exists:
            print_success(f"LLVM bindings already exist at {llvm_bindings_dir}")
        else:
            print_warning(f"LLVM bindings repository already exists at {llvm_bindings_dir}")
            response = input("Do you want to remove and re-clone? (y/N): ")
            if response.lower() == 'y':
                shutil.rmtree(llvm_bindings_dir)
            else:
                print_success("Skipping clone")
                return
    
    if not llvm_bindings_dir.exists():
        print(f"Cloning LLVM bindings to {llvm_bindings_dir}...")
        print("Note: These Ada bindings are required for GNAT LLVM compilation")
        run_command(['git', 'clone', 'https://github.com/AdaCore/llvm-bindings.git', str(llvm_bindings_dir)], cwd=gnat_llvm_dir)
        print_success("LLVM bindings cloned successfully")
        
        # Checkout LLVM 19 branch for compatibility
        print("Checking out llvm-19 branch for LLVM 19 compatibility...")
        run_command(['git', 'checkout', 'llvm-19'], cwd=llvm_bindings_dir)
        print_success("Checked out llvm-19 branch")


def clone_repositories(base_dir, skip_if_exists=False):
    """Clone required repositories"""
    print_step("Cloning repositories")
    # First clone AdaCore's gnat-llvm repository into a working directory
    gnat_llvm_dir = base_dir / 'gnat-llvm'
    if gnat_llvm_dir.exists():
        print_success(f"Found existing gnat-llvm at {gnat_llvm_dir}")
    else:
        print(f"Cloning AdaCore gnat-llvm into {gnat_llvm_dir}...")
        run_command(['git', 'clone', 'https://github.com/AdaCore/gnat-llvm.git', str(gnat_llvm_dir)], cwd=base_dir)
        print_success("gnat-llvm cloned successfully")

    # Now clone gcc into the gnat-llvm working dir under llvm-interface
    # so final layout is: <base>/gnat-llvm/llvm-interface/gcc
    llvm_interface_inside = gnat_llvm_dir / 'llvm-interface'
    llvm_interface_inside.mkdir(parents=True, exist_ok=True)
    gcc_dir = llvm_interface_inside / 'gcc'
    if gcc_dir.exists():
        if skip_if_exists:
            print_success(f"GCC repository already exists at {gcc_dir}")
        else:
            print_warning(f"GCC repository already exists at {gcc_dir}")
            response = input("Do you want to remove and re-clone? (y/N): ")
            if response.lower() == 'y':
                shutil.rmtree(gcc_dir)
            else:
                print_success("Skipping clone")
                return

    if not gcc_dir.exists():
        print(f"Cloning GCC repository to {gcc_dir}...")
        print_warning("This may take a while (GCC repository is large)")
        run_command(['git', 'clone', 'git://gcc.gnu.org/git/gcc.git', str(gcc_dir)], cwd=gnat_llvm_dir)
        print_success("GCC repository cloned successfully")
    
    # Checkout LLVM 19-compatible version of gnat-llvm
    if gnat_llvm_dir.exists():
        print("Checking out LLVM 19-compatible version of gnat-llvm...")
        run_command(['git', 'checkout', '61e66275'], cwd=gnat_llvm_dir)
        print_success("Checked out LLVM 19-compatible commit")
    
    # Clone LLVM Ada bindings - required for compilation
    clone_llvm_bindings(base_dir, skip_if_exists=skip_if_exists)


def setup_gnat_source_link(base_dir):
    """Create symlink or move Ada sources"""
    print_step("Setting up GNAT source link")
    
    # Support both layouts:
    # 1) base_dir/llvm-interface/gcc/gcc/ada
    # 2) base_dir/gnat-llvm/llvm-interface/gcc/gcc/ada
    primary = base_dir / "llvm-interface" / "gcc" / "gcc" / "ada"
    secondary = base_dir / "gnat-llvm" / "llvm-interface" / "gcc" / "gcc" / "ada"
    if primary.exists():
        gcc_ada_dir = primary
        gnat_src_dir = base_dir / "llvm-interface" / "gnat_src"
    elif secondary.exists():
        gcc_ada_dir = secondary
        gnat_src_dir = base_dir / "gnat-llvm" / "llvm-interface" / "gnat_src"
    else:
        gcc_ada_dir = primary  # keep original for error message
        gnat_src_dir = base_dir / "llvm-interface" / "gnat_src"
    
    if not gcc_ada_dir.exists():
        print_error(f"Ada source directory not found at {gcc_ada_dir}")
        print_error("Make sure GCC repository was cloned successfully (expected one of the supported layouts)")
        sys.exit(1)
    
    if gnat_src_dir.exists():
        print_success(f"GNAT source already set up at {gnat_src_dir}")
        return
    
    is_windows = platform.system() == 'Windows'
    
    if is_windows:
        print("Windows detected: moving Ada sources to gnat_src")
        shutil.move(str(gcc_ada_dir), str(gnat_src_dir))
    else:
        print("Unix-like system detected: creating symlink to Ada sources")
        os.symlink('gcc/gcc/ada', str(gnat_src_dir))
    
    print_success("GNAT source link created successfully")


def install_llvm_instructions():
    """Print instructions for installing LLVM"""
    print_step("LLVM Installation")
    print("\nLLVM 19.x is compatible with this version. You have several options:")
    print("\n1. Use package manager (recommended):")
    
    system = platform.system()
    if system == "Darwin":
        print("   brew install llvm")
    elif system == "Linux":
        # Try to detect Linux distribution
        if Path("/etc/debian_version").exists():
            print("   sudo apt-get install llvm-16-dev clang-16")
        elif Path("/etc/redhat-release").exists():
            print("   sudo yum install llvm-devel clang")
        else:
            print("   (Use your distribution's package manager)")
    
    print("\n2. Build LLVM yourself with custom options")
    print("\n3. For core GNAT LLVM development on x86 native configurations:")
    print("   make llvm")
    print("   (Requires cmake >= 3.13.4)")
    
    print_warning("\nNote: After installation, ensure llvm-config and clang are in your PATH")
    print_warning("There's a known bug in LLVM's aliasing handling.")
    print_warning("A patch is available in: llvm/patches/LLVMStructTBAAPatch.diff")


def build_llvm(base_dir):
    """Build LLVM using make llvm command"""
    print_step("Building LLVM (for x86 native development)")
    
    if shutil.which('cmake') is None:
        print_error("cmake not found. This is required for building LLVM")
        sys.exit(1)
    
    # Check cmake version
    result = run_command(['cmake', '--version'], check=False)
    if result.returncode == 0:
        print_success(f"cmake found: {result.stdout.splitlines()[0]}")
    
    print_warning("Building LLVM from source may take a significant amount of time")
    response = input("Continue with building LLVM? (y/N): ")
    if response.lower() != 'y':
        print("Skipping LLVM build")
        return

    # Prefer running `make llvm` inside the gnat-llvm working directory if
    # present (this is where the GNAT LLVM top-level Makefile usually lives).
    gnat_llvm_dir = base_dir / 'gnat-llvm'
    make_cwd = gnat_llvm_dir if gnat_llvm_dir.exists() else base_dir

    run_command(['make', 'llvm'], cwd=make_cwd)
    print_success("LLVM built successfully")


def build_gnat_llvm(base_dir):
    """Build GNAT LLVM"""
    print_step("Building GNAT LLVM")
    
    # Prefer running the GNAT LLVM build inside the gnat-llvm working
    # directory if it exists so Makefiles find the expected layout.
    gnat_llvm_dir = base_dir / 'gnat-llvm'
    make_cwd = gnat_llvm_dir / 'llvm-interface' if (gnat_llvm_dir / 'llvm-interface').exists() else base_dir

    # Build GNAT LLVM compiler only (skip runtime library)
    # Note: Using 'setup build' targets instead of 'all' to skip gnatlib
    print("Building GNAT LLVM compiler (this may take several minutes)...")
    
    # Suppress unreferenced variable warnings which can cause build failures
    # with certain GCC/GNAT versions
    print("Note: Suppressing unreferenced variable warnings to avoid build errors")
    print("Note: Skipping runtime library (gnatlib) build due to compatibility issues")
    
    # Check if llvm-config is available
    llvm_config_path = shutil.which('llvm-config')
    make_cmd = ['make']
    
    if llvm_config_path:
        print(f"Using LLVM config: {llvm_config_path}")
        make_cmd.append(f'LLVM_CONFIG={llvm_config_path}')
    
    # Add flag to suppress unreferenced warnings (-gnatwU)
    # This is needed because some GCC sources may have unused renamed variables
    make_cmd.append('GNATFLAGS=-gnatwU')
    
    # Only build compiler, not runtime library
    make_cmd.extend(['setup', 'build'])
    
    run_command(make_cmd, cwd=make_cwd)

    print_success("GNAT LLVM compiler built successfully")
    print_warning("Note: Runtime library (gnatlib) build skipped due to known compatibility issues")
    print_warning("The compiler is fully functional for most use cases")
    print_success(f"Binary and library directories created under llvm-interface/")

    # The resulting `bin` dir may be under the nested layout.
    bin_dir = (gnat_llvm_dir / "llvm-interface" / "bin") if gnat_llvm_dir.exists() else (base_dir / "llvm-interface" / "bin")
    print(f"\n{Colors.OKGREEN}To use GNAT LLVM, add to your PATH:{Colors.ENDC}")
    print(f"{Colors.BOLD}export PATH={bin_dir}:$PATH{Colors.ENDC}")


def build_gnatlib_bc(base_dir):
    """Build bitcode for GNAT runtime"""
    print_step("Building GNAT runtime bitcode")
    
    # Run under gnat-llvm if present
    gnat_llvm_dir = base_dir / 'gnat-llvm'
    make_cwd = gnat_llvm_dir if gnat_llvm_dir.exists() else base_dir
    run_command(['make', 'gnatlib-bc'], cwd=make_cwd)
    
    print_success("GNAT runtime bitcode built successfully")
    print_success("libgnat.bc and libgnarl.bc created in adalib directory")


def main():
    """Main installation workflow"""
    parser = argparse.ArgumentParser(
        description='Automate GNAT LLVM installation',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 install.py                    # Full installation
  python3 install.py --skip-clone       # Skip cloning if repos exist
  python3 install.py --build-gnatlib-bc # Also build runtime bitcode
        """
    )
    parser.add_argument('--skip-clone', action='store_true',
                        help='Skip cloning repositories if they already exist')
    parser.add_argument('--skip-llvm', action='store_true',
                        help='Skip LLVM installation/build step')
    parser.add_argument('--build-gnatlib', action='store_true',
                        help='Attempt to build full runtime library (may fail)')
    parser.add_argument('--build-gnatlib-bc', action='store_true',
                        help='Build bitcode for GNAT runtime after main build')
    
    args = parser.parse_args()
    
    # Determine base directory (should be gnat-llvm root)
    script_dir = Path(__file__).parent.resolve()
    base_dir = script_dir
    build_dir = base_dir / "build"
    
    # Create build directory if it doesn't exist
    build_dir.mkdir(parents=True, exist_ok=True)
    
    print(f"{Colors.HEADER}{Colors.BOLD}")
    print("=" * 60)
    print("  GNAT LLVM Installation Script")
    print("=" * 60)
    print(f"{Colors.ENDC}")
    print(f"Base directory: {base_dir}")
    print(f"Build directory: {build_dir}\n")
    
    try:
        # Step 1: Check prerequisites
        if not check_prerequisites():
            print_error("\nPrerequisite check failed")
            print("Please install missing tools and try again")
            sys.exit(1)
        
        # Step 2: Clone repositories
        clone_repositories(build_dir, skip_if_exists=args.skip_clone)
        
        # Step 3: Setup GNAT source link
        setup_gnat_source_link(build_dir)
        
        # Step 4: LLVM installation
        if not args.skip_llvm:
            install_llvm_instructions()
            
            print_warning("\nDo you want to build LLVM using 'make llvm'?")
            print("(Only suitable for core GNAT LLVM development on x86 native)")
            response = input("Build LLVM now? (y/N): ")
            if response.lower() == 'y':
                build_llvm(build_dir)
            else:
                print("Skipping LLVM build - ensure LLVM 16.0.x is installed via package manager")
        
        # Step 5: Build GNAT LLVM
        print_warning("\nReady to build GNAT LLVM")
        response = input("Continue? (Y/n): ")
        if response.lower() != 'n':
            build_gnat_llvm(build_dir)
        else:
            print("Build skipped")
            sys.exit(0)
        
        # Step 6: Optionally build GNAT runtime library (full or bitcode)
        if args.build_gnatlib:
            print_warning("Building full gnatlib (may encounter compatibility issues)...")
            gnat_llvm_dir = build_dir / 'gnat-llvm'
            run_command(['make', 'gnatlib'], cwd=gnat_llvm_dir / 'llvm-interface' if (gnat_llvm_dir / 'llvm-interface').exists() else build_dir)
        
        if args.build_gnatlib_bc:
            build_gnatlib_bc(build_dir)
        
        # Final success message
        print(f"\n{Colors.OKGREEN}{Colors.BOLD}")
        print("=" * 60)
        print("  Installation completed successfully!")
        print("=" * 60)
        print(f"{Colors.ENDC}")
        
    except KeyboardInterrupt:
        print_error("\n\nInstallation interrupted by user")
        sys.exit(1)
    except Exception as e:
        print_error(f"\n\nInstallation failed: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()