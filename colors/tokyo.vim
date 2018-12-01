hi clear
syntax reset
let g:colors_name = "tokyo"

hi Boolean                        ctermfg=208                       cterm=NONE
hi ColorColumn                                     ctermbg=234      cterm=NONE
hi CommandTCharMatched            ctermfg=208                       cterm=NONE
hi Comment                        ctermfg=246                       cterm=NONE
hi Conceal                        ctermfg=7        ctermbg=242      cterm=NONE
hi Constant                       ctermfg=13                        cterm=NONE
hi CursorColumn                                    ctermbg=233      cterm=NONE
hi CursorLine                                      ctermbg=233      cterm=NONE
hi CursorLineNr                   ctermfg=234      ctermbg=233      cterm=NONE
hi Define                         ctermfg=33                        cterm=NONE
hi DiffAdd                                         ctermbg=4        cterm=NONE
hi DiffChange                                      ctermbg=5        cterm=NONE
hi DiffDelete                     ctermfg=12       ctermbg=6        cterm=NONE
hi DiffText                                        ctermbg=9        cterm=NONE
hi Directory                      ctermfg=159                       cterm=NONE
hi EasyMotionTarget               ctermfg=159                       cterm=NONE
hi EasyMotionTarget2First         ctermfg=159                       cterm=NONE
hi EasyMotionTarget2Second        ctermfg=159                       cterm=NONE
hi Error                          ctermfg=15       ctermbg=9        cterm=NONE
hi ErrorMsg                       ctermfg=196      ctermbg=0        cterm=NONE
hi FoldColumn                     ctermfg=241      ctermbg=233      cterm=NONE
hi Folded                         ctermfg=243      ctermbg=238      cterm=NONE
hi Function                       ctermfg=35                        cterm=NONE
hi Identifier                     ctermfg=208                       cterm=NONE
hi Ignore                         ctermfg=0                         cterm=NONE
hi IncSearch                      ctermfg=160      ctermbg=3        cterm=NONE
hi LineNr                         ctermfg=241      ctermbg=233      cterm=NONE
hi MatchParen                                      ctermbg=237      cterm=NONE
hi ModeMsg                                                          cterm=NONE
hi MoreMsg                        ctermfg=121                       cterm=NONE
hi NonText                        ctermfg=237                       cterm=NONE
hi Normal                         ctermfg=187      ctermbg=236      cterm=NONE
hi Number                         ctermfg=3                         cterm=NONE
hi NvimInternalError              ctermfg=9        ctermbg=9        cterm=NONE
hi Operator                       ctermfg=141                       cterm=NONE
hi Pmenu                          ctermfg=122      ctermbg=238      cterm=NONE
hi PmenuSbar                                       ctermbg=248      cterm=NONE
hi PmenuSel                       ctermfg=208      ctermbg=238      cterm=NONE
hi PmenuThumb                                      ctermbg=15       cterm=NONE
hi PreProc                        ctermfg=81                        cterm=NONE
hi Question                       ctermfg=121                       cterm=NONE
hi Search                         ctermfg=160      ctermbg=228      cterm=NONE
hi SignColumn                     ctermfg=14       ctermbg=233      cterm=NONE
hi SignatureMarkText              ctermfg=9        ctermbg=233      cterm=NONE
hi SignatureMarkTextHL            ctermfg=141      ctermbg=233      cterm=NONE
hi SignatureMarkerText            ctermfg=10       ctermbg=233      cterm=NONE
hi Special                        ctermfg=224                       cterm=NONE
hi SpecialKey                     ctermfg=241                       cterm=NONE
hi SpellBad                       ctermfg=187      ctermbg=52       cterm=NONE
hi SpellCap                       ctermfg=187      ctermbg=22       cterm=NONE
hi SpellLocal                                      ctermbg=14       cterm=NONE
hi SpellRare                                       ctermbg=13       cterm=NONE
hi Statement                      ctermfg=35                        cterm=NONE
hi StatusLine                                                       cterm=reverse
hi StatusLineNC                                                     cterm=reverse
hi String                         ctermfg=210                       cterm=NONE
hi TabLine                        ctermfg=15       ctermbg=242      cterm=underline
hi TabLineFill                                                      cterm=reverse
hi TabLineSel                                                       cterm=NONE
hi TermCursor                                                       cterm=reverse
hi Title                          ctermfg=225                       cterm=NONE
hi Todo                           ctermfg=124      ctermbg=11       cterm=NONE
hi Type                           ctermfg=11                        cterm=NONE
hi Underlined                     ctermfg=81                        cterm=underline
hi VertSplit                      ctermfg=239      ctermbg=239      cterm=NONE
hi Visual                         ctermfg=219      ctermbg=239      cterm=NONE
hi WarningMsg                     ctermfg=224                       cterm=NONE
hi WildMenu                       ctermfg=0        ctermbg=11       cterm=NONE
hi clojureKeyword                 ctermfg=183                       cterm=NONE
hi clojureParen                   ctermfg=60                        cterm=NONE
hi pythonBuiltin                  ctermfg=11                        cterm=NONE
hi pythonBuiltinObj               ctermfg=11                        cterm=NONE
hi pythonBuiltinType              ctermfg=11                        cterm=NONE
hi pythonDoctestValue             ctermfg=246                       cterm=NONE
hi pythonLambdaExpr               ctermfg=35                        cterm=NONE
hi pythonSelf                     ctermfg=208                       cterm=NONE
hi rubyConstant                   ctermfg=11                        cterm=NONE
hi rubyInterpolationDelimiter     ctermfg=177                       cterm=NONE
hi rubyPseudoVariable             ctermfg=208                       cterm=NONE
hi rubyStringDelimiter            ctermfg=205                       cterm=NONE
hi rubySymbol                     ctermfg=32                        cterm=NONE

hi link EasyMotionShade  Comment

syntax match OperatorChars "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
hi link OperatorChars Comment
