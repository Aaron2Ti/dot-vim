" gui_macvim {{{1
if has('gui_macvim')
  set lines=47 columns=158
  set fuoptions=maxvert,maxhorz
  set guioptions=egmtc
  " set guifont=Courier:h16
  " set guifont=Monaco:h16
  " set guifont=DejaVu\ Sans\ Mono:h14
  set guifont=Monoid\ HalfTight:h14
  " set guifont=NanumGothic_Coding:h13
  " set guifont=Menlo:h18

  " set guifontwide=Hei:h16

  set formatprg=par\ -w70p0s0r

  set guicursor=a:blinkwait900-blinkon1200-blinkoff800

  set antialias

  " set clipboard=unnamed

  autocmd GUIEnter * call RemoveUselessMenus()

  colorscheme drama
endif

let g:Powerline_symbols='compatible'

" vim: foldmethod=marker foldlevel=2
