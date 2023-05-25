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

in_file = tmp_path+'/tr.tr'
out_file = tmp_path+'/clean.tr'

try:
    with open(in_file) as in_f:
        input = in_f.read()
except IOError as e:
    print( "failed to open" + in_file  )
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
