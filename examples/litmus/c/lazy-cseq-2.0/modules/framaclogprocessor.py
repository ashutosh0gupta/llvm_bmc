""" CSeq C Sequentialization Framework
    framac log parser

    written by Truc Nguyen Lam, University of Southampton.
"""
VERSION = 'framaclogparser-2016.08.15' #
"""

TODO:
    - Need to calculate transitive closure of related variable (in terms of assignment and comparison)

Changelog:
    2016.11.30  fix for
    2016.10.06  fix for Safestack static on variable name __cs_local_thread_idx (there are many instances of this variable)
    2016.09.16  make the rule of apply bit less strict (by look at fib_longest_false), should not have __CPROVER_bitvector[32], why not use int
    2016.08.17  add quick ad-hoc for array fix
    2016.08.15  Initial version

"""

import math, re, os.path
from time import gmtime, strftime
import pycparser.c_parser, pycparser.c_ast, pycparser.c_generator
import core.common, core.module, core.parser, core.utils

import framaclog_parser as log_parser
import framaclog_ast as log_ast

class framaclogprocessor(core.module.Translator):
    __variable_ref = {}
    __related_ptr_array = {}

    def init(self):
        self.addInputParam('framaclog', 'log file from analysis of Frama-C', 'u', None, True)
        self.addOutputParam('preanalysis')

    def loadfromstring(self, string, env):
        logfile = self.getInputParamValue('framaclog')
        super(self.__class__,self).loadfromstring(string, env)

        ''' Part 1+2
            Dectection of OUTPUT, only pick the results after main (if applicable)
            Preprocess OUTPUT, padding and removing redundant line
        '''
        data = {}


        if logfile is None:   # meaning default option
            return

        if not os.path.isfile(logfile):
            self.error("please provide the correct file from Frama-C analysis, %s" % logfile)

        begin_milestone = 'Values at end of function main:'
        end_milestone = '__retres IN {0}'
        hasRecord = False
        error_milestone = 'NON TERMINATING FUNCTION'
        warning_milestone = 'Cannot filter: dumping raw memory'

        processed_text = ''
        memoiz = ''
        with open(logfile, "r") as infile:
            i = 0
            for line in list(infile):
                i += 1
                if warning_milestone in line: continue
                elif begin_milestone in line:
                    hasRecord = True
                    continue
                elif end_milestone in line:
                    hasRecord = False
                if hasRecord:
                    # remove cast (void *)
                    if error_milestone in line: break
                    line = line.replace("(void *)", "")     # remove junk
                    if 'IN' not in line:
                        processed_text += ' ' + line.strip()
                    else:
                        ''' Padding variable in case of structure '''
                        if line.strip()[0] in ('.', '[', '{'):
                            if memoiz == '': self.error("error in line %s of log file, variable not defined" % i)
                            else: processed_text += '\n' + memoiz + line.strip()
                        else:   # there is a variable to remember
                            l = line.strip()
                            memoiz = l[:l.find(' IN')]
                            # strip out the remaining index or field
                            temp = ''
                            for c in memoiz:
                                if c not in ('.', '[', '{'): temp += c
                                else: break
                            memoiz = temp
                            processed_text += '\n' + line.strip()


        ''' Part 3
            Parse OUTPUT and store in a Dictionary for later module
        '''
        if processed_text != '':
            newprocessed_text = ''
            for line in processed_text.splitlines():
                if ("garbled mix of" not in line and
                        "alloced_return_malloc" not in line and
                        ".[bits " not in line    # ignore weird .[bits 80 to 95] syntax
                    ):
                    newprocessed_text += line + '\n'

            if env.debug:
                seqfile = core.utils.rreplace(env.inputfile, '/', '/_cs_', 1) if '/' in env.inputfile else '_cs_' + env.inputfile
                if env.outputfile is not None and env.outputfile != '':
                    seqfile = env.outputfile
                logfile = seqfile + '.framac.log.preprocessed'
                with open(logfile, "w") as logfile:
                    logfile.write(newprocessed_text)

            data['scalar'] = {}
            data['pointer'] = {}
            data['array'] = {}
            data['struct'] = {}
            logParser = log_parser.LOGParser()
            try:
                logast = logParser.parse(newprocessed_text, logfile)
                # logast.show()
                self._postprocessing(logast, data)
            except TypeError as e:
                if env.debug:
                    self.warn("Parse framalog error\n%s\n" % str(e))
        self.setOutputParam('preanalysis', data)

    def _find_node(self, node):
        if isinstance(node, log_ast.StructVariable):
            self.warn("struct in normal node")
            return None
        elif isinstance(node, log_ast.ScalarVariable):
            return node
        else:
            return self._find_node(node.variable)

    def _look_up_variable_type(self, name):
        for f in self.Parser.funcName:
            if name in self.Parser.varNames[f]:
                return self.Parser.varType[f, name]
        return None

    def _look_up_field_type(self, name):
        for f in self.Parser.structName:
            if name in self.Parser.varNames[f]:
                return self.Parser.varType[f, name]
        return None

    def _lookup_field_in_struct(self, field, dict, originaldict):
        if field.variable is None:
            return 0
        else:
            if isinstance(field.variable, log_ast.ScalarVariable):
                if field.variable.name in dict:
                    return dict[field.variable.name]
                else:
                    return 0
            elif isinstance(field.variable, log_ast.ArrayVariable):
                scalarNode = self._find_node(field.variable.variable)
                if scalarNode is not None:
                    if scalarNode.name in dict:
                        return dict[scalarNode.name]
                    else:
                        return 0
                else:
                    return 0
            elif isinstance(field.variable, log_ast.StructVariable):
                scalarNode = self._find_node(field.variable.variable)
                varType = self._look_up_field_type(scalarNode.name)
                if varType is not None:
                    # extract struct or union from type
                    varType = varType.replace("struct ", "").strip()
                    varType = varType.replace("union ", "").strip()

                    # Identify the field of struct
                    numbit = 0
                    for field in field.variable.fields:
                        numbit = max(self._lookup_field_in_struct(field, originaldict[varType], originaldict), numbit)
                    return numbit
                else:
                    return 0
            else:
                return 0

    def _set_field_for_struct(self, field, dict, numbit, originaldict):
        if isinstance(field.variable, log_ast.ScalarVariable):
            if field.variable.name not in dict:
                dict[field.variable.name] = numbit
            elif dict[field.variable.name] > 0:
                dict[field.variable.name] = max(dict[field.variable.name], numbit)
        elif isinstance(field.variable, log_ast.ArrayVariable):
            scalarNode = self._find_node(field.variable.variable)
            if scalarNode is not None:
                if scalarNode.name not in dict:
                    dict[scalarNode.name] = numbit
                elif dict[scalarNode.name] > 0:
                    dict[scalarNode.name] = max(dict[scalarNode.name], numbit)
        elif isinstance(field.variable, log_ast.StructVariable):
            scalarNode = self._find_node(field.variable.variable)
            varType = self._look_up_field_type(scalarNode.name)
            if varType is not None:
                # extract struct or union from type
                varType = varType.replace("struct ", "").strip()
                varType = varType.replace("union ", "").strip()

                if varType not in originaldict:
                    originaldict[varType] = {}
                # Identify the field of struct
                for field in field.variable.fields:
                    self._set_field_for_struct(field, originaldict[varType], numbit, originaldict)

    def _compression(self, data):
        ''' Merger variable name together, fix for multiple instances of variables
        '''
        templist = data['scalar'].keys()
        templist.sort()   # sort the list
        # print templist
        if len(templist) > 0:
            tempkey = templist[0]
            maxnumbit = data['scalar'][tempkey]
            # print tempkey, maxnumbit
            for i in range (1, len(templist)):
            	ret = templist[i].find(tempkey+'_')
            	# print tempkey, templist[i]
                if ret != -1 and templist[i][ret+len(tempkey)+1:].isdigit():
                    maxnumbit = max(maxnumbit, data['scalar'][templist[i]])
                    data['scalar'][tempkey] = maxnumbit
                    # print "find:", templist[i], maxnumbit
                else:
                    tempkey = templist[i]
                    maxnumbit = data['scalar'][tempkey]
                    # print tempkey, maxnumbit


    def _postprocessing(self, logast, data):
        for entry in logast.valueEstimateList:
            variable = entry.variable
            if isinstance(variable, log_ast.ScalarVariable):   # Scalar variable
                # print variable.name
                numbit = self._guess_numbit(entry.value, data)
                if numbit == 0: continue
                # ??? Why ignoring this variable if it is used in & operation
                if variable.name in self.__variable_ref:
                    continue
                originvarname = variable.name
                data['scalar'][originvarname] = numbit
            elif isinstance(variable, log_ast.ArrayVariable):
                # Identify the variable, exclude number range
                numbit = self._guess_numbit(entry.value, data)
                if numbit == 0: continue
                scalarNode = self._find_node(variable.variable)
                if scalarNode is not None:
                    if scalarNode.name not in data['array']:
                        data['array'][scalarNode.name] = numbit
                    elif data['array'][scalarNode.name] > 0:
                        data['array'][scalarNode.name] = max(data['array'][scalarNode.name], numbit)

                    # Find all pointer related to this variable (only in the right hand side of assignment)
                    if scalarNode.name in self.__related_ptr_array:
                        for ptr in self.__related_ptr_array[scalarNode.name]:
                            if ' *' in self._look_up_variable_type(ptr):
                                data['pointer'][ptr] = data['array'][scalarNode.name]

            elif isinstance(variable, log_ast.StructVariable):
                numbit = self._guess_numbit(entry.value, data)
                # Remap numbit to the multiple of 8 (for struct ref)
                if numbit == 0 or numbit > 24: continue
                elif numbit > 0 and numbit <= 8: numbit = 8
                elif numbit > 8 and numbit <= 16: numbit = 16
                elif numbit > 16 and numbit <= 24: numbit = 24
                else: continue

                # Identify the struct name
                # Identify the variable that is defined by struct
                scalarNode = self._find_node(variable.variable)
                if scalarNode is not None:
                    varname = scalarNode.name
                    # Look up variable information in the parser to find type
                    varType = self._look_up_variable_type(varname)
                    if varType is not None:
                        # extract struct or union name from type
                        varType = varType.replace("struct ", "").strip()
                        varType = varType.replace("union ", "").strip()
                        if varType not in data['struct']:
                            data['struct'][varType] = {}         # Add struct name to data
                        # Identify the field of struct
                        for field in variable.fields:
                            self._set_field_for_struct(field, data['struct'][varType], numbit, data['struct'])
            else:  # What can be else?
                pass

        # After process all variable, compress the set
        self._compression(data)
        # print data

    def _guess_numbit(self, value, data):
        ''' Return the estimation of number of bit requiring to represent data
        '''
        if isinstance(value, log_ast.ValueSet):
            ''' {a; b; c; d; ..} '''
            if len(value.numberList) >= 2:
                if value.numberList[0] == '0' and value.numberList[-1] == '1':
                    return 2    # Boolean
                maxvalue = max(abs(core.utils.string_to_number(value.numberList[0])), abs(core.utils.string_to_number(value.numberList[-1])))
                k = int(math.floor(math.log(maxvalue, 2))) + 1
                if k >= 24:
                    return 0
                return k + 1
            elif len(value.numberList) == 1:
                number = core.utils.string_to_number(value.numberList[0])
                if number == 0:
                    return 2
                k = int(math.floor(math.log(abs(number), 2))) + 1
                if k >= 24:          # more than an integer already
                    return 0
                return k + 1
            else:
                self.error("error in value")
                return 0
        elif isinstance(value, log_ast.ValueRange):
            ''' [a .. b] '''
            if isinstance(value.left, log_ast.Infinity) or isinstance(value.right, log_ast.Infinity):
                return 0
            maxvalue = max(abs(core.utils.string_to_number(value.left)), abs(core.utils.string_to_number(value.right)))
            k = int(math.floor(math.log(maxvalue, 2))) + 1
            if k >= 24:
                return 0
            return k + 1
        elif isinstance(value, log_ast.ValueMemSet):
            ''' Memory expression '''
            numbit = 0
            for val in value.memExpressionList:
                if isinstance(val, log_ast.NullExpression):
                    continue
                else:
                    if isinstance(val, log_ast.AddressScalarVariable):
                        originvarname = val.variable
                        if originvarname in data['scalar']:
                            numbit = data['scalar'][originvarname]
                    elif isinstance(val, log_ast.AddressCompoundVariable):
                        # For each field in the compound, look up there value
                        for field in val.fields:
                            if isinstance(field, log_ast.AddressField):   # This is an element in array
                                if field.variable is None:            # If there is no field
                                    if val.variable in data['array']:
                                        numbit = data['array'][val.variable]
                                else:                 # If there is field (this means an array to structure)
                                    varType = self._look_up_variable_type(val.variable)   # Find node
                                    if varType is not None:
                                        # extract struct or union name from type
                                        varType = varType.replace("struct ", "").strip()
                                        varType = varType.replace("union ", "").strip()
                                        if varType in data['struct']:
                                            # Look up the field of struct
                                            numbit = self._lookup_field_in_struct(field.variable, data['struct'][varType], data['struct'])
                            else:   # This is variable in struct
                                varType = self._look_up_variable_type(val.variable)   # Find node
                                if varType is not None:
                                    # extract struct or union name from type
                                    varType = varType.replace("struct ", "").strip()
                                    varType = varType.replace("union ", "").strip()
                                    if varType in data['struct']:
                                        # Look up the field of struct
                                        numbit = self._lookup_field_in_struct(field, data['struct'][varType], data['struct'])
                    else:   # ignore other cases: TODO
                        pass
            return numbit
        return 0

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
            if n.op == '&':
                self.__variable_ref[operand] = True
            return '%s%s' % (n.op, operand)

    def __isGlobalArray(self, v):
        key = ('', v)
        if key in self.Parser.varArity and self.Parser.varArity[key] > 0: return True
        else: return False

    def visit_Assignment(self, n):
        rval_str = self._parenthesize_if(n.rvalue, lambda n: isinstance(n, pycparser.c_ast.Assignment))
        lval_str = self.visit(n.lvalue)
        if self.__isGlobalArray(rval_str):
            if rval_str not in self.__related_ptr_array:
                self.__related_ptr_array[rval_str] = []
            self.__related_ptr_array[rval_str].append(lval_str)

        return '%s %s %s' % (lval_str, n.op, rval_str)

