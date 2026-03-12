# LLVM BMC Scripts

Helper scripts for converting Ada source files to LLVM bitcode (`.bc`) and native assembly (`.s`).

---

## `convert_examples.py`

Compiles Ada `.adb` files from the `gnat-llvm/examples/` directory into LLVM IR, then produces `.bc` and `.s` outputs under `conversions/`.

### Prerequisites

| Tool | Version |
|------|---------|
| `llvm-gcc` | via `gnat-llvm/llvm-interface/bin` |
| `llvm-as` | LLVM 19 (`/usr/lib/llvm-19/bin`) |
| `llc` | LLVM 19 (`/usr/lib/llvm-19/bin`) |

### Usage

**Process all Ada body files in the examples directory:**
```bash
python3 convert_examples.py
```

**Process a single specific file:**
```bash
# Relative path
python3 convert_examples.py ../gnat-llvm/examples/GCD.adb

# Absolute path
python3 convert_examples.py /absolute/path/to/HANOI.adb
```

### Pipeline (per file)

```
File.adb  →  llvm-gcc -S -emit-llvm  →  File.ll
File.ll   →  llvm-as                 →  File.bc
File.ll   →  llc                     →  File.s
```

All outputs are written to `../conversions/` (relative to the `scripts/` directory).

### Notes

- **`.ads` files are skipped automatically.**  
  Ada package spec files (`.ads`) contain only declarations — no executable body — so the compiler cannot emit LLVM IR from them. The script prints a skip notice and continues.

- If the output directory does not exist it is created automatically.

- Exit code is non-zero if a single-file argument is provided but the file is not found.
