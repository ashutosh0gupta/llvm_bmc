""" CSeq C Sequentialization Framework
    backend feeder module
    written by Omar Inverso, University of Southampton.
    maintained by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'feeder-2017.02.01'     # CSeq 1.3 Release - Lazy Journal
# VERSION = 'feeder-2015.07.16'   # CSeq 1.0 Release - ASE2015
# VERSION = 'feeder-2015.07.03'   # now as a CSeq module
# VERSION = 'feeder-2015.07.02'   # removed intermediate stripping
# VERSION = 'feeder-2014.09.25'   # removed the 3rd party timeout tool (due to portability issues, especially not working well on OSX despite the latest fixes available around)
                                  # new timeout mechanism embedded in CSeq implemented from scratch using python multithread+subprocess management
# VERSION = 'feeder-2014.09.21'   # minor front-end adjustments
# VERSION = 'feeder-2014.06.03'   # front-end adjustments: default output is now more compact, for old-style output use -v
#VERSION = 'feeder-2014.03.10'
"""

Prerequisites:
    Input correctly instrumented for the specified backend.

TODO:
    - when the backend is not available, there should be an exception.

Changelog:
    2017.02.24  add smack backend
    2017.02.23  add UAutomizer backend
    2017.02.22  add CPA-Seq backend
    2017.02.10  add specific checks for esbmc backend
    2017.02.09  add specific checks for CBMC backend
    2016.10.07  add option to set backend path manually
    2016.08.19  add option to set output sequentialized file
    2016.08.12  add option to show memory usage
    2016.08.09  add backend framac
    2015.10.20  fix for backend and witness file
    2015.07.19  fix for backend llbmc and klee (Truc)
    2015.07.03  1st version, codebase inherited from cseq-feeder.py (feeder-2015.07.02)
"""

import os, sys, getopt, time, signal, subprocess, shlex
from threading import Timer
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.module, core.parser, core.utils
from core.module import ModuleError

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

                  Options and Parameters below.

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
# Name of the executable file to run, by backend.
backendFilename = {}
backendFilename['esbmc'] = 'esbmc'
backendFilename['cbmc'] = 'cbmc'
backendFilename['llbmc'] = 'llbmc'
backendFilename['blitz'] = 'blitz'
backendFilename['satabs'] = 'satabs'
# backendFilename['2ls'] = 'summarizer'
backendFilename['klee'] = 'klee'
backendFilename['cpachecker'] = './backends/CPAchecker-1.6.12-svcomp17-unix/scripts/cpa.sh'
# backendFilename['framac'] = './backends/framac/cde-package/cde-exec \'frama-c\''    # For sv-comp only
backendFilename['framac'] = 'frama-c'
# backendFilename['spin'] = 'spin'
backendFilename['smack'] = './smack.sh.cde'
backendFilename['uautomizer'] = './Ultimate.py'

# Command-line parameters, by backend.
cmdLineOptions = {}
cmdLineOptions['esbmc'] = ' --unwind 1 --no-unwinding-assertions --32 --clang-frontend -I core/include/esbmc/ '
cmdLineOptions['cbmc'] = '  --unwind 1 --no-unwinding-assertions --32 ' # For the competition
cmdLineOptions['llbmc'] = ' -no-max-function-call-depth-checks -no-memory-free-checks -no-shift-checks -no-memcpy-disjoint-checks -no-memory-access-checks -no-memory-allocation-checks --max-loop-iterations=1 --no-max-loop-iterations-checks --ignore-missing-function-bodies -no-overflow-checks -no-div-by-zero-checks'
cmdLineOptions['blitz'] = '  --terminate-on-firstbug '
cmdLineOptions['satabs'] = ' '
# cmdLineOptions['2ls'] = ' '
cmdLineOptions['klee'] = ' -exit-on-error '
cmdLineOptions['cpachecker'] = ' -preprocess -heap 15000M -timelimit 86400 -noout -predicateAnalysis '
cmdLineOptions['framac'] = ' -val -no-val-show-initial-state -no-val-show-progress -memexec-all -no-unicode '
cmdLineOptions['uautomizer'] = ' ALL.prp 32bit '
cmdLineOptions['smack'] = ' -q '

# Command-line parameters, by backend - when no sequentialisation is performed.
cmdLineOptionsNOSEQ = {}
cmdLineOptionsNOSEQ['esbmc'] = ' --32 --clang-frontend '
cmdLineOptionsNOSEQ['cbmc'] = '  '
cmdLineOptionsNOSEQ['llbmc'] = ' -no-max-function-call-depth-checks -no-memory-free-checks -no-shift-checks -no-memcpy-disjoint-checks -no-memory-access-checks -no-memory-allocation-checks --ignore-missing-function-bodies -no-overflow-checks -no-div-by-zero-checks '
# cmdLineOptionsNOSEQ['blitz'] = '  --terminate-on-firstbug '   # No support concurrency
cmdLineOptionsNOSEQ['satabs'] = ' '
# cmdLineOptionsNOSEQ['2ls'] = ' '     # no concurrency support
cmdLineOptionsNOSEQ['smack'] = ' --pthread '
cmdLineOptionsNOSEQ['klee'] = ' '
# cmdLineOptionsNOSEQ['uautomizer'] = ' Reach.prp 32bit '
# cmdLineOptionsNOSEQ['cpachecker'] = ' -preprocess -heap 15000M -timelimit 86400 -noout -predicateAnalysis '  # No support concurrency
# cmdLineOptionsNOSEQ['framac'] = ' -val -no-val-show-initial-state -no-val-show-progress -memexec-all -no-unicode '


class feeder(core.module.BasicModule):
    verbose = False

    def init(self):
        self.addInputParam('backend', 'backend selection', 'b', 'cbmc', False)
        self.addInputParam('path-backend', 'path to backend (only for cbmc backends)', 'p', '', True)
        # self.addInputParam('show', 'show sequentialized file without analyzing', '', False, True)
        self.addInputParam('time', 'analysis time limit (in seconds)', 't', '86400', False)
        self.addInputParam('llvm', 'clang or llvm search path (only for llbmc, klee backends)', 'p', '', True)
        self.addInputParam('depth', 'limit search depth', 'd', '0', False)   # depth parameter for the competition
        self.addInputParam('slevel', 'semantic level of Frama-C', 'l', '0', False)   # depth parameter for the competition
        self.addInputParam('output', 'output sequentialized file', 'o', '', True)
        self.addInputParam('witness', 'output counterexample from backend', 'w', '', True) # parameter for witness

        self.addInputParam('backend-engine', 'engine (solver) of backend', 's', '', True)

        # Specific option for CBMC
        self.addInputParam('stop-on-fail', 'stop analysis once a failed property is detected', '', None, True)  # only for 5.5+ version
        self.addInputParam('bounds-check', 'enable array bounds checks', '', None, True)
        self.addInputParam('div-by-zero-check', 'enable division by zero checks', '', None, True)
        self.addInputParam('pointer-check', 'enable pointer checks', '', None, True)
        self.addInputParam('memory-leak-check', 'enable memory leak checks', '', None, True)
        self.addInputParam('signed-overflow-check', 'enable arithmetic over- and underflow checks of signed integer', '', None, True)
        self.addInputParam('unsigned-overflow-check', 'enable arithmetic over- and underflow checks of unsigned integer', '', None, True)
        self.addInputParam('float-overflow-check', 'check floating-point for +/-Inf', '', None, True)
        self.addInputParam('nan-check', 'check floating-point for NaN', '', None, True)
        # cbmc hidden options
        self.addInputParam('no-simplify', 'no simplification from cbmc', '', None, True)
        self.addInputParam('refine-arrays', 'array refinement from cbmc', '', None, True)

        # Specific option for esbmc
        # self.addInputParam('no-bounds-check', 'do not do array bounds check', '', None, True)
        # self.addInputParam('no-div-by-zero-check', 'do not do division by zero check', '', None, True)
        # self.addInputParam('no-pointer-check', 'do not do pointer check', '', None, True)
        self.addInputParam('overflow-check', 'enable arithmetic over- and underflow check', '', None, True)

        self.addOutputParam('exitcode')
        self.addOutputParam('memsize')

    def loadfromstring(self, string, env):
        # if self.getInputParamValue('show') is not None:
        #   self.output = string
        #   return

        depth = int(self.getInputParamValue('depth'))
        slevel = int(self.getInputParamValue('slevel'))
        timelimit = self.getInputParamValue('time')
        backend = self.getInputParamValue('backend')
        pathbackend = self.getInputParamValue('path-backend')
        witness = self.getInputParamValue('witness')

        engine = self.getInputParamValue('backend-engine')

        # Specific option for backend
        backendOpt = {}
        backendOpt['stop-on-fail'] = True if self.getInputParamValue('stop-on-fail') is not None else False
        backendOpt['bounds-check'] =  True if self.getInputParamValue('bounds-check') is not None else False
        backendOpt['div-by-zero-check'] =  True if self.getInputParamValue('div-by-zero-check') is not None else False
        backendOpt['pointer-check'] =  True if self.getInputParamValue('pointer-check') is not None else False
        backendOpt['memory-leak-check'] =  True if self.getInputParamValue('memory-leak-check') is not None else False
        backendOpt['signed-overflow-check'] =  True if self.getInputParamValue('signed-overflow-check') is not None else False
        backendOpt['unsigned-overflow-check'] =  True if self.getInputParamValue('unsigned-overflow-check') is not None else False
        backendOpt['float-overflow-check'] =  True if self.getInputParamValue('float-overflow-check') is not None else False
        backendOpt['nan-check'] =  True if self.getInputParamValue('nan-check') is not None else False
        backendOpt['overflow-check'] =  True if self.getInputParamValue('overflow-check') is not None else False

        '''
        if shutil.which(backendFilename[format]) is None:
            raise ModuleError("unable to find the given backend (%s)" % backendFilename[backend])
            sys.exit(2)
        '''

        seqfile = core.utils.rreplace(env.inputfile, '/', '/_cs_', 1) if '/' in env.inputfile else '_cs_' + env.inputfile

        if env.outputfile is not None and env.outputfile != '':
            seqfile = env.outputfile

        logfile = seqfile + '.' + backend + '.log' if witness is None else witness

        core.utils.saveFile(seqfile, string)

        ''' Run the verification tool on the input file '''
        # if self.verbose: print "output: %s" % (seqfile)
        timeBeforeCallingBackend = time.time()    # save wall time

        exe = backendFilename[backend]

        if pathbackend is not None and pathbackend != '' and backend == 'cbmc':
            exe = pathbackend

        currentpath = os.getcwd()
        # currentworkingdir = os.path.dirname(sys.argv[0])
        # print currentworkingdir, currentpath

        # Add extra parameter to backend
        if backend == 'esbmc':
            cmdline = exe + cmdLineOptions[backend] + seqfile
            if depth != 0:
                cmdline += ' --depth %s ' % str(depth)
            if backendOpt['overflow-check']:
                cmdline += ' --overflow-check '
            if not backendOpt['bounds-check']:
                cmdline += ' --no-bounds-check '
            if not backendOpt['div-by-zero-check']:
                cmdline += ' --no-div-by-zero-check '
            if not backendOpt['pointer-check']:
                cmdline += ' --no-pointer-check '
            if engine is not None and engine != '':
                cmdline += ' --%s ' % engine
        elif backend == 'cbmc':
            cmdline = exe + cmdLineOptions[backend] + seqfile
            if depth != 0:
                cmdline += ' --depth %s ' % str(depth)
            for key in backendOpt:
                if backendOpt[key]:
                    cmdline += ' --%s' % key
        elif backend == 'llbmc':
            # llbmc and clang need to be match
            clangpath = '' if self.getInputParamValue('llvm') is None else self.getInputParamValue('llvm')
            clangexe = clangpath + '/clang' if clangpath != '' else 'clang'
            cmdline = "%s -c -g -I. -emit-llvm %s -o %s.bc 2> %s " % (clangexe, seqfile, seqfile[:-2], logfile)
            p = subprocess.Popen(cmdline, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = p.communicate()
            if env.debug:
                core.utils.saveFile(os.path.dirname(seqfile) + '/clang_stdout.log', out)
                core.utils.saveFile(os.path.dirname(seqfile) + '/clang_stderr.log', err)
            # Launch llbmc
            cmdline = exe + ' ' + cmdLineOptions[backend] + ' ' + seqfile[:-2] + '.bc'
        elif backend == 'blitz':
            cmdline = exe + cmdLineOptions[backend] + seqfile
            if depth != 0:
                cmdline += ' --depth %s ' % str(depth)
        elif backend == 'satabs':
            cmdline = exe + cmdLineOptions[backend] + seqfile
        elif backend == '2ls':
            cmdline = exe + cmdLineOptions[backend] + seqfile
        elif backend == 'klee':
            # klee needs llvm-gcc version 3.4
            clangpath = '' if self.getInputParamValue('llvm') is None else  self.getInputParamValue('llvm')
            clangexe = clangpath + '/clang' if clangpath != '' else 'clang'
            cmdline = "%s -c -g -emit-llvm %s -o %s.bc " % (clangexe, seqfile, seqfile[:-2])
            # print "CLANG: %s" % cmdline
            p = subprocess.Popen(cmdline, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = p.communicate()
            if env.debug:
                core.utils.saveFile(os.path.dirname(seqfile) + '/clang_stdout.log', out)
                core.utils.saveFile(os.path.dirname(seqfile) + '/clang_stderr.log', err)
            cmdline = exe + ' ' + cmdLineOptions[backend] + ' ' + seqfile[:-2] + '.bc'
        elif backend == 'framac':
            cmdline = exe + cmdLineOptions[backend] + seqfile
            if slevel != 0:
                cmdline += ' -slevel %s ' % str(slevel)
        elif backend == 'cpachecker':
            cmdline = exe + cmdLineOptions[backend] + seqfile
        elif backend == 'uautomizer':
            # UAutomizer require special treatment
            cmdline = exe + cmdLineOptions[backend] + os.path.abspath(seqfile)
            os.chdir(currentpath + '/backends/UAutomizer-linux')
        elif backend == 'smack':
            # smack require special treatment
            cmdline = exe + cmdLineOptions[backend]
            if engine is not None and engine != '':
                cmdline += ' --verifier %s ' % engine
            else:
                cmdline += ' --verifier corral '
            cmdline += os.path.basename(seqfile)
            os.chdir(currentpath + '/backends/smack/cde-package/cde-root/home/trucnguyenlam/Downloads/smack-1.7.1-64/')
            core.utils.saveFile(os.path.basename(seqfile), string)

        # handling of memory and time restrictions
        #
        # `-t T` - set up CPU+SYS time limit to T seconds
        # `-m M` - set up virtual memory limit to M kilobytes
        '''
        memorylimit = 1000*memorylimit # kBytes --> mBytes
        timespacecheck = 'timeout/timeout'
        if timelimit > 0: timespacecheck += ' -t %s' % (timelimit)
        if memorylimit > 0: timespacecheck += ' -m %s' % (memorylimit)
        '''

        if env.debug:
            self.log(str(cmdline))

        command = core.utils.Command(cmdline)
        out, err, code, memsize = command.run(timeout=int(timelimit))   # store stdout, stderr, process' return value

        if backend in ('uautomizer', 'smack'):
            os.chdir(currentpath)

        self.setOutputParam('exitcode', code)
        self.setOutputParam('memsize', memsize)

        if env.debug:
            if 'warning' in err:
                self.warn('warnings on stderr from the backend')
                core.utils.saveFile(seqfile + '.' + backend + '.warn', err)

        if backend == 'smack':
            core.utils.saveFile(logfile, out+err)
            self.output = out+err
        elif backend == 'klee':
            core.utils.saveFile(logfile, err)
            self.output = err
        else:
            core.utils.saveFile(logfile, out)   # klee outputs errors to stdout, all other backends to stderr
            core.utils.saveFile(seqfile + '.' + backend + '.log', out)   # klee outputs errors to stdout, all other backends to stderr
            # core.utils.saveFile(seqfile + '.' + backend + '.err', err)   # klee outputs errors to stdout, all other backends to stderr
            self.output = out
