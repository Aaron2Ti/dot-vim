" Source the vimrc file after saving it
" autocmd bufwritepost .vimrc source $MYVIMRC

" {{{ Basic Setting

set nocompatible

filetype on " !!!!

colorscheme drama

autocmd!

syntax on

" indent code by syntax
filetype plugin on
filetype indent on

set laststatus=2

set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936 fileencoding=utf-8 termencoding=utf-8

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight invisible characters
set list
set listchars=tab:▸\ ,eol:¬,nbsp:_,trail:·
		" #add8e6"

set autoindent smartindent
set expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
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

" set backupdir=~/.vim_backup
set directory=~/.vim_swap

set nobackup
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

" {{{ filetypes
autocmd BufRead,BufNewFile *.ru,*.watchr set ft=ruby
autocmd BufRead,BufNewFile *.treetop set ft=treetop
autocmd BufRead,BufNewFile *.coffee set ft=coffee
autocmd BufRead,BufNewFile *.slim set ft=slim

autocmd FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:}"

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'ajf/puppet-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'

" Bundle 'godlygeek/tabular'

" {{{ vim-rails
Bundle 'tpope/vim-rails'
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

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'

" {{{ nerdcommenter
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
" }}}

Bundle 'msanders/snipmate.vim'
Bundle 'kchmck/vim-coffee-script'

" Ack {{{
Bundle 'mileszs/ack.vim'
" Ack
nmap <leader>a :Ack<Space>
let g:ackhighlight=1
" }}}

Bundle 'Raimondi/delimitMate'
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"

Bundle 'the-isz/MinYankRing.vim'

Bundle 'bbommarito/vim-slim'
" Bundle 'vim-scripts/DrawIt'
" Bundle 'tpope/vim-fugitive'

" {{{ VimClojure
Bundle 'vim-scripts/VimClojure'
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
Bundle 'sjbach/lusty'

" let g:LustyJugglerShowKeys='alpha'
let g:LustyJugglerShowKeys = 'a'
let g:LustyJugglerSuppressRubyWarning = 1

map <leader>f :LustyFilesystemExplorerFromHere<CR>
map <leader>b :LustyBufferExplorer<CR>
" nmap <silent> <Leader>j :LustyJuggler<CR>
" }}}

" {{{ command-t
Bundle 'wincent/Command-T.git'
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

" Bundle 'vim-scripts/Obvious-Mode'
" Bundle 'kien/ctrlp.vim.git'

" Bundle 'Shougo/neocomplcache'
" Bundle 'scrooloose/syntastic'
" Bundle 'ervandew/supertab'
" Bundle 'sjl/gundo.vim'
" Bundle 'kana/vim-textobj-user'
" Bundle 'nelstrom/vim-textobj-rubyblock'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup' " HTML haml editing

Bundle 'nginx.vim'
Bundle 'taglist.vim'
Bundle 'SearchComplete'
" Bundle 'SQLComplete.vim'
"
" Bundle 'multiselect'

" Bundle 'genutils'
" Bundle 'foldutil.vim'
"
" Bundle 'vim-scripts/Conque-Shell'

" Bundle 'sjl/clam.vim'

" {{{ ShowMarks
Bundle 'ShowMarks'
let g:showmarks_ignore_type="hpq"
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_include="fdghashjkertywquiopzxcvbnmlFDGHASHJKERTYWQUIOPZXCVBNML"
" }}}

" {{{ powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'
let g:Powerline_theme='simple'
" }}}

" bufexplorer {{{
Bundle 'bufexplorer.zip'
let g:bufExplorerShowRelativePath=1
map <leader>bb :BufExplorer<CR>
" }}}

" Align {{{
Bundle 'Align'
vmap <leader>as :Align! p0P0 \S\+\s<CR>
vmap <leader>aa :Align
vmap <leader>ah :Align =><CR>
" }}}

" AutoClose {{{
" Bundle 'AutoClose'
" AutoClose
" let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '<%': '%>'}
" let g:AutoCloseProtectedRegions = ["Character"]
" nmap <Leader>x <Plug>ToggleAutoCloseMappings
" }}}

Bundle 'matchit.zip'
" let b:match_words = '<%=:%>,<%:%>'

" Indent-Guides {{{
Bundle 'Indent-Guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey13 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey8  ctermbg=4

autocmd FileType ruby,coffee,javascript,html IndentGuidesEnable
" }}}

" }}}

" gui_macvim {{{
if has('gui_macvim')
  set colorcolumn=80
  set lines=45 columns=122
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

  " set clipboard=unnamed

  autocmd GUIEnter * call RemoveUselessMenus()
end

" vim: foldmethod=marker
