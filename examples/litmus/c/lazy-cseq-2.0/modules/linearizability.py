""" CSeq C Sequentialization Framework
    linearizability module
    written by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'linearizability-2017.04.03' # initial version
"""
Description:
    This module instruments linearizability (forward simulation).
    For more details, please refer to https://arxiv.org/abs/1702.02705

    Parse string inside __CSEQ_rawline to identify linearization point
    Write to a header file linearizability instrumentation

    Overview of Linearizability module

    Sourcefile -> instrument ->

TODO:
    - Receive parameters (MAX_PUSHES, etc.)
    - Insert linearization point (manually or automatically)

Changelog:
    2017.04.03  1st version
"""
import core.common, core.module, core.utils


class linearizability(core.module.Translator):
    def init(self):
        self.addInputParam('li-max-add', 'maximum number of add (push or enqueue) action', 'p', '1', False)
        self.addInputParam('li-max-id-remove', 'maximum id of remove (pop or dequeue) actions', 'p', '1', False)
        self.addInputParam('li-max-clock', 'maximum clock tick', 'p', '1', False)
        self.addInputParam('li-data-type', 'data type (please wrap in \"\" if there is space in data type)', 'p', 'int', False)
        # TODO(me): add thread simulation
        # self.addInputParam('li-simulate', 'automatically simulate by configuration file', '', '', False)

    def loadfromstring(self, string, env):
        # backend = self.getInputParamValue('backend')
        MAX_PUSHES = int(self.getInputParamValue('li-max-add'))
        MAX_ID_POP = int(self.getInputParamValue('li-max-id-remove'))
        MAX_CLOCK = int(self.getInputParamValue('li-max-clock'))
        data_type = self.getInputParamValue('li-data-type')

        super(self.__class__, self).loadfromstring(string, env)

        header = core.utils.printFile("modules/linearizability.c")

        header = header.replace("<insert-max_pushes-here>", str(MAX_PUSHES))
        header = header.replace("<insert-max_id_pop-here>", str(MAX_ID_POP))
        header = header.replace("<insert-max_clock-here>", str(MAX_CLOCK))

        header = header.replace("<insert-data_type>", data_type)

        # inside function __VERIFIER_atomic_call_ADD_annotation
        nb_pushes_increment = ''
        for i in range(0, MAX_PUSHES):
            nb_pushes_increment += '    nb_pushes_started_after_time[%s] += (clock >= %s);\n' % (i, i)
        header = header.replace("<update-nb_pushes-increment>", nb_pushes_increment)

        nb_pending_pushes_increment = ''
        for i in range(0, MAX_PUSHES):
            nb_pending_pushes_increment += '    nb_pending_pushes_started_after_time[%s] += (clock >= %s);\n' % (i, i)
        header = header.replace("<update-nb_pending_pushes-increment>", nb_pending_pushes_increment)

        # inside function __VERIFIER_atomic_return_ADD_annotation
        header = header.replace("<insert-id_check-here>", ' & '.join(['ids[%s] != id' % i for i in range(0, MAX_PUSHES)]))

        nb_pending_pushes_decrement = ''
        for i in range(0, MAX_PUSHES):
            nb_pending_pushes_decrement += '    nb_pending_pushes_started_after_time[%s] -= ( time_at_call[i] >= %s);\n' % (i, i)
        header = header.replace("<update-nb_pending_pushes-decrement>", nb_pending_pushes_decrement)

        # inside function __VERIFIER_atomic_remove_empty_annotation
        assert_empty = ' & '.join(['(existence[%s] == 0 | finished[%s] == 0 | pop_time_at_call[id] <= time_at_return[%s])' % (i, i, i) for i in range(0, MAX_PUSHES)])
        header = header.replace("<insert-assert-empty>", assert_empty)

        # inside function __VERIFIER_atomic_remove_annotation
        assert_existence = ' | '.join(['(existence[%s] == 1 & values[%s] == value)' % (i, i) for i in range(0, MAX_PUSHES)])
        header = header.replace("<insert-assert-existence>", assert_existence)

        nb_pushes_decrement = ''
        for i in range(0, MAX_PUSHES):
            nb_pushes_decrement += '    nb_pushes_started_after_time[%s] -= ( time_at_call[i] >= %s);\n' % (i, i)
        header = header.replace("<update-nb_pushes-decrement>", nb_pushes_decrement)

        nb_pending_pushes_remove_increment = ''
        for i in range(0, MAX_PUSHES):
            nb_pending_pushes_remove_increment += '        nb_pending_pushes_started_after_time_removed[%s] += (time_at_call[i] >= %s);\n' % (i, i)
        header = header.replace("<update-nb_pending_pushes_remove-increment>", nb_pending_pushes_remove_increment)

        # Write to a header file, later get inserted by instrument module
        headerfilename = env.inputfile[:-2] + '_li.h'
        core.utils.saveFile(headerfilename, header)
        self.setOutputParam('liheader', headerfilename)

    def visit_FuncCall(self, n):
        # Looking for Linearization point, by __CSEQ_rawline
        fref = self._parenthesize_unless_simple(n.name)
        if fref == '__CSEQ_rawline':
            text = self.visit(n.args).strip('"')
            if text.startswith("@linear"):   # Only consider @linear at the moment
                text = text[8:]
                return text.replace("__VERIFIER_", "__CSEQ_")

        return fref + '(' + self.visit(n.args) + ')'
