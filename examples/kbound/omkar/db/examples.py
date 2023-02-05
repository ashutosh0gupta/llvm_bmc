#!/usr/bin/python3

# import re
# import os
# import shutil
# import sys
# import subprocess
# import time

# subprocess.run(["rm",  "/tmp/cbmc_out.cpp" ])

# run   = "./scripts/run-example.sh"
# k = 10
# l = 1
# # n = 2

#folder = "examples/kbound/pldi19-benchmark"
exs = [ 
        ['causality-violation3','causality-violation3',4,5,1],
        ['causality-violation2','causality-violation',3,5,1],
        ['causality-violation','causality-violation',3,5,1],
        ['load-buffer3','load-buffer3',4,5,1],
        ['load-buffer2','load-buffer',2,5,1],
        ['load-buffer','load-buffer',2,5,1],
        ['long-fork3','long-fork3',5,5,1],
        ['long-fork2','long-fork',4,5,1],
        ['long-fork','long-fork',4,5,1],
        ['mp3', 'mp3',4,5,1],
        ['mp2', 'mp',2,5,1],
        ['mp', 'mp',2,5,1],
        ['write-skew3', 'write-skew3',4,5,1],
        ['write-skew2', 'write-skew',2,5,1],
        ['write-skew', 'write-skew3',2,5,1]
        #['szymanksi_7_fenced','p7',7]
       ]

# # folder = "examples/kbound/omkar/bench"
# # exs = [ ["burns-safe-fenced","burns"]
# #        ]


# my_env = os.environ.copy()
# my_env["TIMEFORMAT"] = "%R"

# p = re.compile(r'([A-Z]*SAFE) *([0-9\.]*)user')

# def find_time( result ):
#    out = re.findall( p, result)
#    if len(out) == 0:
#       print(result)
#       exit()
#    return out[0]


# print( "Name\t\t\tKind\tN K  L Result\tTime" )
# for ex in exs:
# #   f = folder + "/"+ ex[0]+".cpp"
# #   s = folder + "/"+ ex[1]+".spec"
#   f = ex[0]+".cpp"
#   s = ex[1]+".spec"
#   print(ex[0]+"\t\t" + str(n) + " " + str(k) + " " +str(l) + " ", end="")
#   result = subprocess.check_output(["time", run, str(l), str(k), f, s ],env=my_env,stderr=subprocess.STDOUT)
#   result=result.decode("utf-8")
#   time = find_time(result)
#   print(time[0]+"\t"+time[1])
