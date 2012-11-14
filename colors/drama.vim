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
  endif
endfunction

if has('gui')
  hi CurrentWord gui=none
  match CurrentWord /\k*\%#\k*/

  " %s/[-ÿ]/ /gc
  hi NonAsciiChars gui=none
  match NonAsciiChars /[\x7f-\xff]/
end


let s:black       = 'black'
let s:fg          = '#d1eabc'
let s:bg          = 'grey9'
let s:string_fg   = '#de7e7e'
let s:comment_fg  = 'grey55'
let s:cursor_line = 'grey20'
let s:_b          = 'bold'
let s:_b_i        = 'bold,italic'
let s:error_bg = '#f44490'
let s:error_fg = 'white'

"    <SID>hi('Group',         gui_fg,        gui_bg,        gui)
call <SID>hi('CurrentWord',   '',            s:black,       '')
call <SID>hi('Normal',        s:fg,          s:bg,          '')
call <SID>hi('String',        s:string_fg,   '',            '')

call <SID>hi('ColorColumn',   '',            s:black,       '')
call <SID>hi('Cursor',        'grey5',       'khaki',       '')
call <SID>hi('CursorColumn',  '',            s:cursor_line, '')
call <SID>hi('CursorLine',    '',            s:cursor_line, '')
call <SID>hi('CursorLineNr',  s:cursor_line, s:cursor_line, '')
call <SID>hi('LineNr',        s:comment_fg,  s:cursor_line, s:_b_i)
call <SID>hi('Comment',       s:comment_fg,  '',            s:_b)
call <SID>hi('Error',         s:error_fg,    s:error_bg,    s:_b)
call <SID>hi('ErrorMsg',      s:error_fg,    s:error_bg,    s:_b)
call <SID>hi('NonAsciiChars', s:error_fg,    s:error_bg,    s:_b)

delfunction <SID>hi

hi Comment cterm=bold ctermfg=0
hi Error                ctermfg=7   ctermbg=1
hi ErrorMsg             term=standout ctermfg=7   ctermbg=1
hi SpellErrors          guifg=#101010  guibg=#f44490


" color 0-7 corresponds to low-intensity (normal) colours
" 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
" color 8-15 corresponds to high-intensity
" bold = bright foreground, blink = bright background

" ShowMarks
hi ShowMarksHLl guibg=grey25 guifg=#f65020 gui=bold
hi ShowMarksHLu guibg=grey25 guifg=#f65020 gui=bold
hi ShowMarksHLm guibg=grey25 guifg=#f65020 gui=bold

hi Pmenu      ctermfg=4 ctermbg=7 guibg=grey20
hi PmenuSel   ctermfg=1 ctermbg=4 guifg=red  guibg=grey60  gui=bold
hi PmenuThumb ctermfg=0

hi rubySymbol ctermfg=1  guifg=#63b5d4 ":aa
hi Identifier cterm=bold ctermfg=1 guifg=#e6a029 gui=bold "@@var,@var,|var|
hi Special    cterm=bold ctermfg=1 guifg=#f65020 gui=bold

"include require
hi Include              cterm=bold ctermfg=2 cterm=bold guifg=#a5efc9
hi rubyInterpolation    cterm=bold ctermfg=2 guifg=#9ce590 " "#{asdfasd}"

hi Constant             ctermfg=3 guifg=#ffd005 gui=italic   "1,true
hi Type                 cterm=bold ctermfg=1 guifg=#ffe799   "Mod::Deffed, Classdeffed
hi rubyPseudoVariable   cterm=bold ctermfg=3 guifg=#f0f045 gui=bold   "self

hi Define               ctermfg=3 guifg=#7796ff gui=bold,italic   "module,class,def,end

hi rubyConstant         ctermfg=5 cterm=bold guifg=#b1d3ff gui=bold      "SomeClass,SomeModule

hi Statement            term=bold cterm=bold ctermfg=3 guifg=#52cea8 gui=bold  "do-end,if,private

hi PreProc              cterm=reverse ctermbg=1 guifg=#bb4182 gui=bold guibg=grey25  "#!/bin/sh

hi Function             ctermfg=4 guifg=#e784b6 gui=bold       "method define

hi IncSearch            guifg=#749940 guibg=black
hi Search               cterm=bold ctermfg=0  ctermbg=3 guibg=#b58900 guifg=#002b36 gui=bold
hi WarningMsg           term=standout ctermfg=LightRed guifg=White guibg=#f44490 gui=bold

hi VertSplit            term=reverse cterm=reverse gui=reverse guibg=#c2bfa5 guifg=grey30

hi Folded guibg=black guifg=grey40
hi FoldColumn guibg=black guifg=grey20

hi ModeMsg term=bold cterm=bold gui=bold guifg=goldenrod
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen

hi Question guifg=springgreen
hi SpecialKey term=bold ctermfg=LightBlue guifg=yellowgreen
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold guibg=#c2bfa5 guifg=black
hi StatusLineNC term=reverse cterm=reverse gui=reverse guibg=#c2bfa5 guifg=grey40

hi Title guifg=gold gui=bold
hi Visual term=reverse ctermbg=black guibg=grey20 guifg=pink
hi VisualNOS cterm=bold,underline

hi Operator  guifg=Red    ctermfg=Red
hi Structure guifg=green  ctermfg=green
hi Ignore    guifg=grey40 ctermfg=DarkGrey
hi Directory  ctermfg=darkcyan
hi DiffAdd    ctermbg=4
hi DiffChange ctermbg=5
hi DiffDelete cterm=bold          ctermfg=4 ctermbg=6
hi DiffText   cterm=bold ctermbg=1

hi Underlined cterm=underline ctermfg=5 gui=underline

" TODO
hi Todo guifg=orangered guibg=yellow3 gui=bold

"hi TabLine              ctermfg=15  ctermbg=0
"hi TabLineFill          ctermfg=15  ctermbg=0   cterm=underline
"hi TabLineSel           ctermfg=0   ctermbg=86

hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Directory term=bold ctermfg=LightCyan guifg=Cyan
hi Folded term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi NonText term=bold ctermfg=LightBlue guifg=grey30 guibg=grey15 gui=bold

" Clojure colors
hi clojureKeyword ctermfg=blue guifg=#63b5fe gui=italic
hi clojureCharacter ctermfg=blue guifg=#2aa198 gui=bold
