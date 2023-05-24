from ply import lex
from ply.lex import TOKEN


class LOGLexer():
    def __init__(self):
        self.filename = ''
        self.last_token = None

    # List of token names.
    keywords = (
        'IN',
        'NULL',
        'ANYTHING'
    )

    keyword_map = {}
    for keyword in keywords:
        keyword_map[keyword] = keyword

    tokens = keywords + (
        'INFINITY',
        'SEMI',
        'LDBRACE',
        'LBRACE',
        'LBRACKET',
        'RDBRACE',
        'RBRACE',
        'RBRACKET',
        'TO',
        'DOT',
        'AMBER',
        'COMMA',
        'PERCENT',
        'COLON',
        'PLUS',
        'MINUS',
        'IDENT',
        'STRING_LITERAL',
        'CONST_DEC',
        'CONST_HEX',
        'FLOATING_CONSTANT'
        )

    # Regular expression rules for simple tokens
    t_IN                    = r'IN'
    t_NULL                  = r'NULL'
    t_ANYTHING              = r'ANYTHING'
    t_INFINITY              = r'--'
    t_SEMI                  = r';'
    t_LDBRACE               = r'\{\{'
    t_LBRACE                = r'\{'
    t_LBRACKET              = r'\['
    t_RDBRACE               = r'\}\}'
    t_RBRACE                = r'\}'
    t_RBRACKET              = r'\]'
    t_TO                    = r'\.\.'
    t_DOT                   = r'\.'
    t_AMBER                 = r'\&'
    t_COMMA                 = r','
    t_PERCENT               = r'\%'
    t_COLON                 = r':'
    t_PLUS                  = r'\+'
    t_MINUS                 = r'-'

    simple_escape = r"""([a-zA-Z._~!=&\^\-\\?'"])"""
    decimal_escape = r"""(\d+)"""
    hex_escape = r"""(x[0-9a-fA-F]+)"""
    bad_escape = r"""([\\][^a-zA-Z._~^!=&\^\-\\?'"x0-7])"""

    escape_sequence = r"""(\\("""+simple_escape+'|'+decimal_escape+'|'+hex_escape+'))'
    # string literals (K&R2: A.2.6)
    string_char = r"""([^"\\\n]|"""+escape_sequence+')'
    string_literal = '"'+string_char+'*"'
    identifier          = r'[a-zA-Z_$][0-9a-zA-Z_$]*'
    # Number
    hex_prefix          = r'0x'
    hex_digits          = r'[0-9a-fA-F]+'
    hex_constant        = hex_prefix + hex_digits
    decimal_constant    = r'''(0)|([1-9][0-9]*)'''
    # float
    floating_constant   = r'''([0-9]+\.[0-9]+)([eE][-+]?[0-9]+)?'''
    # String

    def t_newline(self, t):
        r'\n+'
        t.lexer.lineno += len(t.value)

    t_ignore  = ' \t'

    # A regular expression rule with some action code
    @TOKEN(string_literal)
    def t_STRING_LITERAL(self, t):
        return t

    @TOKEN(identifier)
    def t_IDENT(self, t):
        t.type = self.keyword_map.get(t.value, 'IDENT')
        return t

    @TOKEN(floating_constant)
    def t_FLOATING_CONSTANT(self, t):
        return t

    @TOKEN(hex_constant)
    def t_CONST_HEX(self, t):
        return t

    @TOKEN(decimal_constant)
    def t_CONST_DEC(self, t):
        return t

    def t_comment(self, t):
        r'(/\*(.|\n)*?\*/)|(//.*)'
        pass

    def t_error(self, t):
        raise TypeError("Lexer: unknown text (%s)" % (t.value,))

    # Build the lexer
    def build(self, **kwargs):
        self.lexer = lex.lex(object=self, **kwargs)

    def input(self, text):
        self.lexer.input(text)

    def token(self):
        self.last_token = self.lexer.token()
        return self.last_token