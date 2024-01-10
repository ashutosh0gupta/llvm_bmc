#!/usr/bin/python3

# Copyright (C) 2023 Tuan Phong Ngo
# Run all C litmus tests under SC semantics with ARMCBMC.

import datetime
import subprocess
import sys
import tempfile
import os
import time
import shlex
import glob

curDir = os.getcwd()
LITMUSDIR = curDir + '/../c-litmus-ARMCBMC'
EXPECTEDLISTFILE = curDir + '/../exclusive.aarch64.herd.results.txt'
SCRIPT1 = curDir + '/../../../../llvmbmc'
SCRIPT2 = 'cbmc'
LOGFILENAME = curDir + '/../arm.armcbmc.results.txt'
TIMEOUT = 120  # 120 = 2 minutes
UNWIND = '1'
BOUND = '10' # 5 will miss some behaviours such as in MP+dmb.sy+ctrl-[fr-rf]
TEMPFOLDER = curDir + '/tmp_10'


def get_expected(fname):
    f = open(fname, 'r')
    l = []
    for ln in f:
        ln = ln.strip()
        if len(ln) and not (ln[0] == '#'):
            # print(ln)
            if len(ln.split()) == 2:  # remove FAILURE cases
                [tst, exp] = ln.split()
                assert (exp == 'Allow' or exp == 'Forbid')
                l.append({'tstname': tst, 'expect allow': (exp == 'Allow')})
    f.close()
    return l


def res_to_string(tst):
    s = tst['tstname'] + ' '
    if not ('ARMCBMC allow' in tst):
        if 'ARMCBMC did not find file' in tst['failure']:
            s = s + 'FILENOTFOUND: '
        else:
            s = s + 'FAILURE: '
        if 'failure' in tst:
            s = s + tst['failure']
        else:
            s = s + '(unknown)'
        return s
    # if tst['ARMCBMC allow'] != tst['expect allow'] and tst['expect allow']:
    #    s = s + 'FALSE POSITIVE: Unexpected result Forbid due to memory model'
    #    return s
    if tst['ARMCBMC allow'] != tst['expect allow']:
        s = s + 'FAILURE: Unexpected result ' + ('Allow' if tst['ARMCBMC allow'] else 'Forbid')
        return s
    s = s + 'OK: ' + ('Allow' if tst['ARMCBMC allow'] else 'Forbid')
    return s


def runall():
    # Create folder or clean all files if the folder exists
    if not os.path.exists(TEMPFOLDER):
        os.makedirs(TEMPFOLDER)
    else:
        files = glob.glob(TEMPFOLDER + '/*')
        for f in files:
            os.remove(f)
    logfile = open(LOGFILENAME, 'w')
    logfile.write('# Results of applying ARMCBMC to all litmus tests.\n')
    logfile.write('# llvmbmc  --unwind 1 -o ./tmp/ --context-bound 10 -k TEST.c\n')
    logfile.write('# cbmc ./tmp/TEST.c.cbmc_out.cpp\n')
    logfile.write('#\n')
    logfile.write('# Tests where "VERIFICATION SUCCESSFUL" was observed are marked "Forbid".\n')
    logfile.write('# Otherwise, they are marked "Allow".\n')
    logfile.write('# \n')
    logfile.write('# The tests where executed using runall-ARMCBMC.py.\n')
    logfile.write('# Date: ' + datetime.datetime.now().strftime('%y%m%d-%H:%M') + '\n')
    logfile.write('\n')
    tests = get_expected(EXPECTEDLISTFILE)
    t0 = time.time()
    n = 0
    for tst in tests:
        n = n + 1
        try:
            cmd1 = SCRIPT1 + ' --unwind ' + UNWIND + ' -o ' + TEMPFOLDER + '/' + '  --context-bound ' + BOUND + \
                   ' --memory-model armv2' + ' -k ' + LITMUSDIR + '/' + tst['tstname'] + '.c'
            #print(cmd1)
            result1 = subprocess.run(shlex.split(cmd1), stderr=subprocess.STDOUT, timeout=TIMEOUT,
                                     stdout=subprocess.PIPE)
            out1 = result1.stdout.decode()
            # print(out1)
            if out1.find('LLVM_BMC_VERIFICATION_SUCCESSFUL') == -1:
                tst['failure'] = 'ARMCBMC could not translate C file'
            else:
                try:
                    cmd2 = SCRIPT2 + ' ' + TEMPFOLDER + '/' + tst['tstname'] + '.c.cbmc_out.cpp'
                    #print(cmd2)
                    result2 = subprocess.run(shlex.split(cmd2), stderr=subprocess.STDOUT, timeout=TIMEOUT,
                                             stdout=subprocess.PIPE)
                    out2 = result2.stdout.decode()
                    if out2.find('VERIFICATION FAILED') >= 0:
                        tst['ARMCBMC allow'] = True
                    elif out2.find('VERIFICATION SUCCESSFUL') >= 0:
                        tst['ARMCBMC allow'] = False
                    elif out2.find('Failed to open input file') >= 0:
                        tst['failure'] = 'CBMC did not find file'
                    else:
                        tst['failure'] = 'CBMC returns unrecognized results'
                except subprocess.CalledProcessError as e2:
                    #print(e2)
                    tst['failure'] = 'error with CBMC'
                except subprocess.TimeoutExpired as e2:
                    #print(e2)
                    tst['failure'] = 'timeout with CBMC'
        except subprocess.CalledProcessError as e1:
            #print(e1)
            tst['failure'] = 'error in translation with ARMCBMC'
        except subprocess.TimeoutExpired as e1:
            #print(e1)
            tst['failure'] = 'timeout in translation with ARMCBMC'
        finally:
            print('{0:4}: '.format(n), end='')
            print(res_to_string(tst))
            logfile.write(res_to_string(tst) + '\n')
    runtime = time.time() - t0
    logfile.write('# Time: {0:.2f} s\n'.format(runtime))
    logfile.close()


runall()
