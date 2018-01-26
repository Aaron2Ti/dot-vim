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

" call <SID>hi("Debug",         s:gui08, "", s:cterm08, "", "")
" call <SID>hi("Directory",     s:gui0D, "", s:cterm0D, "", "")
call <SID>hi('ErrorMsg', '196', s:Black, 'bold')

call <SID>hi('Folded',     s:Grey11, s:Grey6,        'none')
call <SID>hi('FoldColumn', s:Grey9,  s:CursorLineBG, 'none')
call <SID>hi('MatchParen', '',  '237', 'none')

call <SID>hi('SignColumn', '14', s:CursorLineBG, 'none')

call <SID>hi('SignatureMarkTextHL', '141', s:CursorLineBG, 'none')

call <SID>hi('GitGutterAdd',    '22', s:CursorLineBG, 'none')
call <SID>hi('GitGutterDelete', '88', s:CursorLineBG, 'none')
call <SID>hi('GitGutterChange', '94',   s:CursorLineBG, 'none')
call <SID>hi('GitGutterChangeDelete', '94',   s:CursorLineBG, 'none')

" call <SID>hi("Exception",     s:gui08, "", s:cterm08, "", "")
" call <SID>hi("FoldColumn",    "", s:gui01, "", s:cterm01, "")
" call <SID>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "")
" call <SID>hi("Italic",        "", "", "", "", "italic")
" call <SID>hi("Macro",         s:gui08, "", s:cterm08, "", "")
" call <SID>hi("ModeMsg",       s:gui0B, "", s:cterm0B, "", "")
" call <SID>hi("MoreMsg",       s:gui0B, "", s:cterm0B, "", "")
" call <SID>hi("Question",      s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("Search",        s:gui0A, s:gui01, s:cterm0A, s:cterm01,  "reverse")
call <SID>hi('Search',           '160', 228, 'bold')
call <SID>hi('IncSearch',        '160', s:Yellow, 'reverse')

" call <SID>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "")
" call <SID>hi("TooLong",       s:gui08, "", s:cterm08, "", "")
" call <SID>hi("Underlined",    s:gui08, "", s:cterm08, "", "")
call <SID>hi("Visual",        "219", s:Grey7, '')
" call <SID>hi("VisualNOS",     s:gui08, "", s:cterm08, "", "")
" call <SID>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "")
" call <SID>hi("WildMenu",      s:gui08, "", s:cterm08, "", "")
" call <SID>hi("Title",         s:gui0D, "", s:cterm0D, "", "none")

if &background == "dark"
  " call <SID>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "")
  call <SID>hi('Normal', s:NormalFG, '', '')
  call <SID>hi('NonText', '237', '', '')
  " call <SID>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "")
  " call <SID>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none")
  " call <SID>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
  " call <SID>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none")

  call <SID>hi('CursorColumn', '',      s:CursorLineBG, 'none')
  call <SID>hi('CursorLine',   '',      s:CursorLineBG, 'none')
  call <SID>hi('ColorColumn',  '',      '234',        'none')
  call <SID>hi('CursorLineNr', s:Grey2, s:CursorLineBG, 'none')

  call <SID>hi('LineNr',       s:Grey9, s:CursorLineBG, 'bold')

  call <SID>hi('PMenu',    '122',    s:Grey6, 'none')
  call <SID>hi('PMenuSel', s:Golden, s:Grey6, 'bold')

  call <SID>hi('CommandTCharMatched', s:Golden,   '',      'bold')

  " call <SID>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
  " call <SID>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none")
  " call <SID>hi("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none")
else
  " call <SID>hi("Cursor",        s:gui00, s:gui02, s:cterm00, s:cterm02, "")
  " call <SID>hi("NonText",       s:gui05, "", s:cterm05, "", "")
  " call <SID>hi("Normal",        s:gui02, s:gui07, s:cterm02, s:cterm05, "")
  " call <SID>hi("LineNr",        s:gui04, s:gui06, s:cterm04, s:cterm06, "")
  " call <SID>hi("SpecialKey",    s:gui05, "", s:cterm05, "", "")
  " call <SID>hi("StatusLine",    s:gui04, s:gui06, s:cterm04, s:cterm06, "none")
  " call <SID>hi("StatusLineNC",  s:gui04, s:gui06, s:cterm04, s:cterm06, "none")
  " call <SID>hi("VertSplit",     s:gui05, s:gui05, s:cterm05, s:cterm05, "none")
  " call <SID>hi("ColorColumn",   "", s:gui06, "", s:cterm06, "none")
  " call <SID>hi("CursorColumn",  "", s:gui06, "", s:cterm06, "none")
  " call <SID>hi("CursorLine",    "", s:gui06, "", s:cterm06, "none")
  " call <SID>hi("CursorLineNr",  s:gui04, s:gui06, s:cterm04, s:cterm06, "")
  " call <SID>hi("PMenu",         s:gui05, s:gui03, s:cterm05, s:cterm03, "none")
  " call <SID>hi("PMenuSel",      s:gui05, s:gui03, s:cterm05, s:cterm03, "reverse")
  " call <SID>hi("TabLine",       s:gui06, s:gui01, s:cterm06, s:cterm01, "reverse")
  " call <SID>hi("TabLineFill",   s:gui06, s:gui01, s:cterm06, s:cterm01, "reverse")
  " call <SID>hi("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "reverse")
endif

" Standard Syntax Highlighting
" call <SID>hi("Boolean",      s:gui09, "", s:cterm09, "", "")
" call <SID>hi("Character",    s:gui08, "", s:cterm08, "", "")

call <SID>hi('Boolean', s:Golden, '', '')

call <SID>hi('SpecialKey', s:Grey9, '', '')

" call <SID>hi('Comment', s:Grey9, '', 'italic')
call <SID>hi('Comment', s:CommentFG, '', '')
call <SID>hi('VertSplit', s:Grey7, s:Grey7, 'none')
call <SID>hi('String', '210', '', '')

" call <SID>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("Constant",     s:gui09, "", s:cterm09, "", "")
" call <SID>hi("Define",       s:gui0E, "", s:cterm0E, "", "none")
call <SID>hi('Define', '33', '', 'bold')
call <SID>hi('Function', '35', '', 'bold')
call <SID>hi('Identifier', s:Golden, '', '')

call <SID>hi('pythonSelf', s:Golden, '', '')

call <SID>hi('Number', s:Yellow, '', '')
call <SID>hi('Operator', 141, '', '')


" call <SID>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "")
" call <SID>hi("Float",        s:gui09, "", s:cterm09, "", "")
" call <SID>hi("Include",      s:gui0D, "", s:cterm0D, "", "")
" call <SID>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("Label",        s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("Number",       s:gui09, "", s:cterm09, "", "")
" call <SID>hi("Operator",     s:gui05, "", s:cterm05, "", "none")
" call <SID>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("Special",      s:gui0C, "", s:cterm0C, "", "")
" call <SID>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "")
" call <SID>hi("Statement",    s:gui08, "", s:cterm08, "", "")
call <SID>hi('Statement', '35', '', 'bold')
call <SID>hi('pythonLambdaExpr', '35', '', '')
" call <SID>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("String",       s:gui0B, "", s:cterm0B, "", "")
" call <SID>hi("Structure",    s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("Tag",          s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "")
call <SID>hi('Type', s:LightYellow, '', 'bold')
call <SID>hi('Todo', '124', '11', '')
call <SID>hi('pythonDoctestValue', s:CommentFG, '', '')

call <SID>hi('pythonBuiltin',     s:LightYellow, '', '')
call <SID>hi('pythonBuiltinType', s:LightYellow, '', '')
call <SID>hi('pythonBuiltinObj',  s:LightYellow, '', '')

" call <SID>hi("Type",         s:gui09, "", s:cterm09, "", "none")
" call <SID>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "")

" Spelling Highlighting
call <SID>hi('SpellBad', s:NormalFG, 52, '')
call <SID>hi('SpellCap', s:NormalFG, 22, '')

" call <SID>hi("SpellLocal",   s:gui05, s:gui00, s:cterm05, s:cterm0D, "")
"call <SID>hi("SpellCap",    s:gui00, s:gui08, s:cterm00, s:cterm08, "")
"call <SID>hi("SpellRare",   s:gui00, s:gui08, s:cterm00, s:cterm08, "")

" Additional Diff Highlighting
" call <SID>hi("DiffAdd",      s:gui0B, s:gui00, s:cterm0B, s:cterm00, "")
" call <SID>hi("DiffChange",   s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
" call <SID>hi("DiffDelete",   s:gui08, s:gui00, s:cterm08, s:cterm00, "")
" call <SID>hi("DiffText",     s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
" call <SID>hi("DiffAdded",    s:gui0B, s:gui00, s:cterm0B, s:cterm00, "")
" call <SID>hi("DiffFile",     s:gui08, s:gui00, s:cterm08, s:cterm00, "")
" call <SID>hi("DiffNewFile",  s:gui0B, s:gui00, s:cterm0B, s:cterm00, "")
" call <SID>hi("DiffLine",     s:gui0D, s:gui00, s:cterm0D, s:cterm00, "")
" call <SID>hi("DiffRemoved",  s:gui08, s:gui00, s:cterm08, s:cterm00, "")

call <SID>hi('EasyMotionTarget',        159, '', 'bold')
call <SID>hi('EasyMotionTarget2First',  159, '', 'bold')
call <SID>hi('EasyMotionTarget2Second', 159, '', 'bold')
hi link EasyMotionShade  Comment


call <SID>hi('IndentGuidesOdd', '', '', '')
call <SID>hi('IndentGuidesOdd', '', '', '')
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey13 ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey8  ctermbg=4

" Ruby Highlighting
" call <SID>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "")
" call <SID>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "")
" call <SID>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "")
" call <SID>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "")
call <SID>hi('rubySymbol',                 '32',          '', '')
call <SID>hi('rubyConstant',               s:LightYellow, '', 'bold')
call <SID>hi('rubyInterpolationDelimiter', '177',         '', 'bold')
call <SID>hi('rubyStringDelimiter',        '205',         '', 'bold')
call <SID>hi('rubyPseudoVariable',         s:Golden,         '', 'bold')

" PHP Highlighting
" call <SID>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "")
" call <SID>hi("phpComparison",      s:gui05, "", s:cterm05, "", "")
" call <SID>hi("phpParent",          s:gui05, "", s:cterm05, "", "")

" HTML Highlighting
" call <SID>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "")
" call <SID>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "")
" call <SID>hi("htmlTag",     s:gui05, "", s:cterm05, "", "")

" CSS Highlighting
" call <SID>hi("cssBraces",      s:gui05, "", s:cterm05, "", "")
" call <SID>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "")

" SASS Highlighting
" call <SID>hi("sassIdChar",     s:gui08, "", s:cterm08, "", "")
" call <SID>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "")
" call <SID>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "")
" call <SID>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "")

" JavaScript Highlighting
" call <SID>hi("javaScript",        s:gui05, "", s:cterm05, "", "")
" call <SID>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "")
" call <SID>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "")

" Git Highlighting
" call <SID>hi("gitCommitOverflow",  s:gui08, "", s:cterm08, "", "")
" call <SID>hi("gitCommitSummary",   s:gui0B, "", s:cterm0B, "", "")

" remove highlighting function
delf <sid>hi

" Remove Colour Variables
" unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
" unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F

" {{{1
" vim: foldmethod=marker
