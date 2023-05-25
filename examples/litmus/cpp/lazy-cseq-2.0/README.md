# Lazy-CSeq 2.0 (Lazy-CSeq+ABS) #

## Package contents ##

| File/Directory | Description                          |
| -------------- | ------------------------------------ |
| [cseq-feeder.py](./cseq-feeder.py) | Lazy-CSeq wrapper script             |
| [core](./core)          | Lazy-CSeq core framework             |
| [modules](./modules)       | modules and configuration files      |
| [examples](./examples)      | example files                        |
| LICENSE*       | license files                        |
| README.md      | this file                            |


## Installation ##

To install Lazy-CSeq, please follow the steps below:

1. install the dependencies:
    - Python 2.7
    - [PYCParser](https://github.com/eliben/pycparser) (`pip install pycparser==2.17`)
    - Backends:
        + [CBMC](http://www.cprover.org/cbmc/)
        + [Frama-C](https://frama-c.com/download.html)

2. create a directory, suppose this is called /workspace

3. extract the entire package contents in /workspace

4. set execution (+x) permissions for cseq-feeder.py

5. (optional) make sure that the backend's binary is in the search path,
   or amend the command strings in modules/feeder.py,
    sect. Options and Parameters, accordingly.

## Usage ##

To try Lazy-CSeq 2.0, please use the following command:

    ./cseq-feeder.py -i examples/lazy_unsafe.c -l lazy+ai

which should conclude that the benchmark is unsafe.

For more details, please refer to `./cseq-feeder.py -h -l lazy+ai`

