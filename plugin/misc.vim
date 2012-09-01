function <SID>SaveResotreCursor()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>SaveResotreCursor()


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
autocmd FileType markdown let b:noStripTrailingWhitespace=1


function ToggleLineNumber()
  if &relativenumber
    setlocal number
  else
    setlocal relativenumber
  endif
endfunction
nnoremap <leader>n :call ToggleLineNumber()<CR>
