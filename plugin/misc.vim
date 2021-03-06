" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


function <SID>SaveLastSearch()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>SaveLastSearch()


function <SID>StripTrailingWhitespace()
  if exists('b:noStripTrailingWhitespace')
    return
  endif

  " Strip trailing whitespace
  %s/\s\+$//e

  " remove empty lines at end of file
  %s/\($\n\s*\)\+\%$//e
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()


function ToggleLineNumber()
  if &relativenumber
    setlocal nonumber
    setlocal norelativenumber
  else
    setlocal relativenumber
  endif
endfunction
nnoremap <leader>n :call ToggleLineNumber()<CR>

" add hat to char
" a^Vu0302^[

function RemoveUselessMenus()
  aunmenu File.Open\.\.\.
  aunmenu File.Split-Open\.\.\.
  aunmenu File.Open\ Tab\.\.\.
  aunmenu File.Open\ Recent
  aunmenu File.Close\ Window
  aunmenu File.Close
  aunmenu File.Save
  aunmenu File.Save\ All
  aunmenu File.Save\ As\.\.\.
  aunmenu File.Split\ Diff\ with\.\.\.
  aunmenu File.Split\ Patched\ By\.\.\.
  aunmenu File.Print

  aunmenu Edit.Undo
  aunmenu Edit.Redo
  aunmenu Edit.Repeat
  aunmenu Edit.Cut
  aunmenu Edit.Put\ Before
  aunmenu Edit.Put\ After
  aunmenu Edit.Select\ All
  aunmenu Edit.Find
  aunmenu Edit.Keymap

  aunmenu Buffers.Refresh\ menu
  aunmenu Buffers.Delete
  aunmenu Buffers.Alternate
  aunmenu Buffers.Next
  aunmenu Buffers.Previous

  aunmenu Tools.
  aunmenu Syntax.
  aunmenu DrChip.
  aunmenu Window.
  aunmenu Help.
endfunction

" mkdir and wirte
function <SID>MkSave()
  !mkdir -p %:h

  w
endfunction
command MkWrite :call <SID>MkSave()

function <SID>ClearMarks()
  delmarks! | delmarks 0-9a-zA-Z
endfunction
command ClearMarks :call <SID>ClearMarks()


function <SID>ClearRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction
command ClearRegisters :call <SID>ClearRegisters()
