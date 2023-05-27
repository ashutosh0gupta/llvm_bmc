""" CSeq C Sequentialization Framework
    function tracker module

    written by Omar Inverso, University of Southampton.
"""
VERSION = 'functiontracker-2015.07.02' # merged with errorlabel-0.0-2015.06.25
#VERSION = 'preinstrumenter-0.0-2015.06.25'
"""
    Optimization:
    Fix incorrect __VERIFIER_atomic_end call (which does not occur to the same control flow block
            with __VERIFIER_atomic_begin

Changelog:
    2016.12.06  Add fix for __VERIFIER_atomic_end function (just to make this module more involved)

"""
import core.common, core.module
import pycparser.c_ast

class functiontracker(core.module.Translator):
    currentfunctionname = ''
    inputcoordstofunctions = {}
    hasAtomicBegin = []

    def init(self):
        self.addOutputParam('coordstofunctions')

    def loadfromstring(self, string, env):
        super(self.__class__,self).loadfromstring(string, env)
        self.setOutputParam('coordstofunctions', self.inputcoordstofunctions)

    def visit(self,node):
        if hasattr(node, 'coord') and self.currentInputLineNumber!=0 and self.currentfunctionname!='':
            #print "function %s, coords: %s" % (self.currentfunctionname,self.currentInputLineNumber)
            #print "function %s, origincoords: %s" % (self.currentfunctionname,self._mapbacklineno(self.currentInputLineNumber))
            self.inputcoordstofunctions[self._mapbacklineno(self.currentInputLineNumber)] = self.currentfunctionname

        s = super(self.__class__,self).visit(node)

        return s

    def visit_FuncDef(self,n):
        self.currentfunctionname = n.decl.name

        s = super(self.__class__, self).visit_FuncDef(n)
        self.currentfunctionname = ''

        return s

    def visit_Compound(self, n):
        s = self._make_indent() + '{\n'
        self.indent_level += 1

        if n.block_items:
            self.hasAtomicBegin.append(False)
            for stmt in n.block_items:
                k = self._generate_stmt(stmt)
                if '__VERIFIER_atomic_begin()' in k:
                    self.hasAtomicBegin[-1] = True
                if not self.hasAtomicBegin[-1] and '__VERIFIER_atomic_end()' in k:
                    # self.warn("__VERIFIER_atomic_end is not in the same block.\n")
                    k = k.replace('atomic_end', 'UNBOUNDED', 1)
                s += k
            self.hasAtomicBegin.pop()

        self.indent_level -= 1
        s += self._make_indent() + '}\n'

        return s
