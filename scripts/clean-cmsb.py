#!/usr/bin/python3
#
# after the run check if all the students from the webpage have
# been processes accurately.
#

import re
import os
import shutil
import sys

tmp_path= sys.argv[1]

in_file   = tmp_path + '/tr.tr'
out_file  = tmp_path + '/clean.tr'
cbmc_file = tmp_path + '/cbmc_out.cpp'
tagged    = tmp_path + '/trace-tagged.cpp'

try:
    with open(in_file) as in_f:
        input = in_f.read()
except IOError as e:
    print( "Failed to open " + in_file  )
    sys.exit(0)

output = open(out_file,'w+')

out=input
# out = re.sub(r'\[2m', r'', input, flags=re.M)
out = re.sub(r'\n.*line ([0-9]*) thread 0\n----------------------------------------------------\n', r'\1 :', out, flags=re.M)
out = re.sub(r'\nAssumption:\n.*line ([0-9]*) function.*\n', r'\1 :', out, flags=re.M)
out = re.sub(r'\(signed long int\)', r'', out, flags=re.M)
out = re.sub(r'\([01 ]*\)$', r'', out, flags=re.M)
out = re.sub(r'\({[01 ?,]*}\)$', r'', out, flags=re.M)
output.write(out)
output.close()
in_f.close()


try:
    with open(cbmc_file) as cbmc_f:
        cf = cbmc_f.readlines()
    with open(out_file) as out_f:
        out = out_f.readlines()
except IOError as e:
    print( "Failed to open " + cbmc_file  )
    sys.exit(0)

# grep -e "c.*]=" -e "c.*[0-9]=" /tmp/clean.tr > ~/tmp/stamps.txt

p = re.compile(r'([0-9]+) : (.*[^ =><]=.*)')

for line in out:
    match = re.findall( p, line)
    if len(match) > 0:
        line_num = int(match[0][0])-1
        update = match[0][1]
        cf[line_num] = cf[line_num].rstrip() + '// ' + update.rstrip() + '\n'
    
tf = open(tagged,'w+')
tf.writelines(cf)
tf.close()


