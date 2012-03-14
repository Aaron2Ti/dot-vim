﻿set nocompatible

colorscheme drama

autocmd!

filetype off " !!!!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ajf/puppet-vim'
Bundle 'wincent/Command-T.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'sjbach/lusty'
Bundle 'mileszs/ack.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'the-isz/MinYankRing.vim'
Bundle 'bbommarito/vim-slim'

" Bundle 'kien/ctrlp.vim.git'

" Bundle 'Shougo/neocomplcache'
" Bundle 'scrooloose/syntastic'
" Bundle 'ervandew/supertab'
" Bundle 'godlygeek/tabular'
" Bundle 'sjl/gundo.vim'
" Bundle 'kana/vim-textobj-user'
" Bundle 'nelstrom/vim-textobj-rubyblock'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup' " HTML haml editing

Bundle 'Align'
Bundle 'matchit.zip'
Bundle 'bufexplorer.zip'
Bundle 'nginx.vim'
Bundle 'ShowMarks'
Bundle 'taglist.vim'
Bundle 'SearchComplete'
" Bundle 'SQLComplete.vim'
" Bundle 'multiselect'
" Bundle 'AutoClose'
" Bundle 'genutils'
" Bundle 'foldutil.vim'
"

" ShowMarks
let g:showmarks_ignore_type="hpq"
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_include="fdghashjkertywquiopzxcvbnmlFDGHASHJKERTYWQUIOPZXCVBNML"
nmap <Leader>mf :ShowMarksClearMark<CR>

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC

" set ruby filetypes
autocmd BufRead,BufNewFile *.ru,*.watchr set ft=ruby
autocmd BufRead,BufNewFile *.treetop set ft=treetop

" store and restore folds
" au BufWinLeave *.rb,*.haml,*.erb mkview
" au BufWinEnter *.rb,*.haml,*.erb silent loadview
" au BufWinEnter *.rb,*.haml,*.erb silent loadview

" '^\\s*$' && getline(v:lnum+1) =~ '\\S' ? '<1' : 1

" fold ruby methods only
" function! RubyMethodFold(line)
"   let line_is_method_or_end = synIDattr(synID(a:line,1,0), 'name') == 'rubyMethodBlock'
"   let line_is_def = getline(a:line) =~ '\s*def '
"   return line_is_method_or_end || line_is_def
" endfunction
" au FileType ruby set foldexpr=RubyMethodFold(v:lnum)
" au FileType ruby set foldmethod=expr

" au FileType ruby set foldmethod=indent
au FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:}"

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" indent code by syntax
filetype plugin on
filetype indent on

set dictionary+=~/.vim/dict

" * Keystrokes -- Insert Mode
set backspace=start,indent,eol

set ttyfast

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight whitespaces
set list
set listchars=tab:▸\ ,eol:¬
		" #add8e6"

set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936 fileencoding=utf-8 termencoding=utf-8

set autoindent smartindent
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
set virtualedit=all

set autoread

set cursorline mouse=nv

set modeline

set grepformat=%f:%l:%m

set helplang=En history=500

set hlsearch incsearch ignorecase showmatch shortmess+=r infercase smartcase

set magic hidden

" Move around lines
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set wrap
set whichwrap=<,>,h,l,~,[,]

set ruler showmode showcmd nolazyredraw
" set number
set relativenumber

set scrolloff=3
set sidescrolloff=8

set titlestring=%<%f%m
" title titleold=OSX

set shiftround shortmess=atI
set wildmode=list:longest
set wildmenu wildmode=list:longest,full

set visualbell t_vb=

set formatoptions-=t
set formatoptions+=n

set ttyfast

syntax on

if has('gui')
  set colorcolumn=80
  set lines=45 columns=122
  set fuoptions=maxvert,maxhorz
  set guioptions=egmRLtc
  " set guifont=Courier:h16 guifontwide=Kai:h16
  " set guifont=Monaco:h14 guifontwide=Kai:h14
  set guifont=Menlo:h15 guifontwide=Hei:h14
  set formatprg=par\ r
end

if has('gui_running')
  set undodir=~/.vim_backup
  set undofile
endif

set backupdir=~/.vim_backup
set directory=~/.vim_swap
" set nobackup
" set noswapfile

" bufexplorer config
let g:bufExplorerShowRelativePath=1

"
nnoremap - ;
vnoremap - ;
nnoremap _ ,
vnoremap _ ,

" user ; for invoking command
nnoremap ; :
vnoremap ; :
" nnoremap <SPACE> :

" use , as leader character
let mapleader = ','

nnoremap ' `
nnoremap ` '

" [<Space> by default is like l, <BkSpc> like h, and - like k.]
noremap <BS> <C-U>
noremap <Space> <C-D>

" noremap <C-A> <C-T>
" noremap <C-S> <C-]>

" noremap <C-D> <C-Y>
" noremap <C-U> <C-E>
noremap <C-E> :Explore<CR>

" use <F6> to cycle through split windows
" and <Shift>+<F6> to cycle backwards, where possible:
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W
nnoremap <F8> :w !ruby<CR>

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>

" move current line up or down
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

"complement
imap <C-c> <C-x><C-u>

" movement keybindings in insert mode
imap <C-b> <C-O>b
imap <C-e> <C-O>$

" sane movement with wrap turned on
" nnoremap j gj
" nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <leader>w :w<CR>
" nmap <leader>q :wqa!<CR>
" nmap <leader><Esc> :q!<CR>

vmap <leader>as :Align! p0P0 \S\+\s<CR>
vmap <leader>aa :Align
vmap <leader>ah :Align =><CR>

" Delete whitespace at the line ending
noremap <leader>dd :%s/\s\+$//e<CR>
" Delete empty lines
" :%s/^[\ \t]*\n//g<CR>

noremap <leader>sq :%s/"/'/gc<CR>

" Delete all the buffers
noremap <leader>bd :bufdo bd<CR>
" Switch to last buffer
nnoremap <leader><leader> <C-^>
" noremap <tab> :bn<CR>
" noremap <S-tab> :bp<CR>

noremap <leader>r   :R<Space>
noremap <leader>ra  :R config/application.rb<CR>
noremap <leader>rr  :R config/routes.rb<CR>
noremap <leader>rg  :R Gemfile<CR>
noremap <leader>rj  :Rjavascript<Space>
noremap <leader>rm  :Rmodel<Space>
noremap <leader>rc  :Rcontroller<Space>
noremap <leader>rca :Rcontroller application<CR>
noremap <leader>rl  :Rlayout<Space>
noremap <leader>rla :Rlayout application<CR>
noremap <leader>rv  :Rview<Space>
noremap <leader>rh  :Rhelper<Space>
noremap <leader>rha :Rhelper application<CR>
noremap <leader>ri  :Rinitializer<Space>
noremap <leader>rs  :Rstylesheet<Space>

" clears the search buffer, nohl
" nmap <silent> <leader>/ :let @/=""<CR>
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" map <leader>f :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
map <leader>f :LustyFilesystemExplorerFromHere<CR>
map <leader>ff :LustyFilesystemExplorer<CR>
map <leader>b :LustyBufferExplorer<CR>
map <leader>bb :BufExplorer<CR>

" nmap <silent> <Leader>j :LustyJuggler<CR>
let g:LustyJugglerShowKeys = 'a'
let g:LustyJugglerSuppressRubyWarning = 1

" map <leader>g :YRShow<CR>
" map <D-R> :YRShow<CR>

" matchit settings
" let b:match_words = '<%=:%>,<%:%>'

" save with permission
cmap ws w !sudo tee >/dev/null %

ab teh the

" The NERD commenter configs
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" yankring
let g:yankring_history_file = '.yankring_history'
let s:yr_has_voperator=0

" command-t
let g:CommandTMatchWindowAtTop=1
let g:CommandTCursorRightMap='<C-f>'
let g:CommandTCursorLeftMap='<C-b>'
let g:CommandTBackspaceMap='<C-h>'
let g:CommandTDeleteMap='<C-d>'

set wildignore+=*.o,*.obj,.git,*.log,*.gif,*.jpg,*.png,*.gz,*.db,*.swf,*.mp3
set wildignore+=coverage,.gem
set wildignore+=tmp/cache
set wildignore+=CVS

" let g:LustyJugglerShowKeys='alpha'

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '<%': '%>'}
let g:AutoCloseProtectedRegions = ["Character"]

" Ack
nmap <leader>a :Ack<Space>
let g:ackhighlight=1

" AutoClose
nmap <Leader>x <Plug>ToggleAutoCloseMappings
