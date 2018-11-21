" colors 232-255 are a grayscale ramp, intentionally leaving out {{{
let s:Grey0  = '232'
let s:Grey1  = '233'
let s:Grey2  = '234'
let s:Grey3  = '235'
let s:Grey4  = '236'
let s:Grey5  = '237'
let s:Grey6  = '238'
let s:Grey7  = '239'
let s:Grey8  = '240'
let s:Grey9  = '241'
let s:Grey10 = '242'
let s:Grey11 = '243'
let s:Grey12 = '244'
let s:Grey13 = '245'
let s:Grey14 = '246'
let s:Grey15 = '247'
let s:Grey16 = '248'
let s:Grey17 = '249'
let s:Grey18 = '250'
let s:Grey19 = '251'
let s:Grey20 = '252'
let s:Grey21 = '253'
let s:Grey22 = '254'
let s:Grey23 = '255'
"}}}

"{{{ default colors
let s:Black        = '0'
let s:Red          = '1'
let s:Green        = '2'
let s:Yellow       = '3'
let s:Blue         = '4'
let s:Magenta      = '5'
let s:Cyan         = '6'
let s:Grey         = '7'
"}}}

let s:LightBlack   = '8'
let s:LightRed     = '9'
let s:LightGreen   = '10'
let s:LightYellow  = '11'
let s:LightBlue    = '12'
let s:LightMagenta = '13'
let s:LightCyan    = '14'
let s:White        = '15'

let s:CursorLineBG = s:Grey1
let s:CommentFG = s:Grey14

let s:Golden = '208'
let s:NormalFG = '187'

" Theme Setup
hi clear
syntax reset
let g:colors_name = "beijing_opera"

fun! <SID>hi(group, ctermfg, ctermbg, attr) "{{{
  exec "hi " . a:group . " term=none"

  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif

  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif

  if a:attr != ""
    exec "hi " . a:group . " term=none" . " cterm=" . a:attr
  endif
endfun
"}}}

call <SID>hi("clojureParen",        "60",  '', '')
call <SID>hi("clojureKeyword",      "183", '', '')

" Vim Editor Colors
call <SID>hi("Bold",          "", "", "bold")
call <SID>hi('ErrorMsg', '196', s:Black, 'bold')

call <SID>hi('Folded',     s:Grey11, s:Grey6,        'none')
call <SID>hi('FoldColumn', s:Grey9,  s:CursorLineBG, 'none')
call <SID>hi('MatchParen', '',  '237', 'none')
call <SID>hi('SignColumn', '14', s:CursorLineBG, 'none')
call <SID>hi('SignatureMarkTextHL', '141', s:CursorLineBG, 'none')

call <SID>hi('Search',           '160', 228, 'bold')
call <SID>hi('IncSearch',        '160', s:Yellow, 'reverse')

call <SID>hi("Visual",        "219", s:Grey7, '')

call <SID>hi('Normal', s:NormalFG, '', '')
call <SID>hi('NonText', '237', '', '')

call <SID>hi('CursorColumn', '',      s:CursorLineBG, 'none')
call <SID>hi('CursorLine',   '',      s:CursorLineBG, 'none')
call <SID>hi('ColorColumn',  '',      '234',        'none')
call <SID>hi('CursorLineNr', s:Grey2, s:CursorLineBG, 'none')

call <SID>hi('LineNr',       s:Grey9, s:CursorLineBG, 'bold')

call <SID>hi('PMenu',    '122',    s:Grey6, 'none')
call <SID>hi('PMenuSel', s:Golden, s:Grey6, 'bold')
call <SID>hi('CommandTCharMatched', s:Golden,   '',      'bold')
call <SID>hi('Boolean', s:Golden, '', '')
call <SID>hi('SpecialKey', s:Grey9, '', '')

call <SID>hi('Comment', s:CommentFG, '', '')
call <SID>hi('VertSplit', s:Grey7, s:Grey7, 'none')
call <SID>hi('String', '210', '', '')

call <SID>hi('Define', '33', '', 'bold')
call <SID>hi('Function', '35', '', 'bold')
call <SID>hi('Identifier', s:Golden, '', '')

call <SID>hi('pythonSelf', s:Golden, '', '')

call <SID>hi('Number', s:Yellow, '', '')
call <SID>hi('Operator', 141, '', '')

call <SID>hi('Statement', '35', '', 'bold')
call <SID>hi('pythonLambdaExpr', '35', '', '')
call <SID>hi('Type', s:LightYellow, '', 'bold')
call <SID>hi('Todo', '124', '11', '')
call <SID>hi('pythonDoctestValue', s:CommentFG, '', '')

call <SID>hi('pythonBuiltin',     s:LightYellow, '', '')
call <SID>hi('pythonBuiltinType', s:LightYellow, '', '')
call <SID>hi('pythonBuiltinObj',  s:LightYellow, '', '')

call <SID>hi('SpellBad', s:NormalFG, 52, '')
call <SID>hi('SpellCap', s:NormalFG, 22, '')

call <SID>hi('EasyMotionTarget',        159, '', 'bold')
call <SID>hi('EasyMotionTarget2First',  159, '', 'bold')
call <SID>hi('EasyMotionTarget2Second', 159, '', 'bold')
hi link EasyMotionShade  Comment

call <SID>hi('IndentGuidesOdd', '', '', '')
call <SID>hi('IndentGuidesOdd', '', '', '')

call <SID>hi('rubySymbol',                 '32',          '', '')
call <SID>hi('rubyConstant',               s:LightYellow, '', 'bold')
call <SID>hi('rubyInterpolationDelimiter', '177',         '', 'bold')
call <SID>hi('rubyStringDelimiter',        '205',         '', 'bold')
call <SID>hi('rubyPseudoVariable',         s:Golden,         '', 'bold')

" remove highlighting function
delf <sid>hi

" Remove Colour Variables
unlet s:Grey0 s:Grey1 s:Grey2 s:Grey3 s:Grey4 s:Grey5 s:Grey6 s:Grey7 s:Grey8
unlet s:Grey9 s:Grey10 s:Grey11 s:Grey12 s:Grey13 s:Grey14 s:Grey15 s:Grey16
unlet s:Grey17 s:Grey18 s:Grey19 s:Grey20 s:Grey21 s:Grey22 s:Grey23

" vim: foldmethod=marker
