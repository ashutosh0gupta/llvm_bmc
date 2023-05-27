""" CSeq Workarounds module for CBMC
    written by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'cbmc-workaround-0.0-2017.02.07'
"""

    In this module are performed all the code transformations needed as workarounds to known backend bugs/issues, or
    useful transformations to make the code more simple and meet assumptions of modules invoked later
    (later modules can thus avoid to handle the full C syntax)

    Transformation 2 (ESBMC 1.21.1 bug - not implemented yet, TODO)
       (x >= k)  --> (x == k || x >= k+1)

    Transformation 3 (to avoid problem with strict syntax checking by some backend)
            insert (void *) argument to thread prototypes when missing, for example:
            void *thread()  --> void *thread(void *)

    Transformations inherited from old merger (light pre-processing to avoid corner-cases):
        - add brackets to single-statements blocks

        - split declaration of variables of the same kind:
            int x,y; --> int x; int y;

        - split declaration of local variables + init value to two separate statements:
            int x = value; --> int x; x = value;

        - remove  if(!1) { .. }  and  if(0) { .. }

        - assign a name to anonymous structures:
            struct { int f1; char f2; ... }    -->   struct __anon_0 { int f1; char f2; ... }

        - remove (void *) 0 --> 0

        - change do {stmts} while (0) --> stmts

    Transformation 5:
        __cs_thread_local_variablename --> variablename[pthread_self()]

    Transformation 6:
        remove auto,inline,volatile,register from beginning of declarations.

    Transformation 7:
        remove (whatever cast) before thread function in pthread_create call

    Transformation 8:
        fix PTHREAD_MUTEX_INITIALIZER     initialization
            PTHREAD_COND_INITIALIZER
            PTHREAD_RWLOCK_INITIALIZER

Changelog:
    2016.11.18  bugfixes for svcomp 2017, add workarounds 7 and 8
    2015.01.13  bugfixes
    2014.12.09  further code refactory to match the new organisation of the CSeq framework
    2014.10.26  structure dereference workaround (transformation 4)
    2014.10.09  moved in this module all the transformations from  merger.py
    2014.06.05  added workaround #3 (see above)
    2014.02.25  switched to  module.Module  base class for modules


"""

import inspect, os, sys, getopt, time
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.common, core.module, core.parser, core.utils


class cbmcworkarounds(core.module.Translator):
    __threadLocals = []

    __parsingFunction = ''
    currentAnonStructsCount = 0   # counts the number of anonymous structures (used to assign consecutive names)

    '''
    def countparams(self, funcname):
        count = 0

        if funcname not in self.Parser.varNames:
            return 0

        for var in self.Parser.varNames[funcname]:
            if self.Parser.varKind[funcname, var] == 'p':
                count += 1

        return count
    '''


    '''
    def visit_Typedef(self, n):
        s = super(self.__class__, self).visit_Typedef(n)
        return s+'\n'
    '''

    def visit_Cast(self, n):
        s = '(' + self._generate_type(n.to_type) + ')'
        s += ' ' + self._parenthesize_unless_simple(n.expr)
        if s == '(void *) 0': s = '0'
        return s


    def visit_ID(self, n):
        if n.name in self.__threadLocals:
            return '__cs_thread_local_'+n.name+'[__cs_thread_index]'
        else:
            return n.name


    def visit_FuncDef(self, n):
        self.__parsingFunction = n.decl.name

        decl = self.visit(n.decl)

        if decl.startswith('static '): decl = decl[7:]

        # workaround #1
        #if '__VERIFIER_atomic' in decl:
        #   decl = decl.replace('__VERIFIER_atomic', core.common.funcPrefixChange['__VERIFIER_atomic'], 1)

        # workaround #3: insert (void *) argument to thread prototypes when missing
        '''
        if n.decl.name in self.Parser.threadName:
            print "THREAD %s HAS %s params" % (n.decl.name, self.countparams(n.decl.name))
        '''
        if n.decl.name in self.Parser.threadName and (decl.endswith('()') or decl.endswith('(void)')):
            decl = decl[:decl.rfind('(')] + '(void *__cs_unused)'

        self.indent_level = 0
        body = self.visit(n.body)

        if n.param_decls:
            knrdecls = ';\n'.join(self.visit(p) for p in n.param_decls)
            self.__parsingFunction = ''
            return decl + '\n' + knrdecls + ';\n' + body + '\n'
        else:
            self.__parsingFunction = ''
            return decl + '\n' + body + '\n'


    def visit_FuncCall(self, n):
        fref = self._parenthesize_unless_simple(n.name)
        args = ''
        ''' Transformation 7
        '''
        if fref == 'pthread_create':
            # Extract the function name (passed as 3rd argument)
            fName = ''
            if isinstance(n.args.exprs[2], pycparser.c_ast.Cast):
                fName = self._parenthesize_unless_simple(n.args.exprs[2].expr)
            else:
                fName = self.visit(n.args.exprs[2])
            fName = fName[1:] if fName.startswith('&') else fName

            args += self.visit(n.args.exprs[0]) + ', '
            args += self.visit(n.args.exprs[1]) + ', '
            args += fName + ', '
            args += self.visit(n.args.exprs[3])
        else:
            args = self.visit(n.args)

        return fref + '(' + args + ')'


    def visit_Decl(self, n, no_type=False):
        # no_type is used when a Decl is part of a DeclList, where the type is
        # explicitly only for the first delaration in a list.
        #
        s = n.name if no_type else self._generate_decl(n)

        if n.bitsize: s += ' : ' + self.visit(n.bitsize)

        # when an init expression is used,
        # remove it from the declaration statement and insert a separate
        # statement for the assignment.
        #
        assignmentStmt = ''

        initType = 0

        pthread_init_dict = {
            'pthread_mutex_t' : 'PTHREAD_MUTEX_INITIALIZER',
            'pthread_cond_t'  : 'PTHREAD_COND_INITIALIZER',
            'pthread_rwlock_t' : 'PTHREAD_RWLOCK_INITIALIZER'
        }

        if n.init:
            if isinstance(n.init, pycparser.c_ast.InitList):
                initType = 1
                if (self.__parsingFunction, n.name) in self.Parser.varType and self.Parser.varType[self.__parsingFunction, n.name] in pthread_init_dict:
                    assignmentStmt = ' = ' + pthread_init_dict[self.Parser.varType[self.__parsingFunction, n.name]]
                else:
                    assignmentStmt = ' = {' + self.visit(n.init) + '}'

            elif isinstance(n.init, pycparser.c_ast.ExprList):
                initType = 1
                assignmentStmt = ' = (' + self.visit(n.init) + ')'
            else:
                initType = 0
                assignmentStmt = ' = ' + self.visit(n.init)

        # Transformation 6:
        # remove storage class keywords from any declaration,
        # as they are not used at all in this tool for verification.
        #
        if s.startswith('auto '): s = s[5:]
        if s.startswith('inline '): s = s[7:]
        if s.startswith('extern '): s = s[7:]
        if s.startswith('volatile '): s = s[9:]
        if s.startswith('register '): s = s[9:]

        # Split the declaration statement from initialization statement.
        #
        # Remember thread-local variables
        if (n.name is not None) and (n.name.startswith('__cs_thread_local_')):
            self.__threadLocals.append(n.name.replace('__cs_thread_local_', ''))

        '''   OMAROMAROMAR   '''
        if self.__parsingFunction != '' and n.init:
            # Special consideration for init of string
            if self._is_dynamic_size_array(self.__parsingFunction, n.name):
                return s + assignmentStmt
            if initType == 1:
                return s + assignmentStmt
            return s + '; ' + n.name + assignmentStmt
        else:
            return s + assignmentStmt

        return s + assignmentStmt

    def _checkStartBrace(self, s):
        for l in s.splitlines():
            if l.startswith('# ') or l.strip() == '':
                continue
            if l.lstrip().startswith('{'):
                return True
            else:
                return False
        return False

    def visit_If(self, n):
        cond = ''

        s = 'if ('
        cond = self.visit(n.cond)
        if n.cond: s += cond
        s += ')\n'

        # Eliminate dead code
        processedCond = core.utils.remove_line_markers(cond)
        if processedCond == '0' or processedCond == '!1':
            return ''

        # Eliminate redundant code
        if processedCond == '1':
            return self._generate_stmt(n.iftrue, add_indent=True)

        t = self._generate_stmt(n.iftrue, add_indent=True)

        # if not t.startswith(self._make_indent()+ ('{\n')):   # always add brackets when missing
        if not self._checkStartBrace(t):   # always add brackets when missing
            t = self._make_indent() + '{\n' + t + self._make_indent() + '}\n'

        s += t

        if n.iffalse:
            s += self._make_indent() + 'else\n'
            e = self._generate_stmt(n.iffalse, add_indent=True)

            # if not e.startswith(self._make_indent()+ ('{\n')):   # always add brackets when missing
            if not self._checkStartBrace(e):   # always add brackets when missing
                e = self._make_indent() + '{\n' + e + self._make_indent() + '}\n'

            s += e

        return s


    def visit_For(self, n):
        s = 'for ('

        if n.init: s += self.visit(n.init)

        s += ';'

        if n.cond: s += ' ' + self.visit(n.cond)

        s += ';'

        if n.next: s += ' ' + self.visit(n.next)

        s += ')\n'
        t = self._generate_stmt(n.stmt, add_indent=True)

        # if not t.startswith(self._make_indent()+ ('{\n')):   # always add brackets when missing
        if not self._checkStartBrace(t):   # always add brackets when missing
            t = self._make_indent() + '{\n' + t + self._make_indent() + '}\n'

        return s+t


    def visit_Struct(self, n):
        # Assign a name to anonymous structs
        if n.name is None:
            n.name = 'anonstruct_' + str(self.currentAnonStructsCount)
            self.currentAnonStructsCount += 1

        return self._generate_struct_union(n, 'struct')

    def visit_Union(self, n):
        if n.name is None:
            n.name = 'anonstruct_' + str(self.currentAnonStructsCount)
            self.currentAnonStructsCount += 1

        return self._generate_struct_union(n, 'union')


    # Truc: disable for CBMC
    # def visit_StructRef(self, n):
    #     sref = self._parenthesize_unless_simple(n.name)

    #     ret = ''

    #     # workaround no. 4
    #     if n.type == '->': ret = ('(*' + sref + ').' + self.visit(n.field))
    #     else: ret = sref + n.type + self.visit(n.field)

    #     return ret


    def visit_While(self, n):
        s = 'while ('

        if n.cond: s += self.visit(n.cond)

        s += ')\n'

        t = self._generate_stmt(n.stmt, add_indent=True)

        # if not t.startswith(self._make_indent()+ ('{\n')):   # always add brackets when missing
        if not self._checkStartBrace(t):   # always add brackets when missing
            t = self._make_indent() + '{\n' + t + self._make_indent() + '}\n'

        return s + t


    def visit_DoWhile(self, n):
        cond = self.visit(n.cond) if n.cond else ''

        s = 'do\n'

        t = self._generate_stmt(n.stmt, add_indent=True)

        # if not t.startswith(self._make_indent()+ ('{\n')):   # always add brackets when missing
        if not self._checkStartBrace(t):   # always add brackets when missing
            t = self._make_indent() + '{\n' + t + self._make_indent() + '}\n'

        s += t
        s += self._make_indent() + 'while ('

        # if n.cond: s += self.visit(n.cond)
        s += cond

        s += ');'

        return s

    def _is_dynamic_size_array(self, f, v):
        if (f, v) not in self.Parser.varID:
            return False

        if self.Parser.varArity[f, v] == 1 and self.Parser.varSize[f, v][0] == -1:
            return True

        return False

