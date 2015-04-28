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
let s:white_bright   = '#FFFFFF'


let s:string_fg   = '#de7e7e'
let s:comment_fg  = 'grey55'
let s:cursor_line = '#0F0F0F'
let s:error_bg    = '#f44490'
let s:error_fg    = 'white'
let s:non_text_fg = 'grey35'
let s:non_text_bg = 'grey15'

"    <SID>hi('Group',         gui_fg,        gui_bg,        gui)
call <SID>hi('CurrentWord',   '',            s:black,       '')
call <SID>hi('Normal',        s:fg,          s:bg,          '')
call <SID>hi('String',        s:string_fg,   '',            '')

call <SID>hi('Statement',     '#16A34C',   '',            s:_n)
call <SID>hi('Include',       '#95afb9',   '',            '')
"include require
" hi Include              guifg=#a5efc9 gui=bold

" call <SID>hi('Keyword',        s:string_fg,   '',            '')

call <SID>hi('Operator',     s:blue_bright,   '',            '')

call <SID>hi('Structure',     '#9E6CFF', '', s:_b)


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
call <SID>hi('ErrorMsg',      s:error_fg,    s:error_bg,    s:_b)
call <SID>hi('NonText',       s:non_text_fg, s:non_text_bg, '')

call <SID>hi('Directory',    s:cyan, '', '')

call <SID>hi('SpecialKey',    s:non_text_fg, s:non_text_bg, '')
call <SID>hi('Function',    s:green_bright, '', s:_i)
call <SID>hi('Constant',    s:yellow, '', s:_n)

hi IncSearch            guibg=black   guifg=#749940
hi Search               guibg=#553910 guifg=#ff2b00 gui=none

"    <SID>hi('Group',      gui_fg,   gui_bg,        gui)
call <SID>hi('Pmenu',      '',       s:non_text_bg, '')
call <SID>hi('PmenuSel',   'orange', s:black,       'bold')
call <SID>hi('PmenuThumb', '',       '',            '')

"    <SID>hi('Group',      gui_fg,   gui_bg,   gui)
call <SID>hi('Folded',     'grey55', 'grey25', '')
call <SID>hi('FoldColumn', 'grey55', 'grey25', '')

call <SID>hi('EasyMotionTarget',     'red', '', s:_b)


delfunction <SID>hi

hi SpellErrors          guifg=#101010  guibg=#f44490


" color 0-7 corresponds to low-intensity (normal) colours
" 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
" color 8-15 corresponds to high-intensity
" bold = bright foreground, blink = bright background

" ShowMarks
hi ShowMarksHLl guibg=grey25 guifg=#f65020 gui=bold
hi ShowMarksHLu guibg=grey25 guifg=#f65020 gui=bold
hi ShowMarksHLm guibg=grey25 guifg=#f65020 gui=bold

hi Identifier guifg=#e6a029 gui=bold "@@var,@var,|var|
hi Special    guifg=#f65020 gui=bold


hi Type                 guifg=#ffe799   "Mod::Deffed, Classdeffed

hi rubySymbol guifg=#63b5d4 ":aa
hi rubyInterpolation    guifg=#9ce590 " "#{asdfasd}"
hi rubyPseudoVariable   guifg=#f0f045 gui=bold   "self
hi rubyConstant         guifg=#b1d3ff gui=bold      "SomeClass,SomeModule

hi Define               guifg=#7796ff gui=bold,italic   "module,class,def,end


hi PreProc              guifg=#bb4182 gui=bold guibg=grey25  "#!/bin/sh

hi WarningMsg           guifg=White guibg=#f44490 gui=bold

hi VertSplit            gui=reverse guibg=#c2bfa5 guifg=grey30

hi ModeMsg gui=bold guifg=goldenrod
hi MoreMsg gui=bold guifg=SeaGreen

hi Question guifg=springgreen

hi Title guifg=gold gui=bold
hi Visual guibg=grey20 guifg=pink
hi VisualNOS gui=bold,italic

hi Ignore    guifg=grey40

hi Underlined gui=underline

" TODO
hi Todo guifg=orangered guibg=yellow3 gui=bold

hi DiffAdd guibg=DarkBlue
hi DiffChange guibg=DarkMagenta
hi DiffDelete gui=bold guifg=Blue guibg=DarkCyan
hi DiffText gui=bold guibg=Red
hi Question gui=bold guifg=Green
hi Title gui=bold guifg=Magenta
hi VisualNOS gui=underline,bold
hi WildMenu guibg=Yellow guifg=Black

" Clojure colors
hi clojureKeyword guifg=#63b5fe gui=italic
hi clojureCharacter guifg=#2aa198 gui=bold
