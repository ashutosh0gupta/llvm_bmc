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
fname = sys.argv[2]

fname=os.path.basename(fname)

in_file   = tmp_path + '/'+fname+'.tr.tr'
out_file  = tmp_path + '/'+fname+'.clean.tr'
cbmc_file = tmp_path + '/'+fname+'.cbmc_out.cpp'
tagged    = tmp_path + '/'+fname+'.trace-tagged.cpp'
wrong     = tmp_path + '/'+fname+'.wrong.litmus'
wrong_tag = tmp_path + '/'+fname+'.wrong-tagged.litmus'

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


#--------------------------------------------
# Stiching litmust files to output of cmsb
#--------------------------------------------

print(wrong)
if os.path.isfile(wrong):
    elists = []
    p = re.compile(r'=([0-9]+)$')
    for t in range(1,3):
        tid = str(t)
        tes = [ k.strip() for k in cf if tid+' ASSIGN' in k ]
        last_sat = ""
        last_iw = ""
        es = []
        for s in tes:
            match = re.findall( p, s)
            if 'LDSAT' in s:
                last_sat = match[0]
            if 'LDCOM' in s:
                es.append( match[0]+","+last_sat )                
            if 'STIW' in s:
                last_iw = match[0]
            if 'STCOM' in s:
                es.append( last_iw + "," + match[0] )
        elists.append(es)

    try:
        with open(wrong) as wf:
            ws = wf.readlines()
    except IOError as e:
        print( "Failed to open " + cbmc_file  )
        sys.exit(0)
    ows = []
    epos = [0] * len(elists)
    for w in ws:
        if "|" in w:
            ins = w.split("|")
            t = 0
            for instr in ins:
                # instr = instr.strip()
                if instr.startswith(' LD'):
                    instr = elists[t][epos[t]]+" "+instr
                    epos[t] += 1
                elif instr.startswith(' ST'):
                    instr = elists[t][epos[t]]+"   "+instr
                    epos[t] += 1
                else:
                    instr = "    "+instr                    
                ins[t] = instr
                t += 1
            w = "|".join(ins)
        ows.append(w)

    tf = open(wrong_tag,'w+')
    tf.writelines(ows)
    tf.close()
