from ply import yacc
from framaclog_lexer import LOGLexer
import framaclog_ast as log_ast

'''
TODO:
    -

ChangeLog:
    2016.09.13   Improve the compability with address type of Frama-C log
    2016.08.11   Initial version
'''


class LOGParser():
    def __init__(self):
        self.loglexer = LOGLexer()
        self.loglexer.build()
        self.tokens = self.loglexer.tokens
        self.logparser = yacc.yacc(module=self, start='File', errorlog=yacc.NullLogger())
        # self.logparser = yacc.yacc(module=self, start='File')

    def parse(self, text, filename='', debuglevel=0):
        self.loglexer.filename = filename
        return self.logparser.parse(input=text, lexer=self.loglexer, debug=debuglevel)

    def p_File(self, p):
        """ File : ValueEstimateList
        """
        p[0] = log_ast.File(p[1])

    def p_ValueEstimateList(self, p):
        """ ValueEstimateList : ValueEstimate
                              | ValueEstimateList ValueEstimate
        """
        p[0] = [p[1]] if len(p) == 2 else p[1] + [p[2]]

    def p_ValueEstimate(self, p):
        """ ValueEstimate : Variable IN Value
        """
        p[0] = log_ast.ValueEstimate(p[1], p[3])

    def p_Variable(self, p):
        """ Variable    :  ScalarVariable
                        |  ArrayVariable
                        |  StructVariable
        """
        p[0] = p[1]

    def p_ScalarVariable(self, p):
        """ ScalarVariable : IDENT
        """
        p[0] = log_ast.ScalarVariable(p[1])

    def p_ArrayVariable(self, p):
        """ ArrayVariable : Variable NumberRange
        """
        p[0] = log_ast.ArrayVariable(p[1], p[2])

    def p_NumberRange(self, p):
        """ NumberRange         : SingleRange
                                | DoubleRange
        """
        p[0] = p[1]

    def p_SingleRange(self, p):
        """ SingleRange : LBRACKET Number RBRACKET
        """
        p[0] = log_ast.SingleRange(p[2])

    def p_DoubleRange(self, p):
        """ DoubleRange : LBRACKET Number TO Number RBRACKET
        """
        p[0] = log_ast.DoubleRange(p[2], p[4])

    def p_Number(self, p):
        """ Number                  : DecNumber
                                    | HexNumber
                                    | Float
                                    | INFINITY
        """
        if p[1] == '--':
            p[0] = log_ast.Infinity()
        else:
            p[0] = p[1]

    def p_DecNumber(self, p):
        """ DecNumber               : Sign CONST_DEC
        """
        p[0] = p[1] + p[2]

    def p_Sign(self, p):
        """ Sign                    : empty
                                    | PLUS
                                    | MINUS
        """
        if p[1] is None:
            p[0] = ''
        else:
            p[0] = p[1]

    def p_Float(self, p):
        """ Float       : Sign FLOATING_CONSTANT
        """
        p[0] = p[1] + p[2]

    def p_HexNumber(self, p):
        """ HexNumber    : CONST_HEX
        """
        p[0] = p[1]

    def p_StructVariable(self, p):
        """ StructVariable  : Variable Field
                            | Variable LBRACE FieldList RBRACE
        """
        if len(p) == 3:
            p[0] = log_ast.StructVariable(p[1], [p[2]])
        else:
            p[0] = log_ast.StructVariable(p[1], p[3])

    def p_FieldList(self, p):
        """ FieldList   : FieldList SEMI Field
                        | Field
        """
        p[0] = [p[1]] if len(p) == 2 else p[1] + [p[3]]

    def p_Field(self, p):
        """ Field   : DOT Variable
        """
        p[0] = log_ast.Field(p[2])

    def p_Value(self, p):
        """ Value : ANYTHING
                   | ValueSet
                   | ValueRange
                   | ValueRangePeriodicity
                   | ValueMemSet
        """
        p[0] = p[1]

    def p_ValueSet(self, p):
        """ ValueSet    : LBRACE NumberList RBRACE
        """
        p[0] = log_ast.ValueSet(p[2])

    def p_NumberList(self, p):
        """ NumberList  : Number
                        | NumberList SEMI Number
        """
        p[0] = [p[1]] if len(p) == 2 else p[1] + [p[3]]

    def p_ValueRange(self, p):
        """ ValueRange : LBRACKET Number TO Number RBRACKET
        """
        p[0] = log_ast.ValueRange(p[2], p[4])

    def p_ValueRangePeriodicity(self, p):
        """ ValueRangePeriodicity : LBRACKET Number TO Number RBRACKET COMMA Number PERCENT Number
        """
        p[0] = log_ast.ValueRangePeriodicity(p[2], p[4], p[7], p[9])

    def p_ValueMemSet(self, p):
        """ ValueMemSet : LDBRACE MemExpressionList RDBRACE
        """
        p[0] = log_ast.ValueMemSet(p[2])

    def p_MemExpressionList(self, p):
        """ MemExpressionList   : MemExpression
                                | MemExpressionList SEMI MemExpression
        """
        p[0] = [p[1]] if len(p) == 2 else p[1] + [p[3]]

    def p_MemExpression(self, p):
        """ MemExpression   : NULL
                            | STRING_LITERAL
                            | AddressExpression
                            | ValueRangeExpression
                            | ValueRangePeriodicityExpression
                            | ValueSetExpression
                            | ComboExpression
        """
        if p[1] == 'NULL':
            p[0] = log_ast.NullExpression()
        else:
            p[0] = p[1]

    def p_AddressExpression(self, p):
        """ AddressExpression : AMBER AddressVariable
        """
        p[0] = p[2]

    def p_AddressVariable(self, p):
        """ AddressVariable    : AddressScalarVariable
                               | AddressCompoundVariable
        """
        p[0] = p[1]

    def p_AddressScalarVariable(self, p):
        """ AddressScalarVariable : IDENT
        """
        p[0] = log_ast.AddressScalarVariable(p[1])

    def p_AddressCompoundVariable(self, p):
        """ AddressCompoundVariable : IDENT LBRACE AddressFieldList RBRACE
                                    | IDENT Field
                                    | IDENT LBRACKET Number RBRACKET
        """
        if len(p) == 3:
            p[0] = log_ast.AddressCompoundVariable(p[1], [p[2]])
        else:
            if p[2] == '[':
                p[0] = log_ast.AddressCompoundVariable(p[1], [log_ast.AddressField(p[3])])
            else:
                p[0] = log_ast.AddressCompoundVariable(p[1], p[3])


    def p_AddressFieldList(self, p):
        """ AddressFieldList   : AddressFieldList COMMA AddressField
                               | AddressField
        """
        p[0] = [p[1]] if len(p) == 2 else p[1] + [p[3]]

    def p_AddressField(self, p):
        """ AddressField    : LBRACKET Number RBRACKET Field
                            | LBRACKET Number RBRACKET
                            | Field
        """
        if len(p) == 4:
            p[0] = log_ast.AddressField(p[2])
        elif len(p) == 5:
            p[0] = log_ast.AddressField(p[2], p[4])
        else:
            p[0] = p[1]

    def p_ValueRangeExpression(self, p):
        """ ValueRangeExpression : ValueRange
        """
        p[0] = p[1]

    def p_ValueRangePeriodicityExpression(self, p):
        """ ValueRangePeriodicityExpression : ValueRangePeriodicity
        """
        p[0] = p[1]

    def p_ValueSetExpression(self, p):
        """ ValueSetExpression : ValueSet
        """
        p[0] = p[1]

    def p_ComboExpression(self, p):
        """ ComboExpression   : MemExpression PLUS MemExpression
        """
        p[0] = log_ast.ComboExpression(p[1], p[3])

    def p_empty(self, p):
        'empty : '

    def p_error(self, p):
        if p is not None:
            raise TypeError("Parser: unknown text at line %s: %r" % (p.lineno, p.value))
        else:
            raise TypeError("Unexpected input")

def parse_file(filename):
    with open(filename) as f:
        text = f.read()
        parser = LOGParser()
        return parser.parse(text, filename)

if __name__ == '__main__':
    import sys, json
    result = parse_file(sys.argv[1])
    result.show( nodenames=True )
