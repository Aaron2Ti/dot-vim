function <SID>StripTrailing()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " Strip trailing whitespace
  %s/\s\+$//e

  " remove empty lines at end of file
  %s/\($\n\s*\)\+\%$//e

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailing()

function ToggleLineNumber()
  if &relativenumber
    setlocal number
  else
    setlocal relativenumber
  endif
endfunction
map <leader>n :call ToggleLineNumber()<CR>
