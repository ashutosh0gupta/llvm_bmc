"""

Changelog:
    2016.11.22  fix function to strip *.i input semantically
    2016.08.12  add option to show memory usage
    2015.07.10  changed KeyboardInterrupt handling (was not killing the backend on Ubuntu)
    2014.10.09  linemarkerinfo method
    2014.10.07  improved timeout management (Class Command: ctrl-C now kills the backend)

"""

import getopt, hashlib, sys, os.path, os

class colors:
    BLINK = '\033[5m'
    BLACK = '\033[90m'
    DARKRED = '\033[31m'
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    HIGHLIGHT = '\033[1m'
    FAINT = '\033[2m'
    UNDERLINE = '\033[4m'
    NO = '\033[0m'


def warn(string):
    tag = 'warning:'
    taglen = len(tag)+1
    print colors.YELLOW+tag+colors.NO,
    print ('\n'+' '*taglen).join([l for l in string.split('\n')])

''' Extract a specific parameter from the command-line
    without using getopt.

    Getopt does not support parsing parameters
    not defined beforehand,
    so this is useful when the whole set of parameters
    depend on one parameter.
'''
def extractparamvalue(args, shortopt, longopt, default):
    value = default

    # case 1: space after '-X' or '--XYZ'
    if shortopt in args:
        index = args.index(shortopt)
        if index+1 < len(args) and not args[index+1].startswith('-'):
            value = args[index+1]

    if longopt in args:
        index = args.index(longopt)
        if index+1 < len(args) and not args[index+1].startswith('-'):
            value = args[index+1]

    # case 2: no space after '-X' (note that longopts require a trailing space)
    for arg in args:
        if arg.startswith(shortopt) and len(arg)>2:
            value = arg[2:]

    return value


def replaceparamvalue(args, shortopt, longopt, old, new):
    # case 1: space after '-X' or '--XYZ'
    if shortopt in args:
        index = args.index(shortopt)
        if index+1 < len(args) and args[index+1] == old:
            args[index + 1] = new

    if longopt in args:
        index = args.index(longopt)
        if index+1 < len(args) and args[index+1] == old:
            args[index + 1] = new

    # case 2: no space after '-X' (note that longopts require a trailing space)
    for i, arg in enumerate(args):
        if arg.startswith(shortopt) and old in arg:
            args[i] = "-l" + new



''' strip()  -  Strips every line in the given string
                from the line with '_____STARTSTRIPPINGFROMHERE_____' as substring
                to the one with '_____STOPSTRIPPINGFROMHERE_____' as substring.

                Lines are identified by '\n'
'''
def strip(s):
    s2 = ''
    status = 0

    for line in s.split('\n'):
        if '_____STARTSTRIPPINGFROMHERE_____' in line:
            status = 1
            continue;


        if '_____STOPSTRIPPINGFROMHERE_____' in line:
            status = 2
            continue;

        if status == 0 or status == 2: s2 += line + '\n'

    return s2


'''
    strip()  -  Strips every line in the given string
                from the line with 'startmarker' as substring
                to the one with 'endmarker' as substring.

                Lines are identified by '\n'
'''
def strip2(s, startmarker='_____STARTSTRIPPINGFROMHERE_____', endmarker='_____STOPSTRIPPINGFROMHERE_____' ):
    s2 = ''
    status = 0

    for line in s:
        if line.startswith(startmarker) and status == 0:
            print "start marker found\n"
            status = 1
            continue;

        if line.endswith(endmarker) and line.startswith(startmarker) and status == 1:
            print "end marker found\n"
            status = 2
            continue;

        if status == 0 or status == 2: s2 += line + '\n'

    return s2


''' For now, we assume that if the input file contains "__attribute__ ((",
    it is in (.i) preprocessed format rather than in plain (.c) format.
'''
def isPreprocessed(filename):
    return fileContains(filename, "__attribute__ ((")


def has_smack_weirdo(filename):
    return fileContains(filename, " _whoop_init)(")


def getCPPLineDirective(line):
    '''
    Source file name and line number information is conveyed by lines of the form
        # linenum filename flags
    After the file name comes zero or more flags, which are 1, 2, 3, or 4.
    If there are multiple flags, spaces separate them. Here is what the flags mean:

    1     This indicates the start of a new file.
    2     This indicates returning to a file (after having included another file).
    3     This indicates that the following text comes from a system header file,
            so certain warnings should be suppressed.
    4     This indicates that the following text should be treated as being wrapped
            in an implicit extern "C" block.
    As an extension, the preprocessor accepts linemarkers in non-assembler input files.
    They are treated like the corresponding #line directive, (see Line Control),
    except that trailing flags are permitted, and are interpreted with the meanings
    described above. If multiple flags are given, they must be in ascending order.
    '''
    line = line.rstrip()   # remove end line symbol

    # 1st field: line number
    line = line[2:]
    marker_lineno = line[:line.find('"')-1]   # remove space
    if marker_lineno.isdigit(): marker_lineno = int(marker_lineno)
    else: return (-1, '', None)

    # 2nd field: source file
    line = line[line.find('"')+1:]
    marker_filename = line[:line.find('"')]

    # 3rd field: flag (optional)
    if line[-1].isdigit():
        line = line[line.find('"')+1:].strip()
        flags = line.split(" ")
        marker_flags = []
        for number in flags:
            if number.isdigit():
                marker_flags.append(int(number))
    else: marker_flags = None

    #print " LINENO: '%s'" % marker_lineno
    #print " FILE: '%s'" % marker_filename
    #print " FLAG: '%s'" % marker_flag
    #print "\n\n"

    return (marker_lineno, marker_filename, marker_flags)


def getIncludeFromLine(line, basename):
    ''' Extract information from line directive
        Return:
            includeType: type of include (system or user)
            includeFile: file name of include (compatible with include)
    '''
    includeType = 0
    includeFile = ''
    (marker_lineno, marker_filename, marker_flags) = getCPPLineDirective(line)
    if marker_lineno != -1:
        if marker_filename == basename:
            return (includeType, basename)

        if marker_lineno == 1 and marker_flags is not None:
            if 3 in marker_flags:
                includeType = 3
                includeFile = marker_filename[marker_filename.rfind("include/")+8:]
                includeFile = includeFile.replace('i386-linux-gnu/', '')        # remove architecture dependence
                includeFile = includeFile.replace('x86_64-linux-gnu/', '')
                fake_include = os.path.dirname(__file__)+'/include/'
                if not os.path.isfile(fake_include+includeFile):  # if this file is not in include
                    includeType = 0   # ignore that file
                    warn("%s not found" % includeFile)
            else:
                includeType = 2   # user header file
                includeFile = marker_filename

    return (includeType, includeFile)


def isReturnDirective(line, basename):
    ''' Determine if a line directive is a return directive from
    '''
    if not line.startswith('# '):
        return False

    (marker_lineno, marker_filename, marker_flags) = getCPPLineDirective(line)
    if marker_lineno == -1:
        return False
    if (marker_filename == basename and
            marker_flags is not None and
            len(marker_flags) == 1  and
            marker_flags[0] == 2
        ):
        return True
    else:
        return False


def stripIfNeeded(filename):
    stripped = False
    outputfilecontents = ''
    hassmackweirdo = has_smack_weirdo(filename)

    if isPreprocessed(filename):
        myfile = open(filename)
        allLines = list(myfile)

        if fileStartsWith(filename, '# '):
            # delete every line from the top of the file to
            # the very last line starting with '# '

            basename = os.path.basename(filename)
            basename = basename[:-2] + '.c'   # Assume that all .i file is obtained from .c file

            ''' Strip Algorithm Outline:
                Loop from the first line till the last line
                    Extract first line directive:
                        if this line is from the same file, move to the next line
                            1. If the next line is not a line directive:
                                -> Collect this line and move to next line
                            2. If the next line is a line directive:
                                a. if it is start of a new file:
                                    i. this file is in ignore list -> skip this line and move to next line
                                    ii. this file is a sys header -> skip until return directive, move to the line after
                                    iii. this file is a normal -> skip until return directive, move to the line after
                                b. if this line is not a start of a file,
                                    i. of the same file -> move to next line
                                    ii. of different file -> error in algorithm
                        else:
                            (no way!)

                Insert headerfile at the beginning of the file.
            '''
            includeFileList = []
            i = 0
            maxlinenumber = len(allLines)
            while i < maxlinenumber:
                if i == maxlinenumber - 1:
                    outputfilecontents += allLines[i]
                    break
                # print "line ", i, allLines[i], maxlinenumber
                if allLines[i].startswith("# "):
                    (marker_lineno, marker_filename, marker_flags) = getCPPLineDirective(allLines[i])
                    if marker_lineno == 1: # start of a file
                        if (marker_filename == basename or
                            marker_filename == '<built-in>' or
                            marker_filename == '<command-line>' or
                            marker_filename == '/usr/include/stdc-predef.h'
                            ):
                            i += 1
                            continue
                        else:
                            (includeType, includeFile) = getIncludeFromLine(allLines[i], basename)
                            if includeType == 2 or includeType == 3:   # system header or user header file
                                includeFileList.append((includeType, includeFile))
                            for j in range(i+1, maxlinenumber):
                                if isReturnDirective(allLines[j], basename): break
                            i = j
                            continue
                    elif marker_lineno > 1 and marker_filename == basename:
                            i += 1
                            continue
                    else:
                        print "Error: preprocessed file is not correct"
                        sys.exit(1)
                else:
                    outputfilecontents += allLines[i]
                    i += 1

            # Add headers to files
            includestr = ''
            for f in includeFileList:
                includestr += '#include <%s>\n' % (f[1]) if f[0] == 3 else '#include \"%s\"\n' % (f[1])

            if hassmackweirdo:
                includestr += '#include <smack_svcomp.h>\n'

            outputfilecontents = includestr + '\n' + outputfilecontents
            stripped = True

            # for i in range(len(allLines)):
            #     stillLinesWithDash = False

            #     # are there any more lines from the i-th on which start with '# '?
            #     for j in range(i, len(allLines)):
            #         if allLines[j].startswith('# '):
            #             stillLinesWithDash = True
            #             break

            #     if stillLinesWithDash == False:
            #         # copy all the remaining lines in a file
            #         outputfilecontents = '#include <stdio.h>\n' # force fake_include inclusion
            #         outputfilecontents += '#include <stdlib.h>\n' # force fake_include inclusion
            #         outputfilecontents += '#include <pthread.h>\n' # force fake_include inclusion
            #         if hassmackweirdo:
            #             outputfilecontents += '#include <smack_svcomp.h>\n'


            #         for j in range(i, len(allLines)):
            #             outputfilecontents += allLines[j]

            #         stripped = True
            #         break
        else:
            # delete every line from the top of the file to
            # the very last line starting with 'extern ',
            # then keep deleting until the fist line ending with ';' is reached

            lastSemiColonSeen = None

            for i in range(len(allLines)):
                # are there any more lines from the i-th on which start with 'extern '?
                stillLinesWithExtern = False

                for j in range(i, len(allLines)):
                    if allLines[j].startswith('extern '):
                        stillLinesWithExtern = True
                        lastSemiColonSeen = allLines[j].endswith(';\n')
                        ##print "LAST LINE: %s" % allLines[j]
                        break

                # once there are no more 'extern ' lines,
                # copy all the remaining lines in a file
                ##print "WAS LAST LINE TERMINATING?? %s" % lastSemiColonSeen
                ##print "\n\n"

                if stillLinesWithExtern == False:
                    outputfilecontents = '#include <stdio.h>\n'
                    outputfilecontents += '#include <stdlib.h>\n'
                    outputfilecontents += '#include <pthread.h>\n'
                    if hassmackweirdo:
                        outputfilecontents += '#include <smack_svcomp.h>\n'

                    lastStatementStripped = False # the last statement to strip can have multiple lines

                    for j in range(i, len(allLines)):
                        ##print "CHECKING LINE %s '%s'" % (j, allLines[j])

                        if not lastStatementStripped:   # skip until the first ';'
                            if not lastSemiColonSeen and not allLines[j].endswith(';\n'):
                                lastStatementStripped = True
                                continue

                        if ')) __attribute__ ((' not in allLines[j]:
                            outputfilecontents += allLines[j]

                    stripped = True
                    break

    return (stripped, outputfilecontents)


''' Extract a snippet of code from  string,
    lines from  linenumber-width  to  linenumber+width (when possible).

    Lines are trimmed down to the terminal column size
    when  trim  is set.

    Note: following compiler and editor conventions,
          line numbers start from 1, not zero!
'''
def snippet(string, linenumber, colnumber, width, trim=False):
    #return ### the 'while not finished' loop below may not terminate

    columnwidth = getTerminalSize()[1]
    splitinput = string.splitlines()

    #####print "input:\n%s\n" % len(splitinput)

    snippet = ''
    #return ''

    shiftedcolumns = 0

    #####print "linenumber=%s  colnumber=%s  width=%s  trim=%s" % (linenumber, colnumber, width, trim)

    # first and last line numbers of the snippet
    a = max(0, linenumber-width-1)
    b = min(len(splitinput), linenumber+width)

    #snippet += "see lines %s-%s below:\n" % (linenumber-width,linenumber+width)
    #snippet += ">  "+"-"*10 + '\n'

    # Convert tab to spaces
    for i in range(a,b):
        splitinput[i] = splitinput[i].replace('\t', ' ')  # each tab counts as a column in the parser

    # Get rid of all the empty spaces in common at the beginning to each line,
    # so to shift all the printed code to the left..
    finished = False

    while not finished:
        count = 0
        #####print "count: %s   -   finished: %s,   %s %s   shifted:%s" % (count, finished, a, b, shiftedcolumns)

        for i in range(a,b):
            if splitinput[i].startswith(' ') or splitinput[i] == '': count = count+1
            else: finished = True

        #print "count %s    -    len %s " % (count, len(range(a,b)))

        if count == len(range(a,b)):
            if count == 0: finished = True
            else:
                for i in range(a,b):
                    splitinput[i] = splitinput[i][1:]

                shiftedcolumns+=1

    # Concatenate the actual (possibly shortened) lines from parameter  string,
    # to make the snippet
    extraline = ''

    #for i in range(a,b):
    for i in range(a,linenumber):
        shiftedcolumns2 = 0

        if i+1 == linenumber:
            # shorten internally the line when it does not fit the terminal
            if colnumber-shiftedcolumns > int(columnwidth*0.9):
                splitinput[i] = splitinput[i][:int(columnwidth*0.1)] + ' ... ' + splitinput[i][colnumber-shiftedcolumns-int(columnwidth*0.6):]
                shiftedcolumns2 = colnumber - int(columnwidth*0.1) - int(columnwidth*0.6) - 5

            nextline = " >  %s" % (splitinput[i])
            pointer = '~~~^' if (colnumber-shiftedcolumns-shiftedcolumns2) > 4 else '^~~~'
            extraline = "   " + ' '*(colnumber-shiftedcolumns-shiftedcolumns2) + pointer
        else:
            nextline = "    %s" % (splitinput[i])

        if trim and len(nextline) > columnwidth:
            nextline = nextline[:int(columnwidth*0.9)] + '...'

        snippet += nextline + '\n'

        if extraline != '':
            snippet += extraline + '\n'
            extraline = ''

    return snippet


''' Extract linemarker information.

    Examples:
        linemarkerinfo('# 1 "<built-in>" 1')         -->  (1, '<built-in>', 1)
        linemarkerinfo('# 1 "<stdin>"')              -->  (1, '<stdin>', -1)
        linemarkerinfo('# 1 "include/pthread.h" 2')  -->  (1, 'include/pthread.h', 2)

   (for a description of linemarkers see:
    https://gcc.gnu.org/onlinedocs/gcc-4.3.6/cpp/Preprocessor-Output.html)

'''
def linemarkerinfo(marker):
    # linemarker format:  # LINENO FILE FLAG
    # (note  FLAG  is not mandatory)
    #
    #print "MARKER: '%s'" % marker

    line = marker

    # 1st field: line number
    line = line[2:]
    marker_lineno = line[:line.find('"')-1]
    if marker_lineno.isdigit(): marker_lineno = int(marker_lineno)
    else: return (-1, -1, -1)

    # 2nd field: source file
    line = line[line.find('"')+1:]
    marker_filename = line[:line.find('"')]

    # 3rd field: flag (optional)
    line = line[line.rfind(' ')+1:]
    if line.isdigit() and int(line) <=4 and int(line) >= 1: marker_flag = int(line)
    else: marker_flag = -1

    #print " LINENO: '%s'" % marker_lineno
    #print " FILE: '%s'" % marker_filename
    #print " FLAG: '%s'" % marker_flag
    #print "\n\n"

    return (marker_lineno, marker_filename, marker_flag)


''' Timeout management

 See:
   http://stackoverflow.com/questions/1191374/subprocess-with-timeout
   http://stackoverflow.com/questions/4789837/how-to-terminate-a-python-subprocess-launched-with-shell-true

'''
import shlex, signal, subprocess, threading, resource

class Command(object):
    status = None
    output = stderr = ''

    def __init__(self, cmdline):
        self.cmd = cmdline
        self.process = None

    def run(self, timeout):
        def target():
            # Thread started
            self.process = subprocess.Popen(self.cmd, shell=True, preexec_fn=os.setsid, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            self.output, self.stderr = self.process.communicate()
            # Thread finished

        thread = threading.Thread(target=target)

        try:
            thread.start()
            thread.join(timeout)

            if thread.is_alive():
                # Terminating process
                ###self.process.terminate()
                ##os.killpg(self.process.pid, signal.SIGTERM)
                # self.process.kill()
                os.killpg(self.process.pid, signal.SIGKILL)
                thread.join()
        except KeyboardInterrupt:
            # self.process.kill()
            os.killpg(self.process.pid, signal.SIGKILL)
        finally:
            os.chdir(os.path.dirname(sys.argv[0])) # change back to current dir

        memsize = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss
        return self.output, self.stderr, self.process.returncode, memsize


''' Short hash for quick file version comparison
'''
def shortfilehash(file):
    return hashlib.md5(open(file, 'rb').read()).hexdigest()[0:4].upper()


'''
'''
def shorthashstring(file):
    return hashlib.md5(string).hexdigest()[0:4].upper()


''' Reverse replace
'''
def rreplace(s, old, new, occurrence):
    li = s.rsplit(old, occurrence)
    return new.join(li)


''' Checks whether or not the given file exists
'''
def fileExists(filename):
    return True if os.path.isfile(filename) else False


''' Loads into an array of rows the content of a file, then returns it.
'''
def printFileRows(filename):
    rows = ''

    myfile = open(filename)
    lines = list(myfile)

    for line in lines:
        rows += line

    return rows


''' Loads in a string the content of a file, then returns it.
'''
def printFile(filename):
    if not os.path.isfile(filename):
        print "ERROR: printfile(%s): file does not exist.\n" % filename
        return

    in_file = open(filename, "r")
    text = in_file.read()
    in_file.close()

    return text


''' Remove file
'''
def removeFile(filename):
    import shutil
    shutil.rmtree(filename, ignore_errors=True)


''' Write to a file the contents of a string.
'''
def saveFile(filename, string):
    outfile = open(filename,"w")
    outfile.write(string)
    outfile.close()


'''
'''
def linesContain(string_lines, string):
    for line in string_lines:
        if string in line: return True

    return False


''' Return the number of lines (or of '\n's +1) in the given file.
'''
def fileLength(filename):
    with open(filename) as f:
        for i, l in enumerate(f): pass

    return i + 1


''' Check whether a file starts with 'string'
'''
def fileStartsWith(filename, string):
    if os.path.isfile(filename):
        myfile = open(filename)
        lines = list(myfile)

        if lines[0].startswith(string): return True
        else: return False

    else: return False

    return False


''' Check whether a file contains at least one occurrence of 'string' in any of its lines
'''
def fileContains(filename, string):
    if os.path.isfile(filename):
        myfile = open(filename)
        lines = list(myfile)

        for line in lines:
            if string in line: return True
    else: return False

    return False


def getTerminalSize():
    rows, columns = os.popen('stty size', 'r').read().split()
    return (int(rows), int(columns))


''' Convert string to number '''
def string_to_number(s):
    try:
        return int(s)
    except ValueError:
        try:
            return float(s)
        except ValueError:
            raise ValueError('argument is not a string of number')


import json


def parseConfig(inputfile):
    if not os.path.isfile(inputfile):
        raise Exception('Please input correct configuration file\n')
        sys.exit(2)

    input = open(inputfile)
    config = json.load(input)
    input.close()
    return config


def remove_line_markers(string):
    ret = ''
    for l in string.splitlines():
        if not (l.startswith("# ") and '<previous_module>' in l):
            ret += l
    return ret


def removeColumnFromCoord(coord):
    tmpList = str(coord).split(':')
    # print tmpList
    if len(tmpList) < 2:
        return str(coord)
    return ':' + tmpList[1]

