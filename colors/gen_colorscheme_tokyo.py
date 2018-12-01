import collections
import io


GROUPS = [
    {'group': 'Boolean',                    'ctermfg': 208,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'ColorColumn',                'ctermfg': None, 'ctermbg': 234,  'cterm': 'NONE'},
    {'group': 'CommandTCharMatched',        'ctermfg': 208,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Comment',                    'ctermfg': 246,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Conceal',                    'ctermfg': 7,    'ctermbg': 242,  'cterm': 'NONE'},
    {'group': 'Constant',                   'ctermfg': 13,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'CursorColumn',               'ctermfg': None, 'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'CursorLine',                 'ctermfg': None, 'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'CursorLineNr',               'ctermfg': 234,  'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'Define',                     'ctermfg': 33,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'DiffAdd',                    'ctermfg': None, 'ctermbg': 4,    'cterm': 'NONE'},
    {'group': 'DiffChange',                 'ctermfg': None, 'ctermbg': 5,    'cterm': 'NONE'},
    {'group': 'DiffDelete',                 'ctermfg': 12,   'ctermbg': 6,    'cterm': 'NONE'},
    {'group': 'DiffText',                   'ctermfg': None, 'ctermbg': 9,    'cterm': 'NONE'},
    {'group': 'Directory',                  'ctermfg': 159,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'EasyMotionTarget',           'ctermfg': 159,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'EasyMotionTarget2First',     'ctermfg': 159,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'EasyMotionTarget2Second',    'ctermfg': 159,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Error',                      'ctermfg': 15,   'ctermbg': 9,    'cterm': 'NONE'},
    {'group': 'ErrorMsg',                   'ctermfg': 196,  'ctermbg': 0,    'cterm': 'NONE'},
    {'group': 'FoldColumn',                 'ctermfg': 241,  'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'Folded',                     'ctermfg': 243,  'ctermbg': 238,  'cterm': 'NONE'},
    {'group': 'Function',                   'ctermfg': 35,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Identifier',                 'ctermfg': 208,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Ignore',                     'ctermfg': 0,    'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'IncSearch',                  'ctermfg': 160,  'ctermbg': 3,    'cterm': 'NONE'},
    {'group': 'LineNr',                     'ctermfg': 241,  'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'MatchParen',                 'ctermfg': None, 'ctermbg': 237,  'cterm': 'NONE'},
    {'group': 'ModeMsg',                    'ctermfg': None, 'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'MoreMsg',                    'ctermfg': 121,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'NonText',                    'ctermfg': 237,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Normal',                     'ctermfg': 187,  'ctermbg': 236,  'cterm': 'NONE'},
    {'group': 'Number',                     'ctermfg': 3,    'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'NvimInternalError',          'ctermfg': 9,    'ctermbg': 9,    'cterm': 'NONE'},
    {'group': 'Operator',                   'ctermfg': 141,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Pmenu',                      'ctermfg': 122,  'ctermbg': 238,  'cterm': 'NONE'},
    {'group': 'PmenuSbar',                  'ctermfg': None, 'ctermbg': 248,  'cterm': 'NONE'},
    {'group': 'PmenuSel',                   'ctermfg': 208,  'ctermbg': 238,  'cterm': 'NONE'},
    {'group': 'PmenuThumb',                 'ctermfg': None, 'ctermbg': 15,   'cterm': 'NONE'},
    {'group': 'PreProc',                    'ctermfg': 81,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Question',                   'ctermfg': 121,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Search',                     'ctermfg': 160,  'ctermbg': 228,  'cterm': 'NONE'},
    {'group': 'SignColumn',                 'ctermfg': 14,   'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'SignatureMarkText',          'ctermfg': 9,    'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'SignatureMarkTextHL',        'ctermfg': 141,  'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'SignatureMarkerText',        'ctermfg': 10,   'ctermbg': 233,  'cterm': 'NONE'},
    {'group': 'Special',                    'ctermfg': 224,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'SpecialKey',                 'ctermfg': 241,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'SpellBad',                   'ctermfg': 187,  'ctermbg': 52,   'cterm': 'NONE'},
    {'group': 'SpellCap',                   'ctermfg': 187,  'ctermbg': 22,   'cterm': 'NONE'},
    {'group': 'SpellLocal',                 'ctermfg': None, 'ctermbg': 14,   'cterm': 'NONE'},
    {'group': 'SpellRare',                  'ctermfg': None, 'ctermbg': 13,   'cterm': 'NONE'},
    {'group': 'Statement',                  'ctermfg': 35,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'StatusLine',                 'ctermfg': None, 'ctermbg': None, 'cterm': 'reverse'},
    {'group': 'StatusLineNC',               'ctermfg': None, 'ctermbg': None, 'cterm': 'reverse'},
    {'group': 'String',                     'ctermfg': 210,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'TabLine',                    'ctermfg': 15,   'ctermbg': 242,  'cterm': 'underline'},
    {'group': 'TabLineFill',                'ctermfg': None, 'ctermbg': None, 'cterm': 'reverse'},
    {'group': 'TabLineSel',                 'ctermfg': None, 'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'TermCursor',                 'ctermfg': None, 'ctermbg': None, 'cterm': 'reverse'},
    {'group': 'Title',                      'ctermfg': 225,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Todo',                       'ctermfg': 124,  'ctermbg': 11,   'cterm': 'NONE'},
    {'group': 'Type',                       'ctermfg': 11,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'Underlined',                 'ctermfg': 81,   'ctermbg': None, 'cterm': 'underline'},
    {'group': 'VertSplit',                  'ctermfg': 239,  'ctermbg': 239,  'cterm': 'NONE'},
    {'group': 'Visual',                     'ctermfg': 219,  'ctermbg': 239,  'cterm': 'NONE'},
    {'group': 'WarningMsg',                 'ctermfg': 224,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'WildMenu',                   'ctermfg': 0,    'ctermbg': 11,   'cterm': 'NONE'},
    {'group': 'clojureKeyword',             'ctermfg': 183,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'clojureParen',               'ctermfg': 60,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'pythonBuiltin',              'ctermfg': 11,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'pythonBuiltinObj',           'ctermfg': 11,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'pythonBuiltinType',          'ctermfg': 11,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'pythonDoctestValue',         'ctermfg': 246,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'pythonLambdaExpr',           'ctermfg': 35,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'pythonSelf',                 'ctermfg': 208,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'rubyConstant',               'ctermfg': 11,   'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'rubyInterpolationDelimiter', 'ctermfg': 177,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'rubyPseudoVariable',         'ctermfg': 208,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'rubyStringDelimiter',        'ctermfg': 205,  'ctermbg': None, 'cterm': 'NONE'},
    {'group': 'rubySymbol',                 'ctermfg': 32,   'ctermbg': None, 'cterm': 'NONE'},
]

GUI_COLORS_LOOKUP = {
    None  : None,
    0     : '#1B1B1B',
    1     : '#E4605B',
    2     : '#52AA45',
    3     : '#ECA938',
    4     : '#2883D6',
    5     : '#C74B89',
    6     : '#2CADB7',
    7     : '#E2E2E2',
    8     : '#7E7E7E',
    9     : '#DE7E7B',
    10    : '#99E8AD',
    11    : '#FDE49C',
    12    : '#9BB3FC',
    13    : '#F4ADFA',
    14    : '#A6E8FE',
    15    : '#FFFFFF',
    16    : '#000000',
    17    : '#00005F',
    18    : '#000087',
    19    : '#0000AF',
    20    : '#0000D7',
    21    : '#0000FF',
    22    : '#005F00',
    23    : '#005F5F',
    24    : '#005F87',
    25    : '#005FAF',
    26    : '#005FD7',
    27    : '#005FFF',
    28    : '#008700',
    29    : '#00875F',
    30    : '#008787',
    31    : '#0087AF',
    32    : '#0087D7',
    33    : '#0087FF',
    34    : '#00AF00',
    35    : '#00AF5F',
    36    : '#00AF87',
    37    : '#00AFAF',
    38    : '#00AFD7',
    39    : '#00AFFF',
    40    : '#00D700',
    41    : '#00D75F',
    42    : '#00D787',
    43    : '#00D7AF',
    44    : '#00D7D7',
    45    : '#00D7FF',
    46    : '#00FF00',
    47    : '#00FF5F',
    48    : '#00FF87',
    49    : '#00FFAF',
    50    : '#00FFD7',
    51    : '#00FFFF',
    52    : '#5F0000',
    53    : '#5F005F',
    54    : '#5F0087',
    55    : '#5F00AF',
    56    : '#5F00D7',
    57    : '#5F00FF',
    58    : '#5F5F00',
    59    : '#5F5F5F',
    60    : '#5F5F87',
    61    : '#5F5FAF',
    62    : '#5F5FD7',
    63    : '#5F5FFF',
    64    : '#5F8700',
    65    : '#5F875F',
    66    : '#5F8787',
    67    : '#5F87AF',
    68    : '#5F87D7',
    69    : '#5F87FF',
    70    : '#5FAF00',
    71    : '#5FAF5F',
    72    : '#5FAF87',
    73    : '#5FAFAF',
    74    : '#5FAFD7',
    75    : '#5FAFFF',
    76    : '#5FD700',
    77    : '#5FD75F',
    78    : '#5FD787',
    79    : '#5FD7AF',
    80    : '#5FD7D7',
    81    : '#5FD7FF',
    82    : '#5FFF00',
    83    : '#5FFF5F',
    84    : '#5FFF87',
    85    : '#5FFFAF',
    86    : '#5FFFD7',
    87    : '#5FFFFF',
    88    : '#870000',
    89    : '#87005F',
    90    : '#870087',
    91    : '#8700AF',
    92    : '#8700D7',
    93    : '#8700FF',
    94    : '#875F00',
    95    : '#875F5F',
    96    : '#875F87',
    97    : '#875FAF',
    98    : '#875FD7',
    99    : '#875FFF',
    100   : '#878700',
    101   : '#87875F',
    102   : '#878787',
    103   : '#8787AF',
    104   : '#8787D7',
    105   : '#8787FF',
    106   : '#87AF00',
    107   : '#87AF5F',
    108   : '#87AF87',
    109   : '#87AFAF',
    110   : '#87AFD7',
    111   : '#87AFFF',
    112   : '#87D700',
    113   : '#87D75F',
    114   : '#87D787',
    115   : '#87D7AF',
    116   : '#87D7D7',
    117   : '#87D7FF',
    118   : '#87FF00',
    119   : '#87FF5F',
    120   : '#87FF87',
    121   : '#87FFAF',
    122   : '#87FFD7',
    123   : '#87FFFF',
    124   : '#AF0000',
    125   : '#AF005F',
    126   : '#AF0087',
    127   : '#AF00AF',
    128   : '#AF00D7',
    129   : '#AF00FF',
    130   : '#AF5F00',
    131   : '#AF5F5F',
    132   : '#AF5F87',
    133   : '#AF5FAF',
    134   : '#AF5FD7',
    135   : '#AF5FFF',
    136   : '#AF8700',
    137   : '#AF875F',
    138   : '#AF8787',
    139   : '#AF87AF',
    140   : '#AF87D7',
    141   : '#AF87FF',
    142   : '#AFAF00',
    143   : '#AFAF5F',
    144   : '#AFAF87',
    145   : '#AFAFAF',
    146   : '#AFAFD7',
    147   : '#AFAFFF',
    148   : '#AFD700',
    149   : '#AFD75F',
    150   : '#AFD787',
    151   : '#AFD7AF',
    152   : '#AFD7D7',
    153   : '#AFD7FF',
    154   : '#AFFF00',
    155   : '#AFFF5F',
    156   : '#AFFF87',
    157   : '#AFFFAF',
    158   : '#AFFFD7',
    159   : '#AFFFFF',
    160   : '#D70000',
    161   : '#D7005F',
    162   : '#D70087',
    163   : '#D700AF',
    164   : '#D700D7',
    165   : '#D700FF',
    166   : '#D75F00',
    167   : '#D75F5F',
    168   : '#D75F87',
    169   : '#D75FAF',
    170   : '#D75FD7',
    171   : '#D75FFF',
    172   : '#D78700',
    173   : '#D7875F',
    174   : '#D78787',
    175   : '#D787AF',
    176   : '#D787D7',
    177   : '#D787FF',
    178   : '#D7AF00',
    179   : '#D7AF5F',
    180   : '#D7AF87',
    181   : '#D7AFAF',
    182   : '#D7AFD7',
    183   : '#D7AFFF',
    184   : '#D7D700',
    185   : '#D7D75F',
    186   : '#D7D787',
    187   : '#D7D7AF',
    188   : '#D7D7D7',
    189   : '#D7D7FF',
    190   : '#D7FF00',
    191   : '#D7FF5F',
    192   : '#D7FF87',
    193   : '#D7FFAF',
    194   : '#D7FFD7',
    195   : '#D7FFFF',
    196   : '#FF0000',
    197   : '#FF005F',
    198   : '#FF0087',
    199   : '#FF00AF',
    200   : '#FF00D7',
    201   : '#FF00FF',
    202   : '#FF5F00',
    203   : '#FF5F5F',
    204   : '#FF5F87',
    205   : '#FF5FAF',
    206   : '#FF5FD7',
    207   : '#FF5FFF',
    208   : '#FF8700',
    209   : '#FF875F',
    210   : '#FF8787',
    211   : '#FF87AF',
    212   : '#FF87D7',
    213   : '#FF87FF',
    214   : '#FFAF00',
    215   : '#FFAF5F',
    216   : '#FFAF87',
    217   : '#FFAFAF',
    218   : '#FFAFD7',
    219   : '#FFAFFF',
    220   : '#FFD700',
    221   : '#FFD75F',
    222   : '#FFD787',
    223   : '#FFD7AF',
    224   : '#FFD7D7',
    225   : '#FFD7FF',
    226   : '#FFFF00',
    227   : '#FFFF5F',
    228   : '#FFFF87',
    229   : '#FFFFAF',
    230   : '#FFFFD7',
    231   : '#FFFFFF',
    232   : '#080808',
    233   : '#121212',
    234   : '#1C1C1C',
    235   : '#262626',
    236   : '#303030',
    237   : '#3A3A3A',
    238   : '#444444',
    239   : '#4E4E4E',
    240   : '#585858',
    241   : '#626262',
    242   : '#6C6C6C',
    243   : '#767676',
    244   : '#808080',
    245   : '#8A8A8A',
    246   : '#949494',
    247   : '#9E9E9E',
    248   : '#A8A8A8',
    249   : '#B2B2B2',
    250   : '#BCBCBC',
    251   : '#C6C6C6',
    252   : '#D0D0D0',
    253   : '#DADADA',
    254   : '#E4E4E4',
    255   : '#EEEEEE',
}


def main():

    groups_ = []
    for g in GROUPS:
        g_ = collections.OrderedDict()

        for k in ['group', 'ctermfg', 'ctermbg', 'cterm', 'guifg', 'guibg', 'gui']:
            if k in g:
                g_[k] = g[k]

            else:
                if k == 'gui' and 'cterm' in g:
                    g_[k] = g['cterm']

                elif k == 'guifg' and 'ctermfg' in g:
                    g_[k] = GUI_COLORS_LOOKUP[g['ctermfg']]

                elif k == 'guibg' and 'ctermbg' in g:
                    g_[k] = GUI_COLORS_LOOKUP[g['ctermbg']]

                else:
                    g_[k] = None

        groups_.append(g_)

    lines = []
    for g_ in groups_:
        group   = g_['group']
        ctermfg = g_['ctermfg']
        ctermbg = g_['ctermbg']
        cterm   = g_['cterm']
        guifg   = g_['guifg']
        guibg   = g_['guibg']
        gui     = g_['gui']

        if group:
            line = f'hi {group:<30}'
            if ctermfg is not None:
                p = f'ctermfg={ctermfg}'
                line = line + f' {p:<16}'
            else:
                p = ' '
                line = line + f' {p:<16}'

            if ctermbg is not None:
                p = f'ctermbg={ctermbg}'
                line = line + f' {p:<16}'
            else:
                p = ' '
                line = line + f' {p:<16}'

            p = f'cterm={cterm}'
            line = line + f' {p:<16}'

            # if guifg is not None:
            #     p = f'guifg={guifg}'
            #     line = line + f' {p:<16}'

            # if guibg is not None:
            #     p = f'guibg={guibg}'
            #     line = line + f' {p:<16}'

            # p = f'gui={gui}'
            # line = line + f' {p:<16}'

        lines.append(line.strip())


    f = io.StringIO()
    for block in [
        '''
        hi clear
        syntax reset
        let g:colors_name = "tokyo"
        ''',

        '\n'.join(lines),

        '''
        hi link EasyMotionShade  Comment
        ''',
    ]:
        for l in block.split('\n'):
            print(l.lstrip(), file=f)
    f.seek(0)

    with open('tokyo.vim', 'w') as g:
        print(f.read().strip(), file=g)


if __name__ == '__main__':
    main()
