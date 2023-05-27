""" Lazy-CSeq atomic merger (+ cond_wait converter) module
    maintained by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'atomicmerger-0.0-2015.07.10'
"""
Transformation:
    Simply split __cs_cond_wait() into two separate function calls,
    to add one context-switch point in __cs_cond_wait().

    This is required by lazyseq module.

    Now this module will also perform
        Merge atomic regions (__CSEQ_atomic_begin ... __CSEQ_atomic_end)


TODO:
    this module runs very slow

Changelog:
    2017.02.15  initial version (starting from condwaitconverter)
    2016.10.05  add support for pthread barrier wait function call (experimental)
    2015.07.10  1st version
"""
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.common, core.module, core.parser, core.utils


class atomicmerger(core.module.Translator):
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

        # New transformation
        if fref == '__CSEQ_atomic_begin':
            self.__atomicRegionCount += 1
            if self.__atomicRegionCount > 0:
                return ''
        if fref == '__CSEQ_atomic_end':
            self.__atomicRegionCount -= 1
            if self.__atomicRegionCount >= 0:
                return ''

        # int pthread_cond_wait(pthread_cond_t *cond,pthread_mutex_t *mutex);
        ##if fref != 'pthread_cond_wait':
        if (fref == core.common.changeID['pthread_cond_wait'] or
                fref == core.common.changeID['pthread_cond_timedwait']):
            #args = self.visit(n.args)
            c = self.visit(n.args.exprs[0])
            m = self.visit(n.args.exprs[1])

            out = ''
            out += '__cs_cond_wait_1(%s,%s);\n' % (c,m)
            out += '__cs_cond_wait_2(%s,%s);\n' % (c,m)
            return out

        if (fref == core.common.changeID['pthread_barrier_wait']):
            c = self.visit(n.args)
            out = ''
            out += '__cs_barrier_wait_1(%s);\n' % (c)
            out += '__cs_barrier_wait_2(%s);\n' % (c)
            return out

        return fref + '(' + self.visit(n.args) + ')'
