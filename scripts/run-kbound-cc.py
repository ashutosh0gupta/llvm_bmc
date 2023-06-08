#!/usr/bin/python3

import re
import os
import shutil
import sys
import subprocess
import time
from joblib import Parallel, delayed
from tqdm import tqdm

run   = "./scripts/run-example.sh"
k = 10
l = 1

# choose a folder to execute

# folder = "examples/kbound/omkar/bench"

folder = "./examples/kbound/cc/"


sys.path.append(folder)
import examples
exs = examples.exs

p = re.compile(r'([A-Z]*SAFE) *([0-9\.]*)user')

def find_time( result ):
   # print(result)
   out = re.findall( p, result)
   if len(out) == 0:
      print(result)
      exit()
   return out[0]


i = 0
new_exs = []
for ex in exs:
   i = i+1
   new_exs.append([i]+ex)
exs = new_exs

mm = "cc"

print("------------------------------")
print("Running kbound implementation:")
print("Memory model :" + mm)
print("Example suite :" + folder)
# if only_error:
#    print("Full report only for wrong answers!")
print("------------------------------")
print( "Index\tName\t\t\tKind\tN K L Result\tTime" )
err_cnt = 0
total_time = 0.0
def runner(ex):
   report = False
   # if not ex[0] in fails:
   #    continue
   # if ex[1] != 'MP+dmb.sy+fri-rfi-addr': # 'MP+dmb.sy+addr-pos-addr': #'MP+dmb.sy+addr-rfi-addr': # 'JSV': # 'CO-SBI': #'MP+popl+poap':
   #    return 0
   # if ex[0] < 1552: #1564:  #1530: 3579: #3599:
   #    return 0
   f = folder + "/"+ ex[1]+".cpp"
   if not os.path.isfile(f):
      f = folder + "/"+ ex[1]+".c"
   if not os.path.isfile(f):
      print(f+' does not exists!')
      exit()
   if ex[2] != "-":
      s = folder + "/"+ ex[2]+".spec"
   else:
      s = "-"
   n = ex[3]
   if( len(ex) > 3):
      lk =  ex[4]
   else:
      lk = 10
   lk = n+3
   if( len(ex) > 4):
      l = ex[5]
   else:
      l = 1
   if( len(ex) > 5):
      kind = ex[6]
   else:
      kind = "unk"
   tmp_path = "./tmp/"
   if report:
      print(str(ex[0])+"\t"+ex[1]+"\t"+ kind +"\t" + str(n) + " " + str(lk) + " " +str(l) + " ", end="")
   result = subprocess.check_output(["time", run, str(l), str(lk), f, s, tmp_path,mm],stderr=subprocess.STDOUT)
   result=result.decode("utf-8")
   time = find_time(result)
   if report:
      print(time[0]+"\t"+time[1])
   if time[0].lower() != kind:
      print(str(ex[0])+"\t"+ ex[1]+"\t"+ kind +"\t" + str(n) + " " + str(lk) + " " +str(l) + " ", end="")
      print(time[0]+"\t"+time[1])
      fname = os.path.basename(f)
      shutil.copyfile('examples/litmus/c/original/alltests/'+ex[1]+".litmus",
                      "./tmp/"+fname+".wrong.litmus")
      shutil.copyfile(f,"./tmp/"+fname+".wrong.c")
      if time[0] == 'UNSAFE':
         # rerun the clean-cbmc
         result = subprocess.check_output(["./scripts/clean-cbmc.py", "./tmp/",f])
         # print(result)
         # exit()
      print('Wrong answer!!')
      # err_cnt += 1
   return float(time[1])

#exs = exs[:100]
# exs = exs[:1]
seq = True

if seq:
   for ex in exs:
      time = runner(ex)
      total_time += time
      print(ex[0],end="\r")
else:
   result = Parallel(n_jobs=-1)( delayed(runner)(ex) for ex in tqdm(exs) )

print("------------------------------")
# print("Number of errors:"+str(err_cnt))
print("Total run time:"+str(total_time))
print("------------------------------")

