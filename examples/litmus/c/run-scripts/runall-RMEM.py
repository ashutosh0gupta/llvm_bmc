#!/usr/bin/python3

# Copyright (C) 2023 Tuan Phong Ngo
# Run all C litmus tests under SC semantics with RMEM.

import datetime
import subprocess
import sys
import tempfile
import os
import time
import shlex

curDir = os.getcwd()
LITMUSDIR = curDir + '/../original/alltests'
EXPECTEDLISTFILE = curDir + '/../aarch64.herd.results.txt'
SCRIPT = '/home/ubuntu/POPL2024/Tools/rmem/promisingOpt'
LOGFILENAME = curDir + '/../arm.rmem.results.txt'
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
    if not ('RMEM allow' in tst):
        if 'RMEM did not find file' in tst['failure']:
            s = s + 'FILENOTFOUND: '
        else:
            s = s + 'FAILURE: '
        if 'failure' in tst:
            s = s + tst['failure']
        else:
            s = s + '(unknown)'
        return s
    if tst['RMEM allow'] != tst['expect allow']:
        s = s + 'FAILURE: Unexpected result ' + ('Allow' if tst['RMEM allow'] else 'Forbid')
        return s
    s = s + 'OK: ' + ('Allow' if tst['RMEM allow'] else 'Forbid')
    return s


def runall():
    logfile = open(LOGFILENAME, 'w')
    logfile.write('# Results of applying RMEM to all litmus tests.\n')
    logfile.write('# rmem/promisingOpt  -interactive  false -pp_hex  true TEST.litmus\n')
    logfile.write('#\n')
    logfile.write('# Tests where "Always" or "Sometimes" with "exists" was observed are marked "Allow".\n')
    logfile.write('# Tests where "Never" with "exists" was observed are marked "Forbid".\n')
    logfile.write('# Tests where "Always" with "forall" was observed are marked "Allow".\n')
    logfile.write('# Tests where "Sometimes" or "Never" with "forall" was observed are marked "Forbid".\n')
    logfile.write('# \n')
    logfile.write('# The tests where executed using runall-RMEM.py.\n')
    logfile.write('# Date: ' + datetime.datetime.now().strftime('%y%m%d-%H:%M') + '\n')
    logfile.write('\n')
    tests = get_expected(EXPECTEDLISTFILE)
    t0 = time.time()
    n = 0
    for tst in tests:
        n = n + 1
        try:
            cmd = SCRIPT + ' -interactive  false -pp_hex  true' + ' ' + LITMUSDIR + '/' + tst['tstname'] + '.litmus'
            #print(cmd)
            result = subprocess.run(shlex.split(cmd), stderr=subprocess.STDOUT, timeout=TIMEOUT, stdout=subprocess.PIPE)
            out = result.stdout.decode()
            #print(out)
            if out.find('forall') >= 0:
                # tracecount += int(parts_1[0])
                if out.find('Sometimes') >= 0:
                    tst['RMEM allow'] = True
                elif out.find('Always') >= 0:
                    tst['RMEM allow'] = False
                elif out.find('Never') >= 0:
                    tst['RMEM allow'] = True
                else:
                    tst['failure'] = 'RMEM'
            elif out.find('exists') >= 0:
                # tracecount += int(parts_1[0])
                assert (out.find('exists') >= 0)
                if out.find('Sometimes') >= 0:
                    tst['RMEM allow'] = True
                elif out.find('Always') >= 0:
                    tst['RMEM allow'] = True
                elif out.find('Never') >= 0:
                    tst['RMEM allow'] = False
                else:
                    tst['failure'] = 'RMEM'
            elif out.find('No such file') >= 0:
                tst['failure'] = 'RMEM did not find file'
            else:
                tst['failure'] = 'RMEM returns unrecognized results'
        except subprocess.CalledProcessError as e:
            #print(e)
            tst['failure'] = 'error in running RMEM'
        except subprocess.TimeoutExpired as e:
            #print(e)
            tst['failure'] = 'timeout'
        finally:
            print('{0:4}: '.format(n), end='')
            print(res_to_string(tst))
            logfile.write(res_to_string(tst) + '\n')
    runtime = time.time() - t0
    logfile.write('# Time: {0:.2f} s\n'.format(runtime))
    logfile.close()


runall()
