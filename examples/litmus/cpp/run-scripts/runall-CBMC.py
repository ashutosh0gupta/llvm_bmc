#!/usr/bin/python3

# Copyright (C) 2023 Tuan Phong Ngo
# Run all C litmus tests under PSO semantics with CBMC.

import datetime
import subprocess
import sys
import tempfile
import os
import time
import shlex

curDir = os.getcwd()
LITMUSDIR = curDir + '/../c-litmus-CBMC'
EXPECTEDLISTFILE = curDir + '/../aarch64.herd.results.txt'
SCRIPT = 'cbmc'
LOGFILENAME = curDir + '/../pso.CBMC.results.txt'
TIMEOUT = 120  # 120 = 2 minutes


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
    if not ('CBMC allow' in tst):
        if 'CBMC did not find file' in tst['failure']:
            s = s + 'FILENOTFOUND: '
        else:
            s = s + 'FAILURE: '
        if 'failure' in tst:
            s = s + tst['failure']
        else:
            s = s + '(unknown)'
        return s
    if tst['CBMC allow'] != tst['expect allow'] and tst['expect allow']:
        s = s + 'FALSE POSITIVE: Unexpected result Forbid due to memory model'
        return s
    if tst['CBMC allow'] != tst['expect allow']:
        s = s + 'FAILURE: Unexpected result ' + ('Allow' if tst['CBMC allow'] else 'Forbid')
        return s
    s = s + 'OK: ' + ('Allow' if tst['CBMC allow'] else 'Forbid')
    return s


def runall():
    logfile = open(LOGFILENAME, 'w')
    logfile.write('# Results of applying CBMC to all litmus tests.\n')
    logfile.write('# cbmc --mm pso TEST.c\n')
    logfile.write('#\n')
    logfile.write('# Tests where "VERIFICATION SUCCESSFUL" was observed are marked "Forbid".\n')
    logfile.write('# Otherwise, they are marked "Allow".\n')
    logfile.write('# \n')
    logfile.write('# The tests where executed using ra-runall-CBMC.py.\n')
    logfile.write('# Date: ' + datetime.datetime.now().strftime('%y%m%d-%H:%M') + '\n')
    logfile.write('\n')
    tests = get_expected(EXPECTEDLISTFILE)
    t0 = time.time()
    n = 0
    for tst in tests:
        n = n + 1
        try:
            cmd = SCRIPT + ' --mm pso' + ' ' + LITMUSDIR + '/' + tst['tstname'] + '.c'
            # print(cmd)
            result = subprocess.run(shlex.split(cmd), stderr=subprocess.STDOUT, timeout=TIMEOUT, stdout=subprocess.PIPE)
            out = result.stdout.decode()
            # print(out)
            if out.find('VERIFICATION FAILED') >= 0:
                tst['CBMC allow'] = True
            elif out.find('VERIFICATION SUCCESSFUL') >= 0:
                tst['CBMC allow'] = False
            elif out.find('Failed to open input file') >= 0:
                tst['failure'] = 'CBMC did not find file'
            else:
                tst['failure'] = 'CBMC returns unrecognized results'
        except subprocess.CalledProcessError as e:
            print(e)
            tst['failure'] = 'error in running CBMC'
            continue
        except subprocess.TimeoutExpired as e:
            print(e)
            tst['failure'] = 'timeout'
            continue
        finally:
            print('{0:4}: '.format(n), end='')
            print(res_to_string(tst))
            logfile.write(res_to_string(tst) + '\n')
    runtime = time.time() - t0
    logfile.write('# Time: {0:.2f} s\n'.format(runtime))
    logfile.close()


runall()
