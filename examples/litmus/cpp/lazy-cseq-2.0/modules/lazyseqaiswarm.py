""" Lazy-CSeq Sequentialization module (for Framac)
    (swarm version of the corresponding name module)
    maintained by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'lazyseqaiswarm-0.1-2016.09.14'

"""

Transformation:
    special transformation for AbstractInterpretation Tool
    Support:
        frama-c

Prerequisites:
    - all functions should have been inlined, except the main(), all thread functions, all __CSEQ_atomic_ functions, and function __CSEQ_assert
    - all loops should habe been unrolled
    - no two threads refers to the same thread function (use module duplicator.py)

TODO:
    - Handling decompose option for Frama-C

Changelog:
    2017.08.17  preserve __cs_exit function (not overriding with STOP_*VOID)
    2016.11.22  fix problem with function pointer reference (smacker benchmarks)
    2016.09.21  fix small bug that causes the injection of GUARD in atomic function
    2016.08.16  change __cs_pc compose version to only only one variable
    2016.08.10  Initial version from lazycseqnewschedule.py (same date)

"""
import math, re
from time import gmtime, strftime
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.common, core.module, core.parser, core.utils


class lazyseqaiswarm(core.module.Translator):
    __lines = {}                     # lines for each thread
    __threadName = ['main']          # name of threads, as they are found in pthread_create(s) - the threads all have different names
    __threadIndex = {}               # index of the thread = value of threadcount when the pthread_create to that thread was discovered
    __threadCount = 0                # pthread create()s found so far

    __labelLine = {}                 # statement number where labels are defined [function, label]
    __gotoLine = {}                  # statement number where goto to labels appear [function, label]
    __maxInCompound = 0              # max label within a compound
    __labelLength = 55               # for labels to have all the same length, adding padding when needed
    __startChar = 't'                # special char to distinguish between labeled and non-labelled lines

    __stmtCount = -1                 # thread statement counter (to build thread labels)

    __currentThread = ''             # name of the current thread (also used to build thread labels)

    __threadbound = 0                # bound on the number of threads

    __firstThreadCreate = False      # set once the first thread creation is met
    __globalMemoryAccessed = False   # used to limit context-switch points (when global memory is not accessed, no need to insert them)

    __first = False
    __atomic = False                 # no context-switch points between atomic_start() and atomic_end()

    _bitwidth = {}                   # custom bitwidth for specific int variables, e.g. ['main','var'] = 4

    _deadlockcheck = False

    __decomposepc = False             # decompose pc

    __bigswitch = False

    __showThreadLines = False

    __visit_funcReference = False

    def init(self):
        self.addInputParam('rounds', 'round-robin schedules', 'r', '1', False)
        self.addInputParam('threads', 'max no. of thread creations (0 = auto)', 't', '0', False)
        self.addInputParam('deadlock', 'check for deadlock', '', default=False, optional=True)
        self.addInputParam('decomposepc', 'use seperate variable for each pc', '', default=False, optional=True)
        self.addInputParam('robin', 'use round robin schedule', '', default=False, optional=True)
        self.addInputParam('bigswitch', 'use bigswitch in the beginning of each thread', '', default=False, optional=True)

        self.addOutputParam('bitwidth')
        self.addOutputParam('header')


    def loadfromstring(self, string, env):
        if self.getInputParamValue('deadlock') is not None:
            self._deadlockcheck = True

        threads = int(self.getInputParamValue('threads'))
        rounds = int(self.getInputParamValue('rounds'))
        backend = self.getInputParamValue('backend')
        if self.getInputParamValue('decomposepc') is not None:
            self.__decomposepc = True

        if self.getInputParamValue('bigswitch') is not None:
            self.__bigswitch = True

        self.__threadbound = threads

        # swarm
        self.__intervals = {}         # Intervals for each thread
        self.__currInterval = []      # Current intervals of a thread for this module
        self.__realStmtCount = -1     # real statement counter to

        self.__showThreadLines = env.contextswitch

        self.__intervals = env.intervals if hasattr(env, 'intervals') else {}

        super(self.__class__, self).loadfromstring(string, env)

        # Add the new main().
        if self.__decomposepc:
            self.output += self.__createMainRoundRobinDecomposePC(rounds)
        else:
            self.output += self.__createMainRoundRobin(rounds)

        # Insert the thread sizes (i.e. number of visible statements).
        lines = ''

        i = maxsize = 0

        for t in self.__threadName:
            if i <= self.__threadbound:
                if i>0: lines += ', '
                lines += str(self.__lines[t])
                maxsize = max(int(maxsize), int(self.__lines[t]))
                #print "CONFRONTO %s %s " % (int(maxsize), int(self.__lines[t]))
            i +=1

        ones = ''
        if i <= self.__threadbound:
            if i>0: ones += ', '
            ones += '-1'
        i +=1

        # Generate the header.
        #
        # the first part is not parsable (contains macros)
        # so it is passed to next module as a header...
        if self.__decomposepc:
            header = core.utils.printFile('modules/lazyseqAaidecomposepc.c')
        else:
            header = core.utils.printFile('modules/lazyseqAai.c')
        header = header.replace('<insert-maxthreads-here>',str(threads))
        header = header.replace('<insert-maxrounds-here>',str(rounds))
        self.setOutputParam('header', header)

        i = 0
        pc_decls = ''
        pc_cs_decls = 'unsigned int __cs_pc_cs;\n'
        join_replace = ''
        for t in self.__threadName:
            if i <= self.__threadbound:
                threadsize = self.__lines[t]
                k = int(math.floor(math.log(threadsize,2)))+1
                pc_decls += 'unsigned int __cs_pc_%s;\n' % i
                self._bitwidth['','__cs_pc_%s' % i] = k
                join_replace += 'if (__cs_id == %s) __CSEQ_assume(__cs_pc_%s == __cs_thread_lines[%s]);\n' % (i, i, i)
            i += 1
        join_replace += 'if (__cs_id >= %s) __CSEQ_assume(0);\n' % (i)

        # ..this is parsable and is added on top of the output code,
        # as next module is able to parse it.
        if not self._deadlockcheck:
            if self.__decomposepc:
                header = core.utils.printFile('modules/lazyseqBnewscheduledecomposepc.c').replace('<insert-threadsizes-here>',lines)
                header = header.replace('<insert-pc-decls-here>', pc_decls + pc_cs_decls)
                header = header.replace('<insert-join_replace-here>', join_replace)
                header = header.replace('<insert-numthreads-here>', str(threads+1))
            else:
                header = core.utils.printFile('modules/lazyseqBainewschedule.c').replace('<insert-threadsizes-here>',lines)
                header = header.replace('<insert-numthreads-here>', str(threads+1))
        else:
            header = core.utils.printFile('modules/lazyseqBdeadlock.c').replace('<insert-threadsizes-here>',lines)
            header = header.replace('<insert-all1-here>',  ones)

        self.insertheader(header)

        # Calculate exact bitwidth size for a few integer control variables of the seq. schema,
        # good in case the backend handles bitvectors.
        self._bitwidth['','__cs_active_thread'] = 1
        k = int(math.floor(math.log(maxsize,2)))+1
        if self.__decomposepc is False:
            self._bitwidth['','__cs_pc'] = k
            self._bitwidth['','__cs_pc_cs'] = k+1

        self._bitwidth['','__cs_thread_lines'] = k

        k = int(math.floor(math.log(self.__threadbound,2)))+1
        self._bitwidth['','__cs_last_thread'] = k
        self._bitwidth[core.common.changeID['pthread_mutex_lock'],'__cs_thread_index'] = k
        self._bitwidth[core.common.changeID['pthread_mutex_unlock'],'__cs_thread_index'] = k

        self.setOutputParam('__cs_bitwidth', self._bitwidth)

        # Fix gotos by inserting ASS_GOTO(..) blocks before each goto,
        # excluding gotos which destination is the line below.
        for (a,b) in self.__labelLine:
            if (a,b) in self.__gotoLine and (self.__labelLine[a,b] == self.__gotoLine[a,b]+1):
                self.output = self.output.replace('<%s,%s>' % (a,b), '')
            else:
                self.output = self.output.replace('<%s,%s>' % (a,b), 'ASS_GOTO(%s)' % self.__labelLine[a,b])

        self.setOutputParam('bitwidth', self._bitwidth)


    def visit_Decl(self,n,no_type=False):
        # no_type is used when a Decl is part of a DeclList, where the type is
        # explicitly only for the first declaration in a list.
        #
        s = n.name if no_type else self._generate_decl(n)

        if n.bitsize: s += ' : ' + self.visit(n.bitsize)
        if n.init:
            s += ' = ' + self._visit_expr(n.init)

        # Disable redeclaration of nondet
        if n.name and n.name.startswith('__VERIFIER_nondet_'):
            s = '_Bool %s_already_defined' % n.name

        return s


    def showThreadLines(self):
        print "Number of context-switch of each thread:"
        for t in self.__threadName:
            if t in self.__lines:
                print t, ':', str(self.__lines[t])
            else:
                self.error('This thread %s is misinterpreted' % t)
        import sys
        sys.exit(0)


    def visit_Compound(self, n):
        s = self._make_indent() + '{\n'
        self.indent_level += 1

        # Insert the labels at the beginning of each statement,
        # with a few exclusions to reduce context-switch points...
        #
        if n.block_items:
            for stmt in n.block_items:
                # Case 1: last statement in a thread (must correspond to last label)
                if type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == core.common.changeID['pthread_exit']: ##if type(stmt) == pycparser.c_ast.FuncCall and self._parenthesize_unless_simple(stmt.name) == core.common.changeID['pthread_exit']:
                    self.__stmtCount += 1
                    self.__realStmtCount += 1
                    self.__maxInCompound = self.__realStmtCount
                    stamp = '__CSEQ_rawline("%s%s_%s: ");\n' % (self.__startChar, self.__currentThread, str(self.__realStmtCount))
                    code = self.visit(stmt)

                    returnStr = ''
                    if self.Parser.funcBlockOut[self.__currentThread] != 'void':
                        returnStr = 'STOP_NONVOID(%s)' % (self.__realStmtCount)
                    else:
                        returnStr = 'STOP_VOID(%s)' % (self.__realStmtCount)
                    newStmt =  stamp + code + ';' + returnStr + ";\n"

                    s += newStmt
                # Case 2: labels
                elif (type(stmt) in (pycparser.c_ast.Label,)):
                    # --1-- Simulate a visit to the stmt block to see whether it makes any use of pointers or shared memory.
                    #
                    globalAccess = self.__globalAccess(stmt)
                    newStmt = ''

                    # --2-- Now rebuilds the stmt block again,
                    #       this time using the proper formatting
                    #      (now we know if the statement is accessing global memory,
                    #       so to insert the stamp at the beginning when needed)
                    #
                    if not self.__atomic and self.__realStmtCount == -1:   # first statement in a thread
                        self.__stmtCount += 1
                        self.__realStmtCount += 1
                        self.__maxInCompound = self.__realStmtCount
                        threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
                        stamp = '__CSEQ_rawline("%s%s_%s: IF(%s,%s,%s%s_%s)");\n' % (self.__startChar, self.__currentThread, self.__realStmtCount,threadIndex,str(self.__realStmtCount), self.__startChar, self.__currentThread, str(self.__realStmtCount+1))
                        code = self.visit(stmt.stmt)
                        newStmt = stamp + code + ';\n'
                    elif (not self.__visit_funcReference  and (
                        (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == '__CSEQ_atomic_begin') or
                        (not self.__atomic and
                            (globalAccess or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == core.common.changeID['pthread_create']) or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == core.common.changeID['pthread_join']) or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name.startswith('__CSEQ_atomic') and not stmt.name.name == '__CSEQ_atomic_end') or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name.startswith('__CSEQ_assume')) or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == '__cs_cond_wait_2')
                            )
                        )
                        )):
                        self.__stmtCount += 1
                        # Check if this statement in the interval
                        if self._in_interval(self.__stmtCount, self.__currInterval) or self.__realStmtCount == -1:
                            self.__realStmtCount += 1
                            self.__maxInCompound = self.__realStmtCount
                            threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
                            stamp = '__CSEQ_rawline("%s%s_%s: IF(%s,%s,%s%s_%s)");\n' % (self.__startChar, self.__currentThread, str(self.__realStmtCount),threadIndex,str(self.__realStmtCount), self.__startChar, self.__currentThread, str(self.__realStmtCount+1))
                            newStmt = stamp + self.visit(stmt.stmt) + ';\n'
                        else:
                            newStmt = self.visit(stmt.stmt) + ';\n'
                    else:
                        newStmt = self.visit(stmt.stmt) + ';\n'

                    threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
                    # GUARD(%s,%s)
                    guard = ''
                    if not self.__atomic:
                        guard = '__CSEQ_assume( __cs_pc_cs >= %s );\n' % (self.__realStmtCount+1)
                    newStmt = self._make_indent()+ stmt.name + ': ' + guard + newStmt+ '\n'

                    s += newStmt
                # Case 3: all the rest....
                elif (type(stmt) not in (pycparser.c_ast.Compound, pycparser.c_ast.Goto, pycparser.c_ast.Decl)
                    and not (self.__currentThread=='main' and self.__firstThreadCreate == False) or (self.__currentThread=='main' and self.__realStmtCount == -1)) :

                    # --1-- Simulate a visit to the stmt block to see whether it makes any use of pointers or shared memory.
                    #
                    globalAccess = self.__globalAccess(stmt)
                    newStmt = ''

                    self.lines = []   # override core.module marking behaviour, otherwise  module.visit()  won't insert any marker

                    # --2-- Now rebuilds the stmt block again,
                    #       this time using the proper formatting
                    #      (now we know if the statement is accessing global memory,
                    #       so to insert the stamp at the beginning when needed)
                    #
                    if not self.__atomic and self.__realStmtCount == -1:   # first statement in a thread
                        self.__stmtCount += 1
                        self.__realStmtCount += 1
                        self.__maxInCompound = self.__realStmtCount
                        threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
                        stamp = '__CSEQ_rawline("%s%s_%s: IF(%s,%s,%s%s_%s)");\n' % (self.__startChar, self.__currentThread, self.__realStmtCount,threadIndex,str(self.__realStmtCount), self.__startChar, self.__currentThread, str(self.__realStmtCount+1))
                        code = self.visit(stmt)
                        newStmt = stamp + code + ';\n'
                    elif (not self.__visit_funcReference and (
                        (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == '__CSEQ_atomic_begin') or
                        (not self.__atomic and
                            (globalAccess or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == core.common.changeID['pthread_create']) or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == core.common.changeID['pthread_join']) or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name.startswith('__CSEQ_atomic') and not stmt.name.name == '__CSEQ_atomic_end') or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name.startswith('__CSEQ_assume')) or
                            (type(stmt) == pycparser.c_ast.FuncCall and stmt.name.name == '__cs_cond_wait_2')
                            )
                        )
                        )):
                        self.__stmtCount += 1
                        if self._in_interval(self.__stmtCount, self.__currInterval) or self.__realStmtCount == -1:
                            self.__realStmtCount += 1
                            self.__maxInCompound = self.__realStmtCount
                            threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
                            stamp = '__CSEQ_rawline("%s%s_%s: IF(%s,%s,%s%s_%s)");\n' % (self.__startChar, self.__currentThread, str(self.__realStmtCount),threadIndex,str(self.__realStmtCount), self.__startChar, self.__currentThread, str(self.__realStmtCount+1))
                            code = self.visit(stmt)
                            newStmt =  stamp + code + ';\n'
                        else:
                            newStmt = self.visit(stmt) + ";\n"
                    else:
                        newStmt = self.visit(stmt) + ";\n"

                    s += newStmt
                else:
                    newStmt = self.visit(stmt) + ";\n"
                    s += newStmt

        self.indent_level -= 1
        s += self._make_indent() + '}\n'

        return s


    def visit_FuncDef(self, n):
        if (n.decl.name.startswith('__CSEQ_atomic_') or
            #n.decl.name.startswith(core.common.funcPrefixChange['__CSEQ_atomic']) or
            n.decl.name == '__CSEQ_assert' or
            n.decl.name in self.Parser.funcReferenced ):   # <--- functions called through pointers are not inlined yet
            # return self.Parser.funcBlock[n.decl.name]
            self.__currentThread = n.decl.name
            self.__visit_funcReference = True
            #ret = self.otherparser.visit(n)
            oldatomic = self.__atomic
            self.__atomic = True
            decl = self.visit(n.decl)
            body = self.visit(n.body)
            self.__atomic = oldatomic
            s = decl + '\n' + body + '\n'
            self.__currentThread = ''
            self.__visit_funcReference = False
            return s


        # swarm
        if n.decl.name == 'main':
            if n.decl.name in self.__intervals:
                self.__currInterval = self.__intervals[n.decl.name]
            elif 'main_thread' in self.__intervals:
                self.__currInterval = self.__intervals['main_thread']
            else:
                self.__currInterval = []
        else:
            if n.decl.name in self.__intervals:
                self.__currInterval = self.__intervals[n.decl.name]
            else:
                self.__currInterval = []


        self.__first = False
        self.__currentThread = n.decl.name
        self.__firstThreadCreate = False

        decl = self.visit(n.decl)
        self.indent_level = 0
        body = self.visit(n.body)

        f = ''

        self.__lines[self.__currentThread] = self.__realStmtCount
        ###print "THREAD %s, LINES %s \n\n" % (self.__currentThread, self.__lines)

        #
        if n.param_decls:
            knrdecls = ';\n'.join(self.visit(p) for p in n.param_decls)
            self.__stmtCount = -1
            self.__realStmtCount = -1
            #body = body[:body.rfind('}')] + self._make_indent() + returnStmt + '\n}'
            f = decl + '\n' + knrdecls + ';\n'
        else:
            self.__stmtCount = -1
            self.__realStmtCount = -1
            #body = body[:body.rfind('}')] + self._make_indent() + returnStmt + '\n}'
            f = decl + '\n'

        # Remove arguments (if any) for main() and transform them into local variables in main_thread.
        # TODO re-implement seriously.
        if self.__currentThread == 'main':
            #f = f.replace(' main(', ' main_thread(')
            #f = re.sub(r' main([-a-zA-Z0-9_, *]+)', r' main_thread(void)', f)
            f = re.sub(r' main(.*)', r' main_thread(void)', f)

            if self.Parser.funcBlockIn['main'] != 'void':
                body = '{' + self.Parser.funcBlockIn['main'].replace(',', ';')+';' + body[body.find('{')+1:]
            else:
                body = '{' + body[body.find('{')+1:]

            # Change *argv[] and **argv[] --> **argv
            body = re.sub(r'\*(.*)\[\]', r'** \1', body)
            body = re.sub(r'(.*)\[\]\[\]', r'** \1', body)


        if self.__bigswitch:
            threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
            threadlabel = self.__startChar + self.__currentThread
            if self.__decomposepc:
                bigSwitch = self._generateBigSwitch('__cs_pc_%s' % threadIndex, threadIndex, threadlabel, self.__lines[self.__currentThread])
            else:
                bigSwitch = self._generateBigSwitch('__cs_pc[%s]' % threadIndex, threadIndex, threadlabel, self.__lines[self.__currentThread])
            body = '{\n' + bigSwitch + body[body.find('{')+1:]

        f += body + '\n'

        return f + '\n\n'


    def visit_If(self, n):
        ifStart = self.__maxInCompound   # label where the if stmt begins

        s = 'if ('

        if n.cond:
            condition = self.visit(n.cond)
            s += condition

        s += ')\n'
        s += self._generate_stmt(n.iftrue, add_indent=True)

        ifEnd = self.__maxInCompound   # label for the last stmt in the if block:  if () { block; }
        nextLabelID = ifEnd+1

        if n.iffalse:
            elseBlock = self._generate_stmt(n.iffalse, add_indent=True)

            elseEnd = self.__maxInCompound   # label for the last stmt in the if_false block if () {...} else { block; }

            if ifStart < ifEnd:
                threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
                # GUARD(%s,%s)
                if not self.__visit_funcReference:
                    elseHeader = '__CSEQ_assume( __cs_pc_cs >= %s );' % (str(ifEnd+1))
            else:
                elseHeader = ''

            nextLabelID = elseEnd+1
            s += self._make_indent() + 'else\n'

            elseBlock = elseBlock.replace('{', '{ '+elseHeader, 1)
            s += elseBlock

        header = ''

        if ifStart+1 < nextLabelID:
            threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
            # GUARD(%s,%s)
            if not self.__visit_funcReference:
                footer = '__CSEQ_assume( __cs_pc_cs >= %s );' % (nextLabelID)
        else:
            footer = ''

        '''
        if n.iffalse:
            header = 'ASS_ELSE(%s, %s, %s)' % (condition, ifEnd+1, elseEnd+1) + '\n' + self._make_indent()
        else:
            if ifEnd > ifStart:
                header = 'ASS_THEN(%s, %s)' % (condition, ifEnd+1) + '\n' + self._make_indent()
            else: header = ''
        '''

        return header + s + self._make_indent() + footer


    def visit_Return(self, n):
        if self.__currentThread != '__CSEQ_assert' and self.__currentThread not in self.Parser.funcReferenced and not self.__atomic:
            self.error("error: %s: return statement in thread '%s'.\n" % (self.getname(), self.__currentThread))

        s = 'return'
        if n.expr: s += ' ' + self.visit(n.expr)
        return s + ';'


    def visit_Label(self, n):
        self.__labelLine[self.__currentThread, n.name] = self.__realStmtCount
        return n.name + ':\n' + self._generate_stmt(n.stmt)


    def visit_Goto(self, n):
        self.__gotoLine[self.__currentThread, n.name] = self.__realStmtCount
        extra = '<%s,%s>\n' % (self.__currentThread, n.name) + self._make_indent()
        extra = ''
        return extra + 'goto ' + n.name + ';'


    def visit_ID(self, n):
        # If this ID corresponds either to a global variable,
        # or to a pointer...
        #
        if ((self.__isGlobal(self.__currentThread, n.name) or self.__isPointer(self.__currentThread, n.name)) and not
            n.name.startswith('__cs_thread_local_')):
            #print "variable %s in %s is global\n" % (n.name, self.__currentThread)
            self.__globalMemoryAccessed = True

        # Rename the IDs of main() arguments
        #if self.__currentThread == 'main' and n.name in self.Parser.varNames['main'] and self.Parser.varKind['main',n.name] == 'p':
        #   return '__main_params_' + n.name

        return n.name

    def visit_ArrayRef(self, n):
        arrref = self._parenthesize_unless_simple(n.name)
        subscript = self.visit(n.subscript)
        threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
        if subscript == '__cs_thread_index' and self.__currentThread != '':
            subscript = '%s' % threadIndex
        s = arrref + '[' + subscript + ']'
        return s


    def visit_FuncCall(self, n):
        fref = self._parenthesize_unless_simple(n.name)
        args = self.visit(n.args)

        if fref == '__CSEQ_atomic_begin':
            if not self.__visit_funcReference:
                self.__atomic = True
            return ''
        elif fref == '__CSEQ_atomic_end':
            if not self.__visit_funcReference:
                self.__atomic = False
            return ''
        elif fref.startswith('__CSEQ_atomic_'): self.__globalMemoryAccessed = True
        elif fref == core.common.changeID['pthread_cond_wait']:
            self.error('pthread_cond_wait in input code (use conditional wait converter module first)')


        # When a thread is created, extract its function name
        # based on the 3rd parameter in the pthread_create() call:
        #
        # pthread_create(&id, NULL, f, &arg);
        #                          ^^^
        #
        if fref == core.common.changeID['pthread_create']: # TODO re-write AST-based (see other modules)
            fName = args[:args.rfind(',')]
            fName = fName[fName.rfind(',')+2:]
            fName = fName.replace('&', '')

            ##print "checking fName = %s\n\n" % fName

            if fName not in self.__threadName:
                self.__threadName.append(fName)
                self.__threadCount = self.__threadCount + 1

                args = args + ', %s' % (self.__threadCount)
                self.__threadIndex[fName] = self.__threadCount
            else:
                # when visiting from the 2nd time on (if it happens),
                # reuse the old thread indexS!
                args = args + ', %s' % (self.__threadIndex[fName])

            self.__firstThreadCreate = True

        if fref == core.common.changeID['pthread_exit']:
            threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
            return fref + '(' + args + ', %s)' % threadIndex

        '''
        Avoid using pointers to handle mutexes
        by changing the function calls,
        there are two cases:

           pthread_mutex_lock(&l)   ->  __cs_mutex_lock(l)
           pthread_mutex_lock(ptr)  ->  __cs_mutex_lock(*ptr)

        TODO:
           this needs proper implementation,
           one should check that the argument is not referenced
           elsewhere (otherwise this optimisation will not work)
        '''

        # Optimization for removing __cs_thread_index variable from global scope
        if ((fref == core.common.changeID['pthread_mutex_lock'] ) or (fref == core.common.changeID['pthread_mutex_unlock']) or
                fref.startswith('__cs_cond_wait_')):
            threadIndex = self.Parser.threadIndex[self.__currentThread] if self.__currentThread in self.Parser.threadIndex else 0
            return fref + '(' + args + ', %s)' % threadIndex

        return fref + '(' + args + ')'


    def __createMainRoundRobinDecomposePC(self, ROUNDS):
        '''  New main driver:
        '''
        main = ''
        main += "int main(void) {\n"
        ''' First round (round 0)
        '''
        round = 0
        # Main thread
        main +="__CSEQ_rawline(\"/* round  %s */\");\n" % round
        main +="__CSEQ_rawline(\"    /* main */\");\n"
        main +="          __cs_pc_cs = Frama_C_unsigned_int_interval(1, %s);\n" % (self.__lines['main'])
        main +="          %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines['main'])
        main +="          main_thread();\n"
        main +="          __cs_pc_0 = __cs_pc_cs;\n"
        main +="          %s\n" % self._generateConstraintsFramaC('__cs_pc_0', self.__lines['main'])
        main +="\n"
        # Other threads
        i = 1
        for t in self.__threadName:
            if t == 'main': continue
            if i <= self.__threadbound:
                main +="__CSEQ_rawline(\"    /* %s */\");\n" % t
                main +="         if (__cs_active_thread[%s]) {\n" % (i)
                main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(0, %s);\n" % (self.__lines[t])
                main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines[t])
                main +="             %s(__cs_threadargs[%s]);\n" % (t, i)
                main +="             __cs_pc_%s = __cs_pc_cs;\n" % (i)
                main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_%s' % i, self.__lines[t])
                main +="         }\n\n"
                i += 1

        ''' Other rounds
        '''
        for round in range(1, ROUNDS):
            main +="__CSEQ_rawline(\"/* round  %s */\");\n" % round
            # For main thread
            main +="__CSEQ_rawline(\"    /* main */\");\n"
            main +="          if (__cs_active_thread[0]) {\n"
            main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(__cs_pc_0, %s);\n" % (self.__lines['main'])
            main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines['main'])
            main +="             main_thread();\n"
            main +="             __cs_pc_0 = __cs_pc_cs;\n"
            main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_0', self.__lines['main'])
            main +="          }\n\n"
            main +="\n"
            # For other threads
            i = 1
            for t in self.__threadName:
                if t == 'main': continue
                if i <= self.__threadbound:
                    main +="__CSEQ_rawline(\"    /* %s */\");\n" % t
                    main +="         if (__cs_active_thread[%s]) {\n" % (i)
                    main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(__cs_pc_%s, %s);\n" % (i, self.__lines[t])
                    main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines[t])
                    main +="             %s(__cs_threadargs[%s]);\n" % (t, i)
                    main +="             __cs_pc_%s = __cs_pc_cs;\n" % (i)
                    main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_%s' % i, self.__lines[t])
                    main +="         }\n\n"
                    i += 1


        ''' Last called to main
        '''

        # For the last call to main thread
        main +="           if (__cs_active_thread[0] == 1) {\n"
        main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(__cs_pc_0, %s);\n" % (self.__lines['main'])
        main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines['main'])
        main +="             main_thread();\n"
        main +="           }\n"
        main += "    return 0;\n"
        main += "}\n\n"

        return main

    def __createMainRoundRobin(self, ROUNDS):
        '''  New main driver:
        '''
        main = ''
        main += "int main(void) {\n"
        ''' First round (round 0)
        '''
        round = 0
        # Main thread
        main +="__CSEQ_rawline(\"/* round  %s */\");\n" % round
        main +="__CSEQ_rawline(\"    /* main */\");\n"
        main +="          __cs_pc_cs = Frama_C_unsigned_int_interval(1, %s);\n" % (self.__lines['main'])
        main +="          %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines['main'])
        main +="          main_thread();\n"
        main +="          __cs_pc[0] = __cs_pc_cs;\n"
        main +="          %s\n" % self._generateConstraintsFramaC('__cs_pc[0]', self.__lines['main'])
        main +="\n"

        # Other threads
        i = 1
        for t in self.__threadName:
            if t == 'main': continue
            if i <= self.__threadbound:
                main +="__CSEQ_rawline(\"    /* %s */\");\n" % t
                main +="         if (__cs_active_thread[%s]) {\n" % (i)
                main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(0, %s);\n" % (self.__lines[t])
                main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines[t])
                main +="             %s(__cs_threadargs[%s]);\n" % (t, i)
                main +="             __cs_pc[%s] = __cs_pc_cs;\n" % (i)
                main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc[%s]' % i, self.__lines[t])
                main +="         }\n\n"
                i += 1

        ''' Other rounds
        '''
        for round in range(1, ROUNDS):
            main +="__CSEQ_rawline(\"/* round  %s */\");\n" % round
            # For main thread
            main +="__CSEQ_rawline(\"    /* main */\");\n"
            main +="          if (__cs_active_thread[0]) {\n"
            main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(__cs_pc[0], %s);\n" % (self.__lines['main'])
            main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines['main'])
            main +="             main_thread();\n"
            main +="             __cs_pc[0] = __cs_pc_cs;\n"
            main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc[0]', self.__lines['main'])
            main +="          }\n\n"
            main +="\n"
            # For other threads
            i = 1
            for t in self.__threadName:
                if t == 'main': continue
                if i <= self.__threadbound:
                    main +="__CSEQ_rawline(\"    /* %s */\");\n" % t
                    main +="         if (__cs_active_thread[%s]) {\n" % (i)
                    main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(__cs_pc[%s], %s);\n" % (i, self.__lines[t])
                    main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines[t])
                    main +="             %s(__cs_threadargs[%s]);\n" % (t, i)
                    main +="             __cs_pc[%s] = __cs_pc_cs;\n" % (i)
                    main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc[%s]' % i, self.__lines[t])
                    main +="         }\n\n"
                    i += 1


        ''' Last called to main
        '''

        # For the last call to main thread
        main +="           if (__cs_active_thread[0] == 1) {\n"
        main +="             __cs_pc_cs = Frama_C_unsigned_int_interval(__cs_pc[0], %s);\n" % (self.__lines['main'])
        main +="             %s\n" % self._generateConstraintsFramaC('__cs_pc_cs', self.__lines['main'])
        main +="             main_thread();\n"
        main +="           }\n"
        main += "         _Bool __FRAMAC_spec = __FRAMAC_error;\n"
        main += "    return 0;\n"
        main += "}\n\n"

        return main


    # Checks whether variable  v  from function  f  is a pointer.
    #
    def __isPointer(self, f, v):
        if v in self.Parser.varNames[f] and self.Parser.varType[f,v].endswith('*'): return True
        elif v in self.Parser.varNames[''] and self.Parser.varType['',v].endswith('*'): return True
        else: return False


    # Checks whether variable  v  from function  f  is global.
    #
    def __isGlobal(self, f, v):
        if (v in self.Parser.varNames[''] and v not in self.Parser.varNames[f]): return True
        else: return False


    # Check whether the given AST node accesses global memory or uses a pointer.
    #
    # TODO: this overapproximation is very rough,
    #      (variable dependency, pointer analysis etc,
    #       could be useful for refinement)
    #
    def __globalAccess(self, stmt):
        if self.__atomic: return False  # if between atomic_begin() and atomic_end() calls no context switchs needed..

        oldStmtCount = self.__stmtCount             # backup counters
        oldRealStmtCount = self.__realStmtCount     # backup real counters
        oldMaxInCompound = self.__maxInCompound
        oldGlobalMemoryAccessed = self.__globalMemoryAccessed

        globalAccess = False
        self.__globalMemoryAccessed = False

        if type(stmt) not in (pycparser.c_ast.If, ):
            tmp = self._generate_stmt(stmt)
        else:
            tmp = self._generate_stmt(stmt.cond)

        globalAccess = self.__globalMemoryAccessed

        self.__realStmtCount = oldRealStmtCount     # restore real counters
        self.__stmtCount = oldStmtCount             # restore counters
        self.__maxInCompound = oldMaxInCompound
        self.__globalMemoryAccessed = oldGlobalMemoryAccessed

        return globalAccess


    def _in_interval(self, index, interval):
        if self.__showThreadLines:
            return True

        if len(interval) == 0:
            return True

        if index == -1:
            return False

        for i in range(0, len(interval)):
            if interval[i][0] <= index and index <= interval[i][1]:
                return True
            elif i > 0 and index < interval[i][0] and index > interval[i - 1][1]:
                return False

        return False

    def _generateConstraintsFramaC(self, varname, threadline):
        cond = ' || '.join(['%s==%s' % (varname, i) for i in range(0, threadline+1)])
        cond = '/*@ assert ' + cond + ';*/'
        return ''
        return '__CSEQ_rawline(\"' + cond + '\");'

    # def _generateConstraintsFramaC2(self, varname, threadline):
    #     cond = ' || '.join(['%s==%s' % (varname, i) for i in range(0, threadline+1)])
    #     cond = 'assume(' + cond + ');'
    #     return cond

    def _generateBigSwitch(self, varname, threadindex, threadlabel, threadline):
        switch = 'switch(%s){\n' % (varname)
        for i in range(0, threadline+1):
            switch += '    case %s:\n        goto %s_%s; break;\n' % (i, threadlabel, i)
        switch += '}\n'
        return switch

