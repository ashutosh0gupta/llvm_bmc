#!/usr/bin/python3

import re
import os
import shutil
import sys
import subprocess
import time

print("Running kbound implementation:")

# tmp_path = ""
# subprocess.run(["rm",  tmp_path+"/cbmc_out.cpp" ])

run   = "./scripts/run-example.sh"
k = 10
l = 1

# choose a folder to execute

# folder = "examples/kbound/omkar/bench"

folder = "./examples/litmus/cpp/c-litmus-ARMCBMC/"

# folder = "examples/kbound/pldi19-benchmark"

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


print( "Name\t\t\tKind\tN K L Result\tTime" )
for ex in exs[:10]:
   f = folder + "/"+ ex[0]+".cpp"
   if not os.path.isfile(f):
      f = folder + "/"+ ex[0]+".c"
   if not os.path.isfile(f):
      print(f+' doest not exists!')
      exit()
   if ex[1] != "-":
      s = folder + "/"+ ex[1]+".spec"
   else:
      s = "-"
   n = ex[2]
   if( len(ex) > 3):
      lk =  ex[3]
   else:
      lk = 10
   if( len(ex) > 4):
      l = ex[4]
   else:
      l = 1
   if( len(ex) > 5):
      kind = ex[5]
   else:
      kind = "unk"
      
   print(ex[0]+"\t"+ kind +"\t" + str(n) + " " + str(lk) + " " +str(l) + " ", end="")
   result = subprocess.check_output(["time", run, str(l), str(lk), f, s ],stderr=subprocess.STDOUT)
   result=result.decode("utf-8")
   print(result)
   # exit()
   time = find_time(result)
   print(time[0]+"\t"+time[1])
