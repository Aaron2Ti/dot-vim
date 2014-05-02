" gui_macvim {{{1
if has('gui_macvim')
  set lines=38 columns=127
  set fuoptions=maxvert,maxhorz
  set guioptions=egmtc
  " set guifont=Courier:h16
  " set guifont=Monaco:h16
  set guifont=DejaVu\ Sans\ Mono:h18
  " set guifont=Menlo:h18

  set guifontwide=Hei:h16

  set formatprg=par\ -w70p0s0r

  set guicursor=a:blinkwait700-blinkon800-blinkoff500

  set antialias

  " set clipboard=unnamed

  autocmd GUIEnter * call RemoveUselessMenus()

  colorscheme drama
end

let g:Powerline_symbols='compatible'

" vim: foldmethod=marker
