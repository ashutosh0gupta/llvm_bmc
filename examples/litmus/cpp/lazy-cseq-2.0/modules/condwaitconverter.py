""" Lazy-CSeq conditional wait converter module
"""
VERSION = 'condwaitconverter-0.0-2015.07.10'
"""
Transformation:
	Simply split __cs_cond_wait() into two separate function calls,
	to add one context-switch point in __cs_cond_wait().

	This is required by lazyseq module.

TODO:
	this module runs very slow

Changelog:
	2016.10.05  add support for pthread barrier wait function call (experimental)
	2015.07.10  1st version
"""
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.common, core.module, core.parser, core.utils


class condwaitconverter(core.module.Translator):
    def visit_FuncCall(self, n):
		fref = self._parenthesize_unless_simple(n.name)
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
		return super(self.__class__, self).visit_FuncCall(n)


