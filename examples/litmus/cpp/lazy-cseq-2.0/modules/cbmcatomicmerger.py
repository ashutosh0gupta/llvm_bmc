""" CSeq C Sequentialization Framework
    function cbmcatomicmerger

    written by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'cbmcatomicmerger-2017.02.10'
"""
    Merge atomic regions (__CSEQ_atomic_begin ... __CSEQ_atomic_end)


TODO:

Changelog:
    2017.02.10   Initial version

"""
import core.common, core.module
import pycparser.c_ast


class cbmcatomicmerger(core.module.Translator):
    __currentThread = ''
    __atomicRegionCount = -1

    def visit_FuncDef(self, n):
        if (n.decl.name.startswith('__CSEQ_atomic_') or
            n.decl.name == '__CSEQ_assert' or
            n.decl.name in self.Parser.funcReferenced ):
            self.__currentThread = n.decl.name
            decl = self.visit(n.decl)
            self.__atomicRegionCount = -1
            body = self.visit(n.body)
            s = decl + '\n' + body + '\n'
            self.__currentThread = ''
            return s

        self.__currentThread = n.decl.name
        decl = self.visit(n.decl)
        self.indent_level = 0
        self.__atomicRegionCount = -1
        body = self.visit(n.body)
        f = ''
        if n.param_decls:
            knrdecls = ';\n'.join(self.visit(p) for p in n.param_decls)
            #body = body[:body.rfind('}')] + self._make_indent() + returnStmt + '\n}'
            f = decl + '\n' + knrdecls + ';\n'
        else:
            #body = body[:body.rfind('}')] + self._make_indent() + returnStmt + '\n}'
            f = decl + '\n'

        f += body + '\n'
        self.__currentThread = ''
        return f + '\n\n'

    def visit_FuncCall(self, n):
        fref = self._parenthesize_unless_simple(n.name)
        args = self.visit(n.args)

        if fref == '__CSEQ_atomic_begin':
            self.__atomicRegionCount += 1
            if self.__atomicRegionCount > 0:
                return ''
        elif fref == '__CSEQ_atomic_end':
            self.__atomicRegionCount -= 1
            if self.__atomicRegionCount >= 0:
                return ''

        return fref + '(' + args + ')'
