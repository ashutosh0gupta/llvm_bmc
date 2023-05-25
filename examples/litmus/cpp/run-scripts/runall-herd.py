#!/usr/bin/python3

# Copyright (C) 2023 Tuan Phong Ngo
# Run all litmus tests under ARM semantics with Herd7.

import datetime
import subprocess
import sys
import tempfile
import os
import time
import shlex

curDir = os.getcwd()
AARCH64_CATFILE = curDir + '/../aarch64.cat'
LITMUSDIR = curDir + '/../original/alltests'
OUTPUTTFILE = curDir + '/../aarch64.herd.results.txt'
LISTFILE = curDir + '/../listfile.txt'
HERDBIN = 'herd7'
MODEL = '-model'
TIMEOUT = 120  # 120 = 2 minutes


def get_expected(fname):
    f = open(fname, 'r')
    l = []
    for ln in f:
        ln = ln.strip()
        if len(ln) and not (ln[0] == '#'):
            segments = ln.split('.')
            del segments[-1]
            tst = '.'.join(segments)
            l.append({'tstname': tst})
    f.close()
    return l


def res_to_string(tst):
    s = tst['tstname'] + ' '
    if not ('herd allow' in tst):
        s = s + 'FAILURE: '
        if 'failure' in tst:
            s = s + tst['failure']
        else:
            s = s + '(unknown)'
        return s
    if tst['herd allow']:
        s = s + 'Allow'
    else:
        s = s + 'Forbid'
    return s


def runallherd():
    logfile = open(OUTPUTTFILE, 'w')
    logfile.write('# Results of applying herd to all litmus tests with "exists" conditions.\n')
    logfile.write('# \n')
    # print(HERDBIN + ' -version')
    version = subprocess.check_output([HERDBIN, '-version'], stderr=subprocess.STDOUT).decode()
    logfile.write('# herd: ' + version)
    logfile.write('# herd -model aarch64.cat TEST.litmus \n')
    logfile.write('#\n')
    logfile.write('# Tests where "Always" or "Sometimes" with "exists" was observed are marked "Allow".\n')
    logfile.write('# Tests where "Never" with "exists" was observed are marked "Forbid".\n')
    logfile.write('# Tests where "Always" with "forall" was observed are marked "Allow".\n')
    logfile.write('# Tests where "Sometimes" or "Never" with "forall" was observed are marked "Forbid".\n')
    logfile.write('# \n')
    logfile.write('# The tests where executed using runall-herd.py.\n')
    logfile.write('# Date: ' + datetime.datetime.now().strftime('%y%m%d-%H:%M') + '\n')
    logfile.write('\n')
    # tracecount = 0
    tests = get_expected(LISTFILE)
    n = 0
    t0 = time.time()
    for tst in tests:
        n = n + 1
        try:
            cmd = HERDBIN + ' ' + MODEL + ' ' + AARCH64_CATFILE + ' ' +  LITMUSDIR + '/' + tst['tstname'] + '.litmus'
            #print(cmd)
            result = subprocess.run(shlex.split(cmd), stderr=subprocess.STDOUT, timeout=TIMEOUT, stdout=subprocess.PIPE)
            out = result.stdout.decode()
            #out = subprocess.check_output(
            #    [HERDBIN, MODEL, AARCH64_CATFILE, '-candidates', 'true', LITMUSDIR + '/' + tst['tstname'] + '.litmus'],
            #    stderr=subprocess.STDOUT, timeout=TIMEOUT).decode()
            # print(out)
            # parts_0 = out.split(" ")
            # parts_1 = parts_0[-1].split("\n")
            # print(parts_0[-1])

            if out.find('forall') >= 0:
                # tracecount += int(parts_1[0])
                if out.find('Sometimes') >= 0:
                    tst['herd allow'] = True
                elif out.find('Always') >= 0:
                    tst['herd allow'] = False
                elif out.find('Never') >= 0:
                    tst['herd allow'] = True
                else:
                    tst['failure'] = 'herd'
            elif out.find('exists') >= 0:
                # tracecount += int(parts_1[0])
                assert (out.find('exists') >= 0)
                if out.find('Sometimes') >= 0:
                    tst['herd allow'] = True
                elif out.find('Always') >= 0:
                    tst['herd allow'] = True
                elif out.find('Never') >= 0:
                    tst['herd allow'] = False
                else:
                    tst['failure'] = 'herd'
            else:
                tst['failure'] = 'herd'
        except subprocess.CalledProcessError:
            tst['failure'] = 'herd'
            #            print('{0:4}: '.format(n),end='')
            #            print(res_to_string(tst))
            #            logfile.write(res_to_string(tst)+'\n')
            continue
        except subprocess.TimeoutExpired:
            tst['failure'] = 'herd'
        finally:
            print('{0:4}: '.format(n), end='')
            print(res_to_string(tst))
            logfile.write(res_to_string(tst) + '\n')
    runtime = time.time() - t0
    logfile.write('# Time: {0:.2f} s\n'.format(runtime))
    logfile.close()


runallherd()
