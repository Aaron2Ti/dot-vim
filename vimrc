﻿" Source the vimrc file after saving it
" autocmd bufwritepost .vimrc source $MYVIMRC

" {{{ Basic Setting

set nocompatible

filetype on " !!!!

colorscheme drama

autocmd!

syntax on

" indent code by syntax
filetype indent on

set laststatus=2

set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936 fileencoding=utf-8 termencoding=utf-8

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight invisible characters
set listchars=tab:▸\ ,eol:¬,nbsp:_,trail:·
set list
		" #add8e6"

set autoindent
set smartindent
set copyindent

set switchbuf=useopen

set shiftround
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nojoinspaces

set virtualedit=all

set autoread

set complete=.,w,b,u,t,k,i,d

set cursorcolumn cursorline mouse=nv

set modeline

set grepformat=%f:%l:%m

set helplang=En history=100

set hlsearch incsearch ignorecase showmatch infercase smartcase

set shortmess+=r

set magic hidden

set wrap
set whichwrap=<,>,h,l,~,[,]

set ruler showmode showcmd nolazyredraw
" set number
set relativenumber

set scrolloff=3
set sidescrolloff=5
set sidescroll=1

set titlestring=%<%f%m
" title titleold=OSX

set shortmess=atI
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

" set backupdir=~/.vim_backup
set directory=~/.vim_swap

set nobackup
" set noswapfile

" {{{ no arrow keys
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
" }}}

" }}}

" {{{ filetypes
autocmd BufRead,BufNewFile *.ru,*.watchr set ft=ruby
autocmd BufRead,BufNewFile *.treetop     set ft=treetop
autocmd BufRead,BufNewFile *.coffee      set ft=coffee
autocmd BufRead,BufNewFile *.slim        set ft=slim
" }}}

" {{{ wildignore
set wildignore+=*.o,*.obj,*.log,*.gif,*.jpg,*.png,*.gz,*.db,*.swf,*.mp3
set wildignore+=coverage,.gem
set wildignore+=*.xls,*.xlsx,*.doc,*.docx,*.pdf
set wildignore+=tmp/cache
set wildignore+=CVS,.git
set wildignore+=*.eot,*.svg,*.ttf,*.woff
set wildignore+=*.jar
" }}} wildignore

" {{{ Core Maps
" inoremap ' "
" inoremap " '

abbreviate teh the

" user ; for invoking command
" nnoremap - ;
" vnoremap - ;
" nnoremap ; :
" vnoremap ; :

" use , as leader character
nnoremap - ,
vnoremap - ,
let mapleader = ','

nnoremap ' `
nnoremap ` '

" [<Space> by default is like l]
noremap <Space>   10<C-E>
noremap <S-Space> 10<C-Y>

noremap <C-E> :Explore<CR>

" run current file with ruby
" nnoremap <F8> :w !ruby<CR>

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]
" nnoremap <C-N> :next<CR>
" nnoremap <C-P> :prev<CR>

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
" imap <C-b> <C-O>b
" imap <C-e> <C-O>$

" sane movement with wrap turned on
" nnoremap j gj
" nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <leader>w :w<CR>

" Paste and select
noremap <leader>p p'[v']$

" clears the search buffer, nohl
" nmap <silent> <leader>/ :let @/=""<CR>
nmap <silent> <ESC><ESC> :nohlsearch<CR>

" replace " with '
noremap <leader>sq :%s/"/'/gc<CR>

" Delete all the buffers
noremap <leader>bd :bufdo bd<CR>

" Switch to last buffer
nnoremap <leader><leader> <C-^>


" mkview & loadview
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
noremap <leader>ej  :mkview<CR>
noremap <leader>je  :loadview<CR>

" save sudo permission
cmap ws w !sudo tee >/dev/null %
" }}}

" plugins {{{

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'ajf/puppet-vim'

NeoBundle 'AndrewRadev/multichange.vim'

NeoBundle 'tpope/vim-repeat'
" NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'vim-ruby/vim-ruby'
" NeoBundle 'tpope/vim-fugitive'

" {{{ vim-rails
NeoBundle 'tpope/vim-rails'
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
" }}}

" {{{ nerdcommenter
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
" }}}

" NeoBundle 'msanders/snipmate.vim'
NeoBundle 'kchmck/vim-coffee-script'

" NeoBundle 'henrik/vim-qargs'
NeoBundle 'Peeja/vim-cdo'

" Ack {{{
NeoBundle 'mileszs/ack.vim'
nmap <leader>a :Ack!<Space>

let g:ackhighlight=1
" }}}

" delimitMate {{{
NeoBundle 'Raimondi/delimitMate'
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType ruby    let b:delimitMate_matchpairs = "(:),[:],{:}"
" }}}

NeoBundle 'the-isz/MinYankRing.vim'

NeoBundle 'bbommarito/vim-slim'
" NeoBundle 'vim-scripts/DrawIt'

" {{{ VimClojure
NeoBundle 'vim-scripts/VimClojure'
let vimclojure#FuzzyIndent         = 1
let vimclojure#HighlightBuiltins   = 1
let vimclojure#HighlightContrib    = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#ParenRainbow        = 1
let vimclojure#WantNailgun         = 1
let vimclojure#NailgunClient       = '/Volumes/Data/Users/aaron/.lein/ng'
" let vimclojure#SetupKeyMap = 0
" let vimclojure#SetupKeyMapEvalToplevel = 1
autocmd BufRead,BufNewFile *.clj,*.cljs set ft=clojure
" }}}

" {{{ lusty
NeoBundle 'sjbach/lusty'

" let g:LustyJugglerShowKeys='alpha'
let g:LustyJugglerShowKeys = 'a'
let g:LustyJugglerSuppressRubyWarning = 1

map <leader>f :LustyFilesystemExplorerFromHere<CR>
map <leader>b :LustyBufferExplorer<CR>
" nmap <silent> <Leader>j :LustyJuggler<CR>
" }}}

" {{{ command-t
NeoBundle 'wincent/Command-T.git'
let g:CommandTMatchWindowReverse=1

let g:CommandTMaxHeight=20

let g:CommandTCursorRightMap='<C-f>'
let g:CommandTCursorLeftMap='<C-b>'
let g:CommandTBackspaceMap='<C-h>'
let g:CommandTDeleteMap='<C-d>'

" map <leader>g :CommandTTag<CR>
" map <leader>s :CommandTJump<CR>
" }}}


" kana/vim-smartinput # auto close " ' ( [ etc

" NeoBundle 'vim-scripts/Obvious-Mode'
" NeoBundle 'kien/ctrlp.vim.git'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

" {{{ neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_min_keyword_length = 4
let g:neocomplcache_enable_caching_message = 0
let g:neocomplcache_enable_fuzzy_completion = 1

let g:neocomplcache_same_filetype_lists.ruby = '_'
NeoBundle 'Shougo/neocomplcache'

NeoBundle 'Shougo/neosnippet'

imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}

" NeoBundle 'scrooloose/syntastic'
" NeoBundle 'ervandew/supertab'
" NeoBundle 'sjl/gundo.vim'
" NeoBundle 'kana/vim-textobj-user'
" NeoBundle 'nelstrom/vim-textobj-rubyblock'
" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'rstacruz/sparkup' " HTML haml editing

NeoBundle 'nginx.vim'
NeoBundle 'taglist.vim'
NeoBundle 'SearchComplete'
" NeoBundle 'SQLComplete.vim'
"
" NeoBundle 'multiselect'

" NeoBundle 'genutils'
" NeoBundle 'foldutil.vim'
"
" NeoBundle 'vim-scripts/Conque-Shell'

" NeoBundle 'sjl/clam.vim'

" {{{ vim-signature
NeoBundle 'kshenoy/vim-signature'
let g:SignatureDisableMenu=1
" let g:SignatureDefaultMappings=0

" noremap m<Space> :call signature#PurgeMarks()<CR>
" noremap m<Space> <Plug>SIG_PurgeMarks
" nmap <Leader>x <Plug>ToggleAutoCloseMappings
" }}}

" {{{ powerline
NeoBundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'
let g:Powerline_theme='simple'
" }}}

" bufexplorer {{{
NeoBundle 'bufexplorer.zip'
let g:bufExplorerShowRelativePath=1
map <leader>bb :BufExplorer<CR>
" }}}

" NeoBundle 'godlygeek/tabular'

" Align {{{
NeoBundle 'Align'
vmap <leader>a<Space> :Align! p0P0 \S\+\s<CR>
vmap <leader>aa :Align<Space>
vmap <leader>ah :Align =><CR>
" }}}

" AutoClose {{{
" NeoBundle 'AutoClose'
" AutoClose
" let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '<%': '%>'}
" let g:AutoCloseProtectedRegions = ["Character"]
" nmap <Leader>x <Plug>ToggleAutoCloseMappings
" }}}

NeoBundle 'matchit.zip'
" let b:match_words = '<%=:%>,<%:%>'

" Indent-Guides {{{
NeoBundle 'Indent-Guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey13 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey8  ctermbg=4

autocmd FileType ruby,coffee,javascript,html IndentGuidesEnable
" }}}

filetype plugin on

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif
" }}}

" gui_macvim {{{
if has('gui_macvim')
  set colorcolumn=80
  set lines=46 columns=122
  set fuoptions=maxvert,maxhorz
  set guioptions=egmtc
  " set guifont=Courier:h16
  " set guifont=Monaco:h14
  " set guifont=Source\ Code\ Pro:h15
  set guifont=Menlo:h18
  set guifontwide=Hei:h17

  set formatprg=par\ r

  set guicursor=a:blinkwait700-blinkon800-blinkoff500

  set undodir=~/.vim_backup
  set undofile

  set antialias

  " set clipboard=unnamed

  autocmd GUIEnter * call RemoveUselessMenus()
end

" vim: foldmethod=marker
