#!/usr/bin/python3

import re
import os
import shutil
import sys
import subprocess
import time

# print("Running kbound implementation:")

in_file = './examples/litmus/cpp/aarch64.herd.results.txt'
out_file = './examples/litmus/cpp/c-litmus-ARMCBMC/examples.py'
try:
    with open(in_file) as in_f:
        input = in_f.readlines()
except IOError as e:
    print( "failed to open" + in_file  )
    sys.exit(0)

out = open(out_file, "w")

# todo thread detection
print("exs=[",file=out)
for line in input:
    if not line.startswith("#"):
        line = line.split()
        if len(line) > 2:
            print(line)
            print('Bad line')
            exit()
        if len(line) > 1:
            if line[1] == 'Forbid':
                line[1] = 'safe'
            if line[1] == 'Allow':
                line[1] = 'unsafe'
            line = [line[0],'-',2,10,1,line[1]]
            print('\t',end="",file=out)
            print(line,end=",\n",file=out)
print(']',file=out)
            
            # exit()
