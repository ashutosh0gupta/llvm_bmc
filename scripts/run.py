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
n = 2

folder = "examples/kbound/omkar/bench"
exs = [ ["burns-safe-fenced","burns"]
       ]


my_env = os.environ.copy()
my_env["TIMEFORMAT"] = "%R"

p = re.compile(r'([A-Z]*SAFE)   ([0-9\.]*)user')

def find_time( result ):
   out = re.findall( p, result)
   return out[0]


print( "Name\t\t\tKind\tN K  L Result\tTime" )
for ex in exs:
  f = folder + "/"+ ex[0]+".cpp"
  s = folder + "/"+ ex[1]+".spec"
  print(ex[0]+"\t\t" + str(n) + " " + str(k) + " " +str(l) + " ", end="")
  result = subprocess.check_output(["time", run, str(l), str(k), f, s ],env=my_env,stderr=subprocess.STDOUT)
  result=result.decode("utf-8")
  time = find_time(result)
  print(time[0]+"\t"+time[1])
