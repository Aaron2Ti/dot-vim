set background=dark

hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'drama'


" Highlighting function
"
"   attr-list
"     NONE
"     bold
"     italic
"     reverse
"     standout
"     underline
"
function <SID>hi(group, guifg, guibg, attr)
  if a:guifg != ''
    exec 'hi ' . a:group . ' guifg=' . a:guifg
  endif

  if a:guibg != ''
    exec 'hi ' . a:group . ' guibg=' . a:guibg
  endif

  if a:attr != ''
    exec 'hi ' . a:group . ' gui=' . a:attr
  else
    exec 'hi ' . a:group . ' gui=' . 'none'
  endif
endfunction

if has('gui')
  hi CurrentWord gui=none
  match CurrentWord /\k*\%#\k*/

  " %s/[-ÿ]/ /gc
  hi NonAsciiChars gui=none
  match NonAsciiChars /[\x7f-\xff]/
end


let s:_n   = 'none'
let s:_b   = 'bold'
let s:_b_i = 'bold,italic'
let s:_i   = 'italic'

let s:fg = '#CECFA0'
let s:bg = '#1A1A1A'

let s:black          = '#151515'
let s:black_bright   = '#6B6B6B'
let s:red            = '#D42E30'
let s:red_bright     = '#FC5555'
let s:green          = '#3D8833'
let s:green_bright   = '#85E79B'
let s:yellow         = '#F5950E'
let s:yellow_bright  = '#FEE187'
let s:blue           = '#2E51EA'
let s:blue_bright    = '#889FFE'
let s:magenta        = '#B8196A'
let s:magenta_bright = '#F294FB'
let s:cyan           = '#1B9FA9'
let s:cyan_bright    = '#94E2FF'
let s:white          = '#C7C7C7'
let s:white_bright   = '#FEFEFE'
let s:purple         = '#9E6CFF'


let s:string_fg   = '#de7e7e'
let s:comment_fg  = 'grey55'
let s:cursor_line = '#0F0F0F'
let s:error_bg    = '#B44480'
let s:error_fg    = '#EFEFEF'
let s:non_text_fg = 'grey35'
let s:non_text_bg = 'grey15'

"    <SID>hi('Group',         gui_fg,        gui_bg,        gui)
call <SID>hi('CurrentWord',   '',            s:black,       '')
call <SID>hi('Normal',        s:fg,          s:bg,          '')
call <SID>hi('String',        s:string_fg,   '',            '')

call <SID>hi('Statement',     '#16A34C',   '',            s:_n)
call <SID>hi('Include',       '#95afb9',   '',            '')
call <SID>hi('Title',         s:yellow,   '',            s:_b)
"include require
" hi Include              guifg=#a5efc9 gui=bold

" call <SID>hi('Keyword',        s:string_fg,   '',            '')

call <SID>hi('Operator',     s:purple,   '',            s:_n)

call <SID>hi('Structure',     s:cyan_bright, '', '')

call <SID>hi('ColorColumn',   '',            s:cursor_line,  '')
call <SID>hi('SignColumn',   s:cyan,         'grey25',  '')
call <SID>hi('StatusLine',   s:black_bright,        s:cursor_line,  '')
call <SID>hi('StatusLineNC', s:black_bright,        s:cursor_line,  '')

call <SID>hi('Cursor',        'grey5',       'khaki',       '')
call <SID>hi('CursorColumn',  '',            s:cursor_line, '')
call <SID>hi('CursorLine',    '',            s:cursor_line, '')
call <SID>hi('CursorLineNr',  s:cursor_line, s:cursor_line, '')
call <SID>hi('LineNr',        s:comment_fg,  s:cursor_line, s:_b_i)
call <SID>hi('Comment',       s:comment_fg,  '',            s:_i)
call <SID>hi('Error',         s:error_fg,    s:error_bg,    s:_b)
call <SID>hi('ErrorMsg',      s:error_fg,    s:error_bg,    s:_i)
call <SID>hi('WarningMsg',    s:error_fg,    '#4481b4',     s:_i)
call <SID>hi('NonText',       s:non_text_fg, s:non_text_bg, '')

call <SID>hi('Directory',    s:cyan, '', '')

call <SID>hi('SpecialKey',    s:non_text_fg, s:non_text_bg, '')
call <SID>hi('Function',    s:green_bright, '', s:_i)
call <SID>hi('Constant',    s:yellow, '', s:_n)

hi IncSearch            guibg=black   guifg=#749940
hi Search               guibg=#553910 guifg=#ff2b00 gui=none

"    <SID>hi('Group',      gui_fg,   gui_bg,        gui)
call <SID>hi('Pmenu',      '',       s:non_text_bg, '')
call <SID>hi('PmenuSel',   'orange', s:black,       '')
call <SID>hi('PmenuThumb', '',       '',            '')

"    <SID>hi('Group',      gui_fg,   gui_bg,   gui)
call <SID>hi('Folded',     'grey55', 'grey25', '')
call <SID>hi('FoldColumn', 'grey55', 'grey25', '')

call <SID>hi('EasyMotionTarget',     'red', '', s:_b)

" #!/bin/sh
call <SID>hi('PreProc', '#bb4182', 'grey25', '')

" Mod::Deffed, Classdeffed
call <SID>hi('Type', '#ffe799', '', '')
call <SID>hi('Special', '#f65020', '', '')
" @@var,@var,|var|
call <SID>hi('Identifier', '#e6a029', '', '')

" TODO
call <SID>hi('Todo', 'orangered', 'yellow3', s:_b)

delfunction <SID>hi

hi link lessCssAttribute Normal

hi link pythonRun PreProc

hi SpellErrors          guifg=#101010  guibg=#f44490


" color 0-7 corresponds to low-intensity (normal) colours
" 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
" color 8-15 corresponds to high-intensity
" bold = bright foreground, blink = bright background

" ShowMarks
hi ShowMarksHLl guibg=grey25 guifg=#f65020 gui=bold
hi ShowMarksHLu guibg=grey25 guifg=#f65020 gui=bold
hi ShowMarksHLm guibg=grey25 guifg=#f65020 gui=bold

hi rubySymbol guifg=#63b5d4 ":aa
hi rubyInterpolation    guifg=#9ce590 " "#{asdfasd}"
hi rubyPseudoVariable   guifg=#f0f045 " self
hi rubyConstant         guifg=#b1d3ff " SomeClass,SomeModule

hi Define               guifg=#7796ff gui=italic   "module,class,def,end


hi VertSplit            gui=reverse guibg=#c2bfa5 guifg=grey30

hi ModeMsg gui=bold guifg=goldenrod
hi MoreMsg gui=bold guifg=SeaGreen


hi Visual guibg=grey20 guifg=pink

hi Ignore    guifg=grey40

hi Underlined gui=underline

hi DiffAdd guibg=DarkBlue
hi DiffChange guibg=DarkMagenta
hi DiffDelete guifg=Blue guibg=DarkCyan
hi DiffText guibg=Red

hi Question gui=bold guifg=Green
hi VisualNOS gui=underline
hi WildMenu guibg=Yellow guifg=Black

" Clojure colors
hi clojureKeyword guifg=#63b5fe gui=italic
hi clojureCharacter guifg=#2aa198
