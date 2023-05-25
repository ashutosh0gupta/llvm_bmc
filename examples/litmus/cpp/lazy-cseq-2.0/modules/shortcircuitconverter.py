""" Lazy-CSeq Shortcircuitconverter module
    written by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'shortcircuitconverter-0.1-2017.03.16'
"""
Transformation of conditional expression contain function call into short circuit operation
    A: expression that contains a function to inline ()
    B: any other expression
    cond = A || B; --> if (A) {cond = 1, goto <next>;} if(B) {cond = 1; goto <next>}
    cond = A && B; --> if (!A) {cond = 0, goto <next>;} if(!B) {cond = 0; goto <next>}

Prerequisites:
    - no  do..while  loops,
    - condition is already extracted by conditionextractor.py module (otherwise it won't harm)

TODO:

Changelog:
    2017.03.16  initial version

"""

import os, sys, getopt, time
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.module, core.parser, core.utils


class shortcircuitconverter(core.module.Translator):
    __shortcircuit = False
    __lvarname = ''
    __label = ''
    funcCallFound = False

    def _process_operand(self, n):
        ret = ''
        self.funcCallFound = False
        lval_str = self._parenthesize_if(n,
                                lambda d: not self._is_simple_node(d))
        if self.funcCallFound:
            if (self._is_simple_node(n) or
                    not isinstance(n, pycparser.c_ast.BinaryOp) or
                    n.op not in ('||', '&&',)
                    ):
                if n.op == '||':
                    ret += 'if (%s) {%s=1; goto %s;}\n' % (lval_str, self.__lvarname, self._label)
                if n.op == '&&':
                    ret += 'if (!(%s)) {%s=0; goto %s;}\n' % (lval_str, self.__lvarname, self._label)
            else:
                ret += self._visit_expr(n)
        else:
            if n.op == '||':
                ret += 'if (%s) {%s=1; goto %s;}\n' % (lval_str, self.__lvarname, self._label)
            if n.op == '&&':
                ret += 'if (!(%s)) {%s=0; goto %s;}\n' % (lval_str, self.__lvarname, self._label)
        return ret

    def visit_BinaryOp(self, n):
        if self.__shortcircuit:
            ret = ''
            ret += self._process_operand(n.left)
            ret += self._process_operand(n.right)
            return ret

        lval_str = self._parenthesize_if(n.left,
                            lambda d: not self._is_simple_node(d))
        rval_str = self._parenthesize_if(n.right,
                            lambda d: not self._is_simple_node(d))
        return '%s %s %s' % (lval_str, n.op, rval_str)

    def visit_Assignment(self, n):
        lval_str = self.visit(n.lvalue)
        self.__shortcircuit = False
        self.__lvarname = ''
        self.__label = ''
        if ((lval_str.startswith("__cs_tmp_if_cond_") or lval_str.startswith("__cs_tmp_while_cond_") or lval_str.startswith("__cs_tmp_for_cond_")) and
            isinstance(n.rvalue, pycparser.c_ast.BinaryOp) and (n.rvalue.op == '&&' or n.rvalue.op == '||')):
            self.__shortcircuit = True
            self.__lvarname = lval_str
            self.__label = lval_str + '_label'
            rval_str = self._visit_expr(n.rvalue)
            return rval_str + '%s:' % self.__label

        rval_str = self._parenthesize_if(n.rvalue, lambda n: isinstance(n, pycparser.c_ast.Assignment))
        return '%s %s %s' % (lval_str, n.op, rval_str)

    def visit_FuncCall(self, n):
        fref = self._parenthesize_unless_simple(n.name)
        args = self.visit(n.args)

        if fref in self.Parser.funcBody:
            self.funcCallFound = True

        inl = fref + '(' + args + ')'

        return inl


