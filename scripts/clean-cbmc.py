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
fpath = sys.argv[2]

fname=os.path.basename(fpath)

in_file     = tmp_path + '/'+fname+'.tr.tr'
out_file    = tmp_path + '/'+fname+'.clean.tr'
cbmc_file   = tmp_path + '/'+fname+'.cbmc_out.cpp'
tagged      = tmp_path + '/'+fname+'.trace-tagged.cpp'
wrong_c     = tmp_path + '/'+fname+'.wrong.c'
wrong_tag_c = tmp_path + '/'+fname+'.wrong-tagged.cpp'
wrong       = tmp_path + '/'+fname+'.wrong.litmus'
wrong_tag   = tmp_path + '/'+fname+'.wrong-tagged.litmus'

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

def find_num_thread_litmus(lfile):
    # lfile = './examples/litmus/c/original/alltests/'+lname+".litmus"
    try:
        with open(lfile) as lf:
            lines = lf.readlines()
    except IOError as e:
        print( "failed to open" + in_file  )
        sys.exit(0)
    for line in lines:
        splits = line.split("|")
        if len(splits) > 1:
            return len(splits)
    return 0

def find_num_thread(cfile):
    # lfile = './examples/litmus/c/original/alltests/'+lname+".litmus"
    try:
        with open(cfile) as cf:
            lines = cf.readlines()
    except IOError as e:
        print( "failed to open" + in_file  )
        sys.exit(0)
    tnum = 1
    for line in lines:
        if "pthread_create" in line:
            tnum += 1
    return tnum

# tnum = find_num_thread_litmus(wrong)
tnum = find_num_thread(fpath)

# if os.path.isfile(wrong):
elists = []
p = re.compile(r'=([0-9]+)$')
lineno = re.compile(r'_l([0-9]+)_c')
for t in range(0,tnum): 
    tid = str(t)
    tes = [ k.strip() for k in cf if tid+' ASSIGN' in k ]
    last_sat = "_"
    last_iw = "_"
    es = []
    for s in tes:
        match = re.findall( p, s)
        if len(match) == 0:
            m = "_"
        else:
            m = match[0]                
        l = re.findall( lineno, s)
        if len(l) == 0:
            l = "_"
        else:
            l = l[0]
        if 'LDSAT' in s:
            last_sat = m
        if 'LDCOM' in s:
            es.append( (last_sat + "," + m,l) )                
        if 'STIW' in s:
            last_iw = m
        if 'STCOM' in s:
            es.append( (last_iw + "," + m,l) )
    elists.append(es)



shutil.copyfile(fpath, wrong_c)
with open(wrong_c) as wrong_f:
    cf = wrong_f.readlines()

for es in elists:
    for e in es:
        update = e[0]
        l = e[1]
        if l != "_":
            line_num = int(l)-1
            cf[line_num] = cf[line_num].rstrip() + '// '+update.rstrip() + '\n'
    
tf = open(wrong_tag_c,'w+')
tf.writelines(cf)
tf.close()
exit()
# print('I am here!')
# print(wrong)

if os.path.isfile(wrong):
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
                    instr = elists[t][epos[t]]+" "+instr
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
