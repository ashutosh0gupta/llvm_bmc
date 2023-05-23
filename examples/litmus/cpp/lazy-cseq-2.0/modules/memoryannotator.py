""" Lazy-CSeq Conditionextractor module
    written by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'memoryannotator-0.1-2017.04.22'
"""
Description:
    - This module build a CGSA and then ...


Prerequisites:
    - fully bounded program, no loops and forward goto only

TODO:
    - Identify read and write in each thread
    - build CGSA (Control Graph of Shared Accesses)
    - name varible
    - avoid added context switches 


Changelog:
    2017.04.22  first version

"""

import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.module, core.parser, core.utils


class SharedAccess:
    ''' This class provides
        
    '''
    def __init__(self):
        pass


    def get_type(self, var):
        pass


    def get_preceding_accesses(self, var):
        ''' Returns the list of all (potential) access of this lhs variable
        '''
        pass


    def get_preceding_writes(self, var):
        pass


    def get_preceding_reads(self, var):
        pass



class memoryannotator(core.module.Translator):
    __mm = 'sc'


    def init(self):
        self.addInputParam('memory-model', 'memory model: sc (default), tso, pso, power', 'm', 'sc', False)


    def loadfromstring(self, string, env):
        self.__mm = self.getInputParamValue('memory-model')
        
        # Build this graph on-the-fly
        self.__access_graph = SharedAccess()

        super(self.__class__, self).loadfromstring(string, env)


    def visit_ID(self, n):
        return n.name


    def visit_UnaryOp(self, n):
        operand = self._parenthesize_unless_simple(n.expr)
        if n.op == 'p++':
            return '%s++' % operand
        elif n.op == 'p--':
            return '%s--' % operand
        elif n.op == 'sizeof':
            # Always parenthesize the argument of sizeof since it can be
            # a name.
            return 'sizeof(%s)' % self.visit(n.expr)
        else:
            return '%s%s' % (n.op, operand)

    def visit_BinaryOp(self, n):
        lval_str = self._parenthesize_if(n.left,
                            lambda d: not self._is_simple_node(d))
        rval_str = self._parenthesize_if(n.right,
                            lambda d: not self._is_simple_node(d))
        return '%s %s %s' % (lval_str, n.op, rval_str)


    def visit_Assignment(self, n):
        rval_str = self._parenthesize_if(
                            n.rvalue,
                            lambda n: isinstance(n, c_ast.Assignment))
        return '%s %s %s' % (self.visit(n.lvalue), n.op, rval_str)


    def visit_TernaryOp(self, n):
        s  = '(' + self._visit_expr(n.cond) + ') ? '
        s += '(' + self._visit_expr(n.iftrue) + ') : '
        s += '(' + self._visit_expr(n.iffalse) + ')'
        return s


    # Checks whether variable  v  from function  f  is an array.
    #
    def __isArray(self, f, v):
        if v in self.Parser.varNames[f] and self.Parser.varArity[f, v] > 0:
            return True
        elif v in self.Parser.varNames[''] and self.Parser.varArity['', v] > 0:
            return True
        else:
            return False

    def __isVariable(self, f, v):
        if v in self.Parser.varNames[f] and f not in self.Parser.structName:
            return True
        else:
            return False

    # Checks whether variable  v  from function  f  is a scalar.
    #
    def __isScalar(self, f, v):
        if v in self.Parser.varNames[f] and '*' not in self.Parser.varType[f, v] and self.Parser.varArity[f, v] == 0:
            return True
        elif v in self.Parser.varNames[''] and '*' not in self.Parser.varType['', v] and self.Parser.varArity['', v] == 0:
            return True
        else:
            return False

    # Checks whether variable  v  from function  f  is a pointer.
    #
    def __isPointer(self, f, v):
        if v in self.Parser.varNames[f] and self.Parser.varType[f, v].endswith('*'):
            return True
        elif v in self.Parser.varNames[''] and self.Parser.varType['', v].endswith('*'):
            return True
        else:
            return False

    # Checks whether variable  v  from function  f  is global.
    #
    def __isGlobal(self, f, v):
        if (v in self.Parser.varNames[''] and v not in self.Parser.varNames[f]):
            return True
        else:
            return False    






