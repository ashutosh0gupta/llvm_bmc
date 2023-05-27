""" CSeq function inlining module
    maintained by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'inlinerall-0.1-2016.10.07'

"""

Transformations:
    - inlining of all the function calls,
      for functions which body is defined (except main())

    - inlining __CSEQ_atomic_ function (for the sack of Frama-C detection of range)

    - renames main() to main_thread()

    - in threads:
        - pthread_exit;  are converted into  goto thread_exit;  (pthread_exit() argument is ignored)
        - return;  and  return value;  are converted into  goto thread_exit;  (return value is ignored)
        - local variables are converted into static local variables (to hold the value across context switches)


Prerequisites:
    - no function calls in if, while, for conditions (e.g. if(f(g)), while(cond), ...) ???
     (use module extractor.py)
    - no overlapping variable names as in regression testcase 102
     (use module varnames.py)


Limitations:
    - two function in the same expression, nested, e.g.: g(f(x));


Todo:
    - limit recursion depth (otherwise parsing recursive functions will give a python stack overflow)

    - handle f(g(x)):  g(x) is in n.args therefore at the moment would not be inlined?

Changelog:
    2017.08.17  preserve return arguments and pthread_exit arguments for thread
    2016.12.20   fix follow version from inliner.py (same date)
    2016.12.02   fix follow version from inliner.py
    2016.10.07   Initial version forked from inliner.py

"""

import copy,re
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
from pycparser import c_ast
import core.common, core.module, core.parser, core.utils


class inlinerall(core.module.Translator):
    functionlines  = {}         # map function names to sets of line numbers
    linestofunctions = {}        # map from lines to function names

    ##__functionsToBeInlined = []     # ids of all the functions to be inlined
    currentFunction = ['']
    currentFunctionParams = []        # while parsing a function call, keeps the list of parameters used for the actual call

    inlinedStack = []                 # inlined function to add before a statement
    indexStack = []                   # current index (= functionname_inliningcountforthisfunction) used for labels and gotos

    parametersToRemoveStack = [[]]
    switchTo = []                     # Fix to avoid multiple inliner of two functions with take the same parameter (as a global var, pfscan)

    __parsingStruct = False           #

    # old
    funcInlinedCount = {}             # number of times a function call has been inlined, by function

    #
    keepstaticarray = False
    atomicparameter = False
    __globalMemoryAccessed = False
    __hasatomicbegin = False
    __canbemerged = {}

    # Keep return and pthread_exit of each thread
    __exit_args = {}


    def init(self):
        self.addInputParam('keepstaticarray', 'keep static array, do not change to pointer version', '', False, True)
        self.addInputParam('atomicparameter', 'keep passing parameter atomic', '', False, True)


    def loadfromstring(self ,string, env):
        if self.getInputParamValue('keepstaticarray') is not None:
            self.keepstaticarray = True

        if self.getInputParamValue('atomicparameter') is not None:
            self.atomicparameter = True

        super(self.__class__, self).loadfromstring(string, env)


    ''' Check whether or not the input source code has been fully inlined,
        i.e. whether every function defined in the original source code has been inlined,
        or the function inlining bound has been met.
    '''
    def inlined(self):
        pass


    def visit_UnaryOp(self, n):
        operand = self._parenthesize_unless_simple(n.expr)

        #print "N.OP     %s" % n.op
        #print "OPERAND: %s" % operand
        #print "STACK: %s" % str(self.parametersToRemoveStack[-1])

        #
        if n.op == 'p++':
            return '%s++' % operand
        elif n.op == 'p--':
            return '%s--' % operand
        elif n.op == 'sizeof':
            # Always parenthesize the argument of sizeof since it can be
            # a name.
            return 'sizeof(%s)' % self.visit(n.expr)
        elif n.op == '*' and len(self.switchTo) > 0 and operand in self.switchTo[-1]:
            return self.switchTo[-1][operand]
        else:
            return '%s%s' % (n.op, operand)


    def visit_Compound(self, n):
        s = self._make_indent() + '{\n'
        self.indent_level += 1

        ##print "COMPOUND %s START   " % (self.indent_level)

        if n.block_items:
            globalMemoryAccessed = False
            if len(self.currentFunction) > 0:
                self.__canbemerged[self.currentFunction[-1]] = False
            for stmt in n.block_items:
                '''
                if hasattr(stmt, 'coord'):
                    print "COORDS: %s" % (stmt.coord )
                else:
                    print "COORDS NO"
                '''
                self.__globalMemoryAccessed = False
                self.__hasatomicbegin = False
                k = self._inlineIfNeeded(stmt)
                globalMemoryAccessed = self.__globalMemoryAccessed
                if self.__hasatomicbegin and not globalMemoryAccessed and len(self.currentFunction) > 0:
                    self.__canbemerged[self.currentFunction[-1]] = True
                ##print "/ \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ /\n"
                #######print k
                ###print "\\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\ / \\\n"
                s += k

        ###print "COMPOUND %s END" % self.indent_level

        self.indent_level -= 1
        s += self._make_indent() + '}\n'

        return s

    def __isGlobal(self, f, v):
        if (v in self.Parser.varNames[''] and v not in self.Parser.varNames[f]): return True
        else: return False

    def visit_ID(self, n):
        # If this ID corresponds either to a global variable,
        # or to a pointer...
        #
        if (self.__isGlobal(self.currentFunction[-1], n.name) and not
            n.name.startswith('__cs_thread_local_')):
            self.__globalMemoryAccessed = True

        return n.name

    def visit_ExprList(self, n):
        visited_subexprs = []

        for expr in n.exprs:
            if isinstance(expr, pycparser.c_ast.ExprList):
                visited_subexprs.append('{' + self.visit(expr) + '}')
            else:
                visited_subexprs.append(self.visit(expr))

        if visited_subexprs not in self.currentFunctionParams:
            self.currentFunctionParams.append(visited_subexprs)

        return ', '.join(visited_subexprs)


    def visit_FuncDef(self, n):
        # Function definitions of inlined functions must disappear (except thread functions).
        #
        #if n.decl.name in self.__functionsToBeInlined and n.decl.name not in self.Parser.threadName:  OMAROMAROMAROMAR
        if self.____needsInlining(n.decl.name) and n.decl.name not in self.Parser.threadName and n.decl.name not in self.Parser.funcReferenced:
            ##return 'int __cs_function_%s_inlined = 1;\n' % n.decl.name;
            return ''

        self.currentFunction.append(n.decl.name)

        decl = self.visit(n.decl)
        self.indent_level = 0
        body = self.visit(n.body)

        # At the bottom of each thread, add a pthread_exit() statement
        #
        returnStmt = ''

        if (self.currentFunction[-1] in self.Parser.threadName or self.currentFunction[-1] == 'main'):
            if self.currentFunction[-1] not in self.__exit_args:
                self.__exit_args[self.currentFunction[-1]] = '0'
            returnStmt = self.INDENT_SPACING + '__exit_%s: ; %s(%s);\n' % (
                self.currentFunction[-1],
                core.common.changeID['pthread_exit'],
                self.__exit_args[self.currentFunction[-1]])

        # Continue the visit.
        if n.param_decls:
            knrdecls = ';\n'.join(self.visit(p) for p in n.param_decls)
            body = body[:body.rfind('}')] + self._make_indent() + returnStmt + '}'
            block = decl + '\n' + knrdecls + ';\n' + body + '\n'
        else:
            body = body[:body.rfind('}')] + self._make_indent() + returnStmt + '}'
            block = decl + '\n' + body + '\n'


        self.currentFunction.pop()

        return block


    ''' Labels in inlined function needs to be renamed, the label needs to be unique in a function scope
        TRUC: todo 3
    '''
    def visit_Goto(self, n):
        if len(self.currentFunction) > 0 and self.____needsInlining(self.currentFunction[-1]):
            count = 0 if self.currentFunction[-1] not in self.funcInlinedCount else self.funcInlinedCount[self.currentFunction[-1]] - 1
            newlabel = n.name + '_' + self.currentFunction[-1] + '_' + str(count)
            return 'goto ' + newlabel + ';'
        else:
            return 'goto ' + n.name + ';'

    '''
    '''
    def visit_FuncCall(self, n):
        self.currentFunctionParams = []

        fref = self._parenthesize_unless_simple(n.name)

        #print "function call: %s" % fref
        #print "stack: %s" % str(self.stack)
        #print "\n\n"

        # Pthread exit()s can only be within thread functions,
        # no need to check whether we're in a thread.
        #
        if fref == core.common.changeID['pthread_exit']:  # pthread_exit() param is ignored for the moment
            args = self.visit(n.args)
            self.__exit_args[self.currentFunction[-1]] = args
            return 'goto __exit_%s ' % (self.currentFunction[-1])

        if fref == '__CSEQ_atomic_begin':
            self.__hasatomicbegin = True

        args = self.visit(n.args)

        s = fref + '(' + args + ')'

        if n.args is None:
            self.currentFunctionParams.append([])

        if self.____needsInlining(fref):
            if fref not in self.funcInlinedCount:
                self.funcInlinedCount[fref] = 0

            self.funcInlinedCount[fref] += 1
            self.indexStack.append('_%s_%s' % (fref, self.funcInlinedCount[fref]))

            inlined = self.inlinedStack[-1][0] + (self._inlineFunction(self.Parser.funcASTNode[fref], n, False))+'\n'
            atomicity = True if fref.startswith('__CSEQ_atomic') else False
            self.inlinedStack[-1] = (inlined, atomicity)

            if self.Parser.funcIsVoid[fref]: s = 'DELETETHIS'
            else: s =  '__cs_retval_%s' % (self.indexStack[-1])

            self.indexStack.pop()

        return s


    '''
    '''
    '''
    def visit_Return(self, n):
        if self.currentFunction[-1] in self.Parser.threadName:
            return 'goto __exit_%s; /* return stmt */' % (self.currentFunction[-1])
            #return 'goto _RETURN_exit_%s_%s;' % (self.currentFunction, self.funcInlinedCount[self.currentFunction])
        elif self.currentFunction[-1] == 'main':
            return 'goto __exit_main;  /* return stmt in main() */'

        s = 'return'
        if n.expr: s += ' ' + self.visit(n.expr)

        return s + ';'
    '''


    def visit_Return(self, n):
        if len(self.indexStack) > 0:
            if self.Parser.funcIsVoid[self.currentFunction[-1]]:
                #print "function name %s  -  is void\n\n" % self.currentFunction[-1]
                return 'goto __exit_%s;' % (self.indexStack[-1]) # void
            else:
                #print "function name %s  -  is not void (%s)\n\n" % (self.currentFunction[-1], self.Parser.funcBlockOut[self.currentFunction[-1]])
                return '__cs_retval_%s = %s; goto __exit_%s;' % (self.indexStack[-1], self.visit(n.expr), self.indexStack[-1]) # non-void

        if self.currentFunction[-1] in self.Parser.threadName:
            #~return 'goto __exit_%s; /* return stmt */' % (self.currentFunction[-1])
            args = self.visit(n.expr) if n.expr else '0'
            self.__exit_args[self.currentFunction[-1]] = args
            return 'goto __exit_%s; ' % (self.currentFunction[-1])
            #return 'goto _RETURN_exit_%s_%s;' % (self.currentFunction, self.funcInlinedCount[self.currentFunction])
        elif self.currentFunction[-1] == 'main':
            #~return 'goto __exit_main;  /* return stmt in main() */'
            self.__exit_args[self.currentFunction[-1]] = '0'
            return 'goto __exit_main; '


        s = 'return'
        if n.expr: s += ' ' + self.visit(n.expr)
        return s + ';'


    ''' TODO: labels inside inlined functions must be indexed using  indexStack
    '''
    '''
    def visit_Label(self, n):
        if self.currentFunction in self.__functionsToBeInlined:
            return n.name + self.indexStack[-1] + ':\n' + self._generate_stmt(n.stmt)
        else:
            return n.name + ':\n' + self._generate_stmt(n.stmt)
    '''

    ''' TODO gotos-to-labels inside inlined functions must be indexed using  indexStack
    '''
    '''
    def visit_Goto(self, n):
        if self.currentFunction in self.__functionsToBeInlined:
            return 'goto ' + n.name + self.indexStack[-1] + '; /* updated label index from previous goto stmt */'
        else:
            return 'goto ' + n.name + ';'
    '''


    def visit_Struct(self, n):
        #
        oldParsingStruct = self.__parsingStruct
        self.__parsingStruct = True
        s = self._generate_struct_union(n, 'struct')
        self.__parsingStruct = oldParsingStruct

        return s

    @staticmethod
    def _initVar(varType, varName, varTypeUnExpanded):
        s = ''
        if varType == 'int':
            s = '%s = __CSEQ_nondet_int()' % varName
        elif varType == 'unsigned int':
            s = '%s = __CSEQ_nondet_uint()' % varName
        elif varType == '_Bool':
            s = '%s = __CSEQ_nondet_bool()' % varName
        elif varType == 'char':
            s = '%s = __CSEQ_nondet_char()' % varName
        elif varType == 'unsigned char':
            s = '%s = __CSEQ_nondet_uchar()' % varName
        elif varType == '__cs_t':
            s = ''
        elif varType == '__cs_mutex_t':
            s = ''
        elif varType == '__cs_cond_t':
            s = ''
        elif varType == '__cs_barrier_t':
            s = ''
        else:
            s = '__cs_init_scalar(&%s, sizeof(%s))' % (varName, varType)
        return s

    def _hasBeenAssignedLater(self, varname):
        # There is case where a variable does not need an nondet assignment
        # 1. There is an immediate assign statement after the declaration of variable
        # 2. This variable is created in the sack of for loop
        # --> the two cases above can be compacted into one case: there is an assignment to variable after this
        if (len(self.currentFunction) > 0 and
            self.currentFunction[-1] != '' and
            self.currentFunction[-1] in self.Parser.varNoNeedInit and
                varname in self.Parser.varNoNeedInit[self.currentFunction[-1]]):
            return True
        return False

    def _needInit(self, varname):
        if ('__cs_switch_cond' in varname or           # from switchtransformer.py
            '__cs_tmp_if_cond_' in varname or               # from extractor.py
            '__cs_tmp_while_cond_' in varname or              # from extractor.py
            '__cs_tmp_for_cond_' in varname or            # from extractor.py
            '__cs_dowhile_onetime_' in varname or    # from remover.py
                self._hasBeenAssignedLater(varname)):
            return False
        return True


    def visit_Decl(self, n, no_type=False):
        # no_type is used when a Decl is part of a DeclList, where the type is
        # explicitly only for the first delaration in a list.
        #
        s = n.name if no_type else self._generate_decl(n)

        if n.bitsize:
            s += ' : ' + self.visit(n.bitsize)

        # Change local variables to be static vars,
        # needed for this particular encoding to remember the old values of local variables
        # between simulated context switches.
        #
        # If the variable is scalar or it is an array of fixed size, then just add  static  to its declaration.
        # If the variable is an array of non fixed size, then change it to a static pointer and adds a call to malloc() to complete the initialization,
        # (e.g.    int x[size];  -->  static int * x; x = (int *)malloc(sizeof(int)*size);  )
        #
        # TODO: init_scalar()/malloc() should not be called when variables have init expressions!
        #
        processInit = False    # Has processed the init expression
        if (isinstance(n, c_ast.Decl) and              # it is a declaration
                self.currentFunction[-1] != '' and     # Not a global declaration
                self.indent_level > 0 and              # This is kind of useless
                not s.startswith('static ') and        # This may not usefull
                not self.__parsingStruct):             # and not part of a struct

            if ((self.__isScalar(self.currentFunction[-1], n.name) or
                    self.__isStruct(self.currentFunction[-1], n.name)) and
                    # Do not believe this check of having init expression??
                    not self.Parser.varInitExpr[self.currentFunction[-1], n.name]):
                s = 'static ' + s    # declaration
                if n.init:    # This variables has Init expression
                    processInit = True
                    if isinstance(n.init, c_ast.InitList):
                        s += ' = {' + self.visit(n.init) + '}'
                    elif isinstance(n.init, c_ast.ExprList):
                        s += '; %s = (' % n.name + self.visit(n.init) + ')'
                    else:
                        s += '; %s = ' % n.name + self.visit(n.init)
                else:   # no init
                    if self.__isScalar(self.currentFunction[-1], n.name):
                        varType = self.Parser.varType[self.currentFunction[-1], n.name]
                        varTypeUnExpanded = self.Parser.varTypeUnExpanded[self.currentFunction[-1], n.name]
                        initialStmt = '; ' + self._initVar(varType, n.name, varTypeUnExpanded) if self._needInit(n.name) else ''
                        s += initialStmt
                    elif self.__isStruct(self.currentFunction[-1], n.name):
                        s += ''
                    else:   ## what can it be?
                        s += '; __cs_init_scalar(&%s, sizeof(%s))' % (
                            n.name, self.Parser.varType[self.currentFunction[-1], n.name])

            elif (self.__isScalar(self.currentFunction[-1], n.name) and
                    # Do not believe this check, it is not always true???
                    self.Parser.varInitExpr[self.currentFunction[-1], n.name]):
                s = 'static ' + s
                if n.init:
                    processInit = True
                    if isinstance(n.init, c_ast.InitList):
                        s += ' = {' + self.visit(n.init) + '}'
                    elif isinstance(n.init, c_ast.ExprList):
                        s += '; %s = (' % n.name + self.visit(n.init) + ')'
                    else:
                        s += '; %s = ' % n.name + self.visit(n.init)
                else:
                    varType = self.Parser.varType[self.currentFunction[-1], n.name]
                    varTypeUnExpanded = self.Parser.varTypeUnExpanded[self.currentFunction[-1], n.name]
                    initialStmt = '; ' + self._initVar(varType, n.name, varTypeUnExpanded) if self._needInit(n.name) else ''
                    s += initialStmt

            elif self.__isArray(self.currentFunction[-1], n.name):
                # There are two cases:
                # 1. this array has a constant expression of compound literal
                # 2. anything else
                init = ''
                initType = 0
                if n.init:
                    processInit = True
                    if isinstance(n.init, c_ast.InitList):
                        init = ' = {' + self.visit(n.init) + '}'
                        initType = 1
                    elif isinstance(n.init, c_ast.ExprList):
                        init = ' = (' + self.visit(n.init) + ')'
                        initType = 0
                    else:
                        init = ' = ' + self.visit(n.init)
                        initType = 0

                if initType == 1:
                    # Case 1
                    s = 'static ' + s + init
                else:
                    # Anything else
                    if processInit:
                        if self._is_dynamic_size_array(self.currentFunction[-1], n.name):
                            s = 'static ' + s + init
                        else:
                            s = 'static ' + s + '; %s' % n.name + init
                    else:
                        if self.keepstaticarray:
                            s = 'static ' + s
                        else:
                            stars = '*' * self.Parser.varArity[self.currentFunction[-1], n.name]
                            vartype = self.Parser.varType[self.currentFunction[-1], n.name]
                            s = 'static %s %s %s; ' % (vartype, stars, n.name)
                            s += n.name + ' = (%s %s) %s(sizeof(%s)*%s)' % (vartype, stars, core.common.changeID['malloc'], vartype, self._totalSize(self.currentFunction[-1], n.name))
            else:    # Anything else, Truc's modification
                init = ''
                initType = 0
                if n.init:
                    processInit = True
                    if isinstance(n.init, c_ast.InitList):
                        init = ' = {' + self.visit(n.init) + '}'
                        initType = 1
                    elif isinstance(n.init, c_ast.ExprList):
                        init = ' = (' + self.visit(n.init) + ')'
                        initType = 0
                    else:
                        init = ' = ' + self.visit(n.init)
                        initType = 0
                if initType == 1:
                    s = 'static ' + s + init
                else:
                    if processInit:
                        if self._is_dynamic_size_array(self.currentFunction[-1], n.name):
                            s = 'static ' + s + init
                        else:
                            s = 'static ' + s + '; %s' % n.name + init
                    else:
                        s = 'static ' + s + '; __cs_init_scalar(&%s, sizeof(%s))' % (
                            n.name, self.Parser.varType[self.currentFunction[-1], n.name])

        # Global variables and already static variables
        if n.init and not processInit:
            if isinstance(n.init, c_ast.InitList):
                s += ' = {' + self.visit(n.init) + '}'
            elif isinstance(n.init, c_ast.ExprList):
                s += ' = (' + self.visit(n.init) + ')'
            else:
                s += ' = ' + self.visit(n.init)

        return s


    ''' OMAR CODE
    def visit_Decl(self, n, no_type=False):
        # no_type is used when a Decl is part of a DeclList, where the type is
        # explicitly only for the first delaration in a list.
        #
        s = n.name if no_type else self._generate_decl(n)

        if n.bitsize: s += ' : ' + self.visit(n.bitsize)

        # Change local variables to be static vars,
        # needed for this particular encoding to remember the old values of local variables
        # between simulated context switches.
        #
        # If the variable is scalar or it is an array of fixed size, then just add  static  to its declaration.
        # If the variable is an array of non fixed size, then change it to a static pointer and adds a call to malloc() to complete the initialization,
        # (e.g.    int x[size];  -->  static int * x; x = (int *)malloc(sizeof(int)*size);  )
        #
        # TODO: init_scalar()/malloc() should not be called when variables have init expressions!
        #

        nondet_function = {}
        nondet_function['int'] = "__CSEQ_nondet_int()"
        nondet_function['unsigned int'] = "__CSEQ_nondet_uint()"
        nondet_function['_Bool'] = "__CSEQ_nondet_bool()"
        nondet_function['char'] = "__CSEQ_nondet_char()"
        nondet_function['unsigned char'] = "__CSEQ_nondet_uchar()"

        if (isinstance(n, c_ast.Decl) and
            self.currentFunction[-1] != '' and
            self.indent_level > 0 and
            not s.startswith('static ') and
            not self.__parsingStruct):

            if (self.__isScalar(self.currentFunction[-1], n.name) or self.__isStruct(self.currentFunction[-1], n.name)) and not self.Parser.varInitExpr[self.currentFunction[-1], n.name]:
            #if self.__isScalar(self.currentFunction[-1], n.name) and not self.Parser.varInitExpr[self.currentFunction[-1], n.name]:
                vartype = self.Parser.varType[self.currentFunction[-1], n.name]
                # if vartype not in ("int", "unsigned int", "_Bool", "char", "unsigned char", ):
                s = 'static ' + s + '; __cs_init_scalar(&%s, sizeof(%s))' % (n.name, vartype)
                # else:
                    # s = 'static ' + s + '; %s = %s' % (n.name, nondet_function[vartype])
                #s = 'static ' + s + '; malloc(&%s, sizeof(%s))' % (n.name, self.Parser.varType[self.currentFunction[-1], n.name])
            elif self.__isScalar(self.currentFunction[-1], n.name) and self.Parser.varInitExpr[self.currentFunction[-1], n.name]:
                s = 'static ' + s
            elif self.__isArray(self.currentFunction[-1], n.name):
                stars = '*' * self.Parser.varArity[self.currentFunction[-1], n.name]
                vartype = self.Parser.varType[self.currentFunction[-1],n.name]

                s = 'static %s %s %s; ' % (self.Parser.varType[self.currentFunction[-1], n.name], stars, n.name)
                s += n.name + ' = (%s %s)malloc(sizeof(%s)*%s); __CSEQ_assume(%s)' % (vartype, stars, vartype, self._totalSize(self.currentFunction[-1], n.name), n.name)

        if n.init:
            if isinstance(n.init, c_ast.InitList):
                s += ' = {' + self.visit(n.init) + '}'
            elif isinstance(n.init, c_ast.ExprList):
                s += ' = (' + self.visit(n.init) + ')'
            else:
                s += ' = ' + self.visit(n.init)

        return s

    '''

    # def visit_Label(self, n):
    #     # Truc (method 1: simply add an empty statement)
    #     return n.name + ':;\n' + self._generate_stmt(n.stmt)

    ########################################################################################

    def _inlineIfNeeded(self, stmt):
        # Truc (method 2: Identify inlined function call by inlinedStacked
        # and change things according to type of statements)
        self.inlinedStack.append(('', False))

        original = ''
        if isinstance(stmt, pycparser.c_ast.Label):
            label = stmt.name
            # TRUC, todo 3
            if len(self.currentFunction) > 0 and self.____needsInlining(self.currentFunction[-1]):
                count = 0 if self.currentFunction[-1] not in self.funcInlinedCount else self.funcInlinedCount[self.currentFunction[-1]] - 1
                label = label + '_' + self.currentFunction[-1] + '_' + str(count)

            original = self._generate_stmt(stmt.stmt)
            if self.inlinedStack[-1][0] == '':  # If this statement doesn't contain inlined function
                original = label + ':\n' + original
            else:
                original = original.replace('DELETETHIS;\n', '')
                original = label + ':;\n' + self.inlinedStack[-1][0] + original
        else:
            original = self._generate_stmt(stmt)
            original = original.replace('DELETETHIS;\n', '')
            original = self.inlinedStack[-1][0] + original

        if self.inlinedStack[-1][1]:
            original = original.replace('__CSEQ_atomic_begin();', '')
            original = original.replace('__CSEQ_atomic_end();', '')
            original =  '__CSEQ_atomic_begin();\n' + original + '__CSEQ_atomic_end();\n'

        self.inlinedStack.pop()

        return original


    ''' Generate the function body,
        for either including it in a function definition, or
        for inserting it into a statement
    '''
    def _inlineFunction(self, n, fcall_ast_node, simple):
        fInput = fOutput = ''
        fref = n.decl.name
        #print "inlining function:%s %s" % (fref, str(self.currentFunctionParams))
        # Simulate input parameter passing.
        #
        # Build argument initialization statement(s) if needed, to simulate parameter passing
        # (see transformation details below)
        #
        # args = self.visit(fcall_ast_node.args)  # ?????

        # Analysis of function-call parameters
        #
        self.parametersToRemoveStack.append([])
        self.switchTo.append({})

        if fcall_ast_node.args is not None:
            paramNo = -1

            #
            #
            for expr in fcall_ast_node.args.exprs:   # for each parameter in the function call
                paramNo += 1
                if (isinstance(expr, pycparser.c_ast.UnaryOp) and
                    expr.op == '&' and
                    expr.expr.name not in self.Parser.varNames[self.currentFunction[-1]] and
                    expr.expr.name in self.Parser.varNames[''] and
                    len(self.Parser.varOccurrence[fref, self.Parser.funcParams[fref][paramNo]]) - len(self.Parser.varDeReferenced[fref,self.Parser.funcParams[fref][paramNo]]) == 0):
                    #print "varname: %s     currentscope:%s    currentfinlined:%s    parameterno:%s" % (expr.expr.name, self.currentFunction[-1], fref, paramNo)
                    #print "variable %s is global and referenced!!" % expr.expr.name
                    #print "the corrseponding function parameter is %s" % (self.Parser.funcParams[fref][paramNo])
                    #print "is it always dereferenced? %s %s" % (len(self.Parser.varOccurrence[fref, self.Parser.funcParams[fref][paramNo]]), len(self.Parser.varDeReferenced[fref,self.Parser.funcParams[fref][paramNo]]) )
                    #print "\n"
                    #exit(12345)
                    ##print "REMOVE reference to global variable '&%s' from the fuction call!!!!" % expr.expr.name
                    self.parametersToRemoveStack[-1].append('&'+expr.expr.name)  # parameter  expr.expr.name  in the call to  fref()  can to be removed
                    ##print "IN THE FUNCTION BODY CHANGE (*%s) -> %s" % (self.Parser.funcParams[fref][paramNo], expr.expr.name)
                    self.switchTo[-1][self.Parser.funcParams[fref][paramNo]] = expr.expr.name

        if fcall_ast_node.args is not None:
            i = 0

            for p in self.Parser.varNames[fref]:
                if self.Parser.varKind[fref,p] == 'p':
                    #print "parameters to remove %s" % str(self.parametersToRemoveStack[-1])
                    #print "p = %s" % p
                    #print "\n\n"

                    if self.currentFunctionParams[-1][i] in self.parametersToRemoveStack[-1]:
                        i += 1
                        continue  # this parameter is not needed
                    if not self.__isPointerToFunction(fref,p) and not self.__isArray(fref,p):
                        ##print "    p       %s " % p
                        ##print "    fref    %s" % fref
                        ##print "    type    %s" % self.Parser.varTypeUnExpanded[fref,p]
                        ##print "    param   %s\n" % self.currentFunctionParams[-1][i]
                        fInput += 'static %s %s; %s = %s; ' % (self.Parser.varTypeUnExpanded[fref,p], p, p, self.currentFunctionParams[-1][i])
                        i += 1
                    elif not self.__isPointerToFunction(fref,p) and self.__isArray(fref,p):
                        varSize = ''
                        stars = ''
                        '''
                        for s in self.Parser.varSize[fref,p]:
                            if s != -1: varSize += '[%s]' % s
                            else: varSize += '[]'
                        '''
                        for s in self.Parser.varSize[fref,p]:
                            #varSize += '[%s]' % (s if s != -1 else '')
                            #####varSize += '[]'   # ignore the size for array passed as function parameters
                            stars += '*'

                        #####fInput += 'static %s %s%s; %s = %s; ' % (self.Parser.varTypeUnExpanded[fref,p], p, varSize, p, self.currentFunctionParams[-1][i])
                        fInput += 'static %s %s%s; %s = %s; ' % (self.Parser.varTypeUnExpanded[fref,p], stars, p, p, self.currentFunctionParams[-1][i])
                    else:
                        x = self.Parser.varTypeUnExpanded[fref,p].replace('(*)', '(*%s)' % p)
                        fInput += 'static %s; %s = %s; ' % (x, p, self.currentFunctionParams[-1][i])
                        i += 1

        # Simulate output parameter returning.
        #

        if not self.Parser.funcIsVoid[fref]:
            fOutput = 'static %s __cs_retval_%s;\n' % (self.Parser.funcBlockOut[fref], self.indexStack[-1])
        else:    # simple function call without assignment (e.g. f(x);)
            fOutput = ''
        # Truc - dirty fix, just inlude the line map of that function call
        fOutput = self._getCurrentCoords(fcall_ast_node) + '\n' + fOutput

        # Transform the function body by:
        #
        #   1. adding the initialization statement(s) (if any) at the top
        #   2. adding one exit label at the bottom where to jump to in order to simulate return statements
        #   3. change return statements to goto statements pointing to the exit label added in previous step
        #   4. all the rest is unchanged
        #

        # body (adds one indent each line)
        self.currentFunction.append(fref)
        #inlined = self._shiftIndent(self.visit(self.Parser.funcASTNode[fref].body))

        # save the old length so after the inlining self.lines can be trimmed back to its contents before the inlining,
        # this removes the elements added while inlining,
        # otherwise when inlining the same function more than once,
        # the linemapping is only generated on the first inlined function call.
        oldlineslen = len(self.lines)
        inlined = self.visit(self.Parser.funcASTNode[fref].body)
        self.functionlines[fref] = self.lines[oldlineslen:]
        self.lines = self.lines[:oldlineslen]

        # top
        #~inlined = inlined.replace(self.INDENT_SPACING+'{', '/*** INLINING START %s ***********************************/\n' % fref + self.INDENT_SPACING + fOutput + self._make_indent() +'{\n' + self._make_indent() + fInput, 1)
        inlined = inlined[inlined.find('{')+1:]
        if self.atomicparameter:
            fInput = '__CSEQ_atomic_begin();' + fInput
            if fref in self.__canbemerged and self.__canbemerged[fref]:
                inlined = inlined.replace('__CSEQ_atomic_begin()', '', 1)
            else:
                fInput += '__CSEQ_atomic_end();'

        addedheader = self.INDENT_SPACING + fOutput + self._make_indent() + '{\n' + self._make_indent(1) + fInput
        inlined = addedheader + inlined

        # bottom
        inlined = inlined[:inlined.rfind('}')] + '%s __exit_%s: ;  \n' % (self._make_indent(1), self.indexStack[-1]) + self._make_indent() +'}\n'
        #~inlined += '\n' + self._make_indent() + '/*** INLINING END %s **************************************/' % fref

        self.parametersToRemoveStack.pop()
        self.switchTo.pop()
        self.currentFunction.pop()

        return inlined


    # Shift one indent each line.
    #
    def _shiftIndent(self, s):
        new = ''

        for line in s.splitlines():
            new += self.INDENT_SPACING+ line + '\n'

        return new


    ''' Check whether variable  v  from function  f  has a fixed size,
        or not (e.g.  int x[expr]   with expr not constant.
    '''
    def _hasFixedSize(self, f, v):
        if self.Parser.varArity[f,v] > 0:
            for i in range(0, self.Parser.varArity[f,v]):
                if not self.Parser.varSize[f,v][i].isdigit():
                    return False

        return True


    ''' Return the total size of a given array in a string,
        as the expression of the product of all sizes.

        For example:

            int x[10][expr][3];

        returns:

            size = 10*(expr)*30;
    '''
    def _totalSize(self, f, v):
        sizeExpression = ''

        for i in range(0, self.Parser.varArity[f,v]):
            #if self.Parser.varSize[f,v][i].isdigit():     # simple digit
            sizeExpression += str(self.Parser.varSize[f,v][i]) + '*'

        sizeExpression = sizeExpression[:-1]

        return sizeExpression


    # Checks whether variable  v  from function  f  is an array.
    #
    def __isArray(self, f, v):
        if self.Parser.varArity[f,v] > 0:
            return 1
        else:
            return 0


    # Checks whether variable  v  from function  f  is scalar.
    # TODO redo properly at parser-level
    #
    def __isScalar(self, f, v):
        if self.Parser.varArity[f, v] == 0  and not self.Parser.varType[f,v].startswith('struct ') and not self.Parser.varType[f,v].startswith('union '):
            return 1
        else:
            return 0


    # Checks whether variable  v  from function  f  is a struct.
    # TODO redo properly at parser-level
    #
    def __isStruct(self, f, v):
        result = 0

        if self.Parser.varType[f, v].startswith('struct '):
            result = 1

        return result


    def __isPointerToFunction(self, f, v):
        if (f,v) in self.Parser.varPtrToFunct: return True
        else: return False
        #if '(*)' in self.Parser.varType[f,v]: return True
        #else: return False


    ''' Check whether function  f  needs to be inlined.
    '''
    def ____needsInlining(self, f):
        return (f in self.Parser.funcBlock and    # defined functions need to be inlined when called (if at all)
                # not f.startswith('__CSEQ_atomic') and       # Now atomic functions are also inlined
                #not f.startswith(core.common.funcPrefixChange['__VERIFIER_atomic']) and
                not f == '__CSEQ_assert' and
                ##f not in self.Parser.threadName and
                f != '' and
                f != 'main')


    def _is_dynamic_size_array(self, f, v):
        if (f, v) not in self.Parser.varID:
            return False

        if self.Parser.varArity[f, v] == 1 and self.Parser.varSize[f, v][0] == -1:
            return True

        return False

