""" Lazy-CSeq SSA converter module
    maintained by Truc Nguyen Lam, University of Southampton
"""
VERSION = 'ssaconverter-0.1-2016.09.05'
"""
Transformation:
    SSA Transformation of bounded program
    Based on "Simple and Efficient Construction of Static Single Assignment Form" paper:

    1. Local variable numbering (in basic block)
    2. Global variable numbering (not in interest since this is eventually a concurrent program)
    4. Optimization (on the fly)
    5. Definition of Phi-functions

Prerequisites:
    - all functions should have been in-lined, except
        the main(),
        all thread functions,
        all __CSEQ_atomic_ functions,
        and function __CSEQ_assert
    - all loops should have been unrolled
    - no two threads refers to the same thread function (use module duplicator.py)

Limitation:
    - Multiple assignment is not support

Changelog:
    2016.09.05  1st version
"""

import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.common, core.module, core.parser, core.utils


class ssaconverter(core.module.Translator):
    __currentDef = {}          # store current definition of variable
    __currentFunction = ''

    def loadfromstring(self, string, env):
        super(self.__class__, self).loadfromstring(string, env)

    def visit_FuncDef(self, n):
        self.__currentFunction = n.decl.name
        self.__currentDef[self.__currentFunction] = {}
        decl = self.visit(n.decl)
        self.indent_level = 0
        body = self.visit(n.body)
        self.__currentFunction = ''
        if n.param_decls:
            knrdecls = ';\n'.join(self.visit(p) for p in n.param_decls)
            return decl + '\n' + knrdecls + ';\n' + body + '\n'
        else:
            return decl + '\n' + body + '\n'

    def visit_If(self, n):
        s = 'if ('
        if n.cond: s += self.visit(n.cond)
        s += ')\n'
        s += self._generate_stmt(n.iftrue, add_indent=True)
        if n.iffalse:
            s += self._make_indent() + 'else\n'
            s += self._generate_stmt(n.iffalse, add_indent=True)
        return s

    def visit_Label(self, n):
        return n.name + ':\n' + self._generate_stmt(n.stmt)

    def visit_Goto(self, n):
        return 'goto ' + n.name + ';'


    def visit_Decl(self, n, no_type=False):
        # no_type is used when a Decl is part of a DeclList, where the type is
        # explicitly only for the first declaration in a list.
        #
        s = n.name if no_type else self._generate_decl(n)
        if self.__currentFunction != '':
            self.__currentDef[self.__currentFunction][block]
        if n.bitsize: s += ' : ' + self.visit(n.bitsize)
        if n.init:
            s += ' = ' + self._visit_expr(n.init)
        return s
















