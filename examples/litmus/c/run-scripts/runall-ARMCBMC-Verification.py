#!/usr/bin/python3

# Copyright (C) 2023 Tuan Phong Ngo
# Run all C litmus tests under SC semantics with ARMCBMC.
# We assume that the code-to-code translation has been done by ARMCBMC and
# now we only run CBMC for the verification part.
#
# The motivation of it is to measure the verification time.

import datetime
import subprocess
import sys
import tempfile
import os
import time
import shlex
import glob

curDir = os.getcwd()
EXPECTEDLISTFILE = curDir + '/../aarch64.herd.results.txt'
SCRIPT =  'cbmc'
LOGFILENAME = curDir + '/../arm.armcbmc.verification.results.txt'
TIMEOUT = 120  # 120 = 2 minutes
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
    logfile = open(LOGFILENAME, 'w')
    logfile.write('# Results of applying CBMC to all output of ARMCBMC running on litmus tests.\n')
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
            cmd = SCRIPT + ' ' + TEMPFOLDER + '/' + tst['tstname'] + '.c.cbmc_out.cpp'
            #print(cmd)
            result = subprocess.run(shlex.split(cmd), stderr=subprocess.STDOUT, timeout=TIMEOUT,
                                             stdout=subprocess.PIPE)
            out = result.stdout.decode()
            #print(out)
            if out.find('VERIFICATION FAILED') >= 0:
                tst['ARMCBMC allow'] = True
            elif out.find('VERIFICATION SUCCESSFUL') >= 0:
                tst['ARMCBMC allow'] = False
            elif out.find('Failed to open input file') >= 0:
                tst['failure'] = 'CBMC did not find file'
            else:
                tst['failure'] = 'CBMC returns unrecognized results'
        except subprocess.CalledProcessError as e:
            #print(e)
            tst['failure'] = 'error with CBMC'
        except subprocess.TimeoutExpired as e:
            # print(e)
            tst['failure'] = 'timeout with CBMC'
        finally:
            print('{0:4}: '.format(n), end='')
            print(res_to_string(tst))
            logfile.write(res_to_string(tst) + '\n')
    runtime = time.time() - t0
    logfile.write('# Time: {0:.2f} s\n'.format(runtime))
    logfile.close()


runall()
