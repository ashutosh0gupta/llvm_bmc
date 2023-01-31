#!/usr/bin/python3

import re
import os
import shutil
import sys
import subprocess
import time

subprocess.run(["rm",  "/tmp/cbmc_out.cpp" ])

run   = "./scripts/run-example.sh"
k = 10
l = 1

# choose a folder to execute

# folder = "examples/kbound/omkar/bench"

folder = "examples/kbound/pldi19-benchmark"

# exs = [ # ["03-dq-deque-safe","03-dq-deque-3",3]
#         # ["03-dq-opt-deque-safe","03-dq-deque-3",3]
#         ["01-tl-btlock-unsafe","01-tl-btlock-6",6]
#        ]

# folder = "examples/kbound/omkar/bench"
# exs = [ ["burns-safe-fenced","burns"]
#        ]

# my_env = os.environ.copy()
# my_env["TIMEFORMAT"] = "%R"


sys.path.append(folder)
import examples
exs = examples.exs

p = re.compile(r'([A-Z]*SAFE) *([0-9\.]*)user')

def find_time( result ):
   out = re.findall( p, result)
   if len(out) == 0:
      print(result)
      exit()
   return out[0]


print( "Name\t\t\tKind\tN K  L Result\tTime" )
for ex in exs:
  f = folder + "/"+ ex[0]+".cpp"
  s = folder + "/"+ ex[1]+".spec"
  n = ex[2]
  lk =  n + 2 
  print(ex[0]+"\t\t" + str(n) + " " + str(lk) + " " +str(l) + " ", end="")
  result = subprocess.check_output(["time", run, str(l), str(lk), f, s ],stderr=subprocess.STDOUT)
  result=result.decode("utf-8")
  time = find_time(result)
  print(time[0]+"\t"+time[1])
