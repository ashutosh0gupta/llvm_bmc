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
        #["01-tl-btlock-unsafe","01-tl-btlock-6",6]
        ['burns-safe' , 'burns' , 2], 
        ['burns-unsafe1','burns' , 2], 
        ['burns-unsafe2','burns' , 2], 
        ['burns-unsafe3','burns' , 2], 
        ['burns-unsafe4','burns' , 2], 
        ['burns-unsafe5','burns' , 2], 
        ['dekker-safe', 'dekker' , 2], 
        ['dekker-unsafe1','dekker' , 2], 
        ['dekker-unsafe2','dekker' , 2], 
        ['dekker-unsafe3','dekker' , 2], 
        ['dijkstra-safe','dijkstra' , 2], 
        ['dijkstra-unsafe1','dijkstra' , 2], 
        ['dijkstra-unsafe2','dijkstra' , 2], 
        ['dijkstra-unsafe3','dijkstra' , 2], 
        ['fibbench-safe','fibbench' , 2], 
        # ['fibbench-unsafe','fibbench' , 2], 
        ['nolocking-unsafe','nolocking',2], 
        ['peterson-safe1','peterson',2], 
        ['peterson-unsafe1','peterson',2],
        ['peterson-unsafe2','peterson',2], 
        ['pgsql_bound-safe','pgsql_bound',2], 
        ['pgsql_bound-unsafe-','pgsql_bound',2], 
        ['pgsql-safe','pgsql',2], 
        ['pgsql-unsafe','pgsql',2], ['sigma-unsafe','sigma',4], 
        ['singleton-safe','singleton',2], 
        ['szymanski-safe','szymanski',2], 
        ['szymanski-unsafe1','szymanski',2]
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
