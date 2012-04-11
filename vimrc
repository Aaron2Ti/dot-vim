" Source the vimrc file after saving it
" autocmd bufwritepost .vimrc source $MYVIMRC

" {{{ Basic Setting

set nocompatible

filetype off " !!!!

colorscheme drama

autocmd!

" indent code by syntax
filetype plugin on
filetype indent on

syntax on

set laststatus=2

set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936 fileencoding=utf-8 termencoding=utf-8

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight whitespaces
set list
set listchars=tab:▸\ ,eol:¬
		" #add8e6"

set autoindent smartindent
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
set virtualedit=all

set autoread

set cursorcolumn cursorline mouse=nv

set modeline

set grepformat=%f:%l:%m

set helplang=En history=500

set hlsearch incsearch ignorecase showmatch shortmess+=r infercase smartcase

set magic hidden

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


set dictionary+=~/.vim/dict

" * Keystrokes -- Insert Mode
set backspace=start,indent,eol

set ttyfast

set backupdir=~/.vim_backup
set directory=~/.vim_swap

" set nobackup
" set noswapfile

" {{{ no arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}

" }}}

" gui_macvim {{{
if has('gui_macvim')
  set colorcolumn=80
  set lines=45 columns=122
  set fuoptions=maxvert,maxhorz
  set guioptions=egmRLtc
  " set guifont=Courier:h16 guifontwide=Kai:h16
  " set guifont=Monaco:h14 guifontwide=Kai:h14
  set guifont=Menlo:h15 guifontwide=Hei:h14
  set formatprg=par\ r

  set guicursor=a:blinkwait700-blinkon800-blinkoff500

  set undodir=~/.vim_backup
  set undofile
end
" }}}

" {{{ filetypes
autocmd BufRead,BufNewFile *.ru,*.watchr set ft=ruby
autocmd BufRead,BufNewFile *.treetop set ft=treetop

autocmd FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:}"

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" }}}

" {{{ wildignore
set wildignore+=*.o,*.obj,.git,*.log,*.gif,*.jpg,*.png,*.gz,*.db,*.swf,*.mp3
set wildignore+=coverage,.gem
set wildignore+=tmp/cache
set wildignore+=CVS
" }}} wildignore

" {{{ Core Maps

" user ; for invoking command
nnoremap - ;
vnoremap - ;
nnoremap ; :
vnoremap ; :
" nnoremap <SPACE> :

" use , as leader character
nnoremap _ ,
vnoremap _ ,
let mapleader = ','

nnoremap ' `
nnoremap ` '

" [<Space> by default is like l, <BkSpc> like h, and - like k.]
noremap <BS> <C-U>
noremap <Space> <C-D>

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

" clears the search buffer, nohl
" nmap <silent> <leader>/ :let @/=""<CR>
nmap <silent> <ESC><ESC> :nohlsearch<CR>


" }}}
"
" plugins {{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ajf/puppet-vim'
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
Bundle 'vim-scripts/DrawIt'
Bundle 'tpope/vim-fugitive'

" {{{ command-t
Bundle 'wincent/Command-T.git'
" let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=1
let g:CommandTCursorRightMap='<C-f>'
let g:CommandTCursorLeftMap='<C-b>'
let g:CommandTBackspaceMap='<C-h>'
let g:CommandTDeleteMap='<C-d>'
" }}}


" kana/vim-smartinput # auto close " ' ( [ etc

" Bundle 'vim-scripts/Obvious-Mode'
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
Bundle 'taglist.vim'
Bundle 'SearchComplete'
" Bundle 'SQLComplete.vim'
" Bundle 'multiselect'
" Bundle 'AutoClose'
" Bundle 'genutils'
" Bundle 'foldutil.vim'
"
" Bundle 'vim-scripts/Conque-Shell'

Bundle 'sjl/clam.vim'

" {{{ ShowMarks
Bundle 'ShowMarks'
let g:showmarks_ignore_type="hpq"
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_include="fdghashjkertywquiopzxcvbnmlFDGHASHJKERTYWQUIOPZXCVBNML"
" }}}

" {{{ powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbol='fancy'
" }}}

" }}}

" bufexplorer config
let g:bufExplorerShowRelativePath=1

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
noremap <leader>rr  :R config/routes.rb<CR>
noremap <leader>rm  :Rmodel<Space>
noremap <leader>rc  :Rcontroller<Space>
noremap <leader>rl  :Rlayout<Space>
noremap <leader>rv  :Rview<Space>
noremap <leader>rh  :Rhelper<Space>
noremap <leader>ri  :Rinitializer<Space>
noremap <leader>rj  :Rjavascript<Space>
noremap <leader>rs  :Rstylesheet<Space>

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

" let g:LustyJugglerShowKeys='alpha'

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '<%': '%>'}
let g:AutoCloseProtectedRegions = ["Character"]

" Ack
nmap <leader>a :Ack<Space>
let g:ackhighlight=1

" AutoClose
nmap <Leader>x <Plug>ToggleAutoCloseMappings

" vim: foldmethod=marker
