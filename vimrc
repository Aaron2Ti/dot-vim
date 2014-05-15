" Source the vimrc file after saving it
" autocmd bufwritepost .vimrc source $MYVIMRC

" {{{ Basic Setting
set nocompatible

filetype on " !!!!

set shell=/bin/sh

set background=dark
colorscheme beijing_opera

autocmd!

syntax on

set synmaxcol=200

" indent code by syntax
filetype indent on

set laststatus=2

set encoding=utf-8 fileencodings=utf-8,ucs-bom,cp936 fileencoding=utf-8 termencoding=utf-8

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight invisible characters
set list
set listchars=tab:⇢\ ,eol:¬,nbsp:_,trail:·
set showbreak=↳
set linebreak
		" #add8e6"

set colorcolumn=80

set autoindent
set smartindent
set copyindent

set switchbuf=useopen

set shiftround
set expandtab
set smarttab
set nojoinspaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

autocmd FileType python set shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType fsharp set shiftwidth=4 softtabstop=4 tabstop=4

set virtualedit=all

set autoread

set complete=.,w,b,u,t,k,i,d

set cursorcolumn cursorline
set mouse=

set modeline

set grepformat=%f:%l:%m

set helplang=En history=100

set hlsearch incsearch ignorecase showmatch infercase smartcase

set magic hidden

set wrap
set whichwrap=<,>,h,l,~,[,]

set ruler showmode showcmd
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
set ttyscroll=3

" not redraw while executing macros, registers and other commands
set lazyredraw

set dictionary+=~/.vim/dict/default

set thesaurus+=~/.vim/thesaurus/default

" * Keystrokes -- Insert Mode
set backspace=start,indent,eol

set backupdir=~/.vim_tmp
set viewdir=~/.vim_tmp
set directory=~/.vim_tmp

set undodir=~/.vim_backup
" set undofile

set nobackup
set noswapfile
set nowritebackup
set noautowrite
set noerrorbells vb t_vb=

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
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*$py.class,*.class,*.fasl
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,.DS_Store,.gitignore,.git,tags
set wildignore+=*.swp,*.dex,*.apk,*.d,*.cache,*.ap_,.env
" }}} wildignore

" {{{ Core Maps
" inoremap ' "
" inoremap " '

iabbrev teh the
iabbrev accross across

" user ; for invoking command
" nnoremap - ;
" vnoremap - ;
" nnoremap ; :
" vnoremap ; :


vnoremap zy "*y
nnoremap zp "*p

vnoremap Q gq

" use , as leader character
nnoremap - ,
vnoremap - ,
let mapleader = ','


nnoremap ' `
nnoremap ` '


vnoremap g_ $
vnoremap $  g_


" [<Space> by default is like l]
noremap <Space>   10<C-E>
noremap <S-Space> 10<C-Y>

noremap <C-E> :Explore<CR>

" run current file with ruby
" nnoremap <F8> :w !ruby<CR>


" move current line up or down
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

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


" by default the K would run the "man" command
" Run a program to lookup the keyword under the
" cursor.  The name of the program is given with the
" 'keywordprg' (kp) option (default is "man").  The
noremap K k

" nmap <silent> <leader>/ :let @/=""<CR>
" clears the search buffer, nohl

" clean the search highlighting
nmap <silent> <ESC><ESC>  :nohlsearch <CR>

" replace " with '
noremap <leader>sq :%s/"/'/gc<CR>

" Delete all the buffers
noremap <leader>bd :bufdo bd<CR>

" Switch to last buffer
" nnoremap <leader><leader> <C-^>


" mkview & loadview
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
" noremap <leader>ej  :mkview<CR>
" noremap <leader>je  :loadview<CR>

" }}}

" plugins {{{

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows': 'make -f make_mingw32.mak',
      \     'cygwin':  'make -f make_cygwin.mak',
      \     'mac':     'make -f make_mac.mak',
      \     'unix':    'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'leafgarland/typescript-vim'

NeoBundle 'clausreinke/typescript-tools', {
      \ 'build' : {
      \     'windows': 'npm install -g',
      \     'cygwin':  'npm install -g',
      \     'mac':     'npm install -g',
      \     'unix':    'npm install -g',
      \    },
      \ }

NeoBundle 'idris-hackers/idris-vim'

NeoBundle 'kongo2002/fsharp-vim'

" Make gvim-only colorschemes work transparently in terminal vim
NeoBundle 'godlygeek/csapprox'

NeoBundle 'bruno-/vim-vertical-move'

NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'vim-scripts/VisIncr'

" NeoBundle 'justincampbell/vim-eighties'

NeoBundle 'AndrewRadev/multichange.vim'
" NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'hlissner/vim-multiedit'
" NeoBundle 'adinapoli/vim-markmultiple'

" {{{ switch.vim
NeoBundle 'AndrewRadev/switch.vim'

noremap <leader>sw :Switch<CR>

" convert :foo => 'bar' to foo: 'bar'
noremap <leader>st f:xepldf>

" autocmd FileType ruby let b:switch_definitions =
"   \ [
"   \   g:switch_builtins.ruby_hash_style,
"   \   g:switch_builtins.rspec_should,
"   \   { 'my_own_pattern': 'my_own_replacement' },
"   \ ]
" }}}

" NeoBundle 'yeti.vim'

NeoBundle 'jceb/vim-shootingstar'

NeoBundle 'vim-scripts/indent-motion'

NeoBundle 'b4winckler/vim-angry'

if has('python')
  " {{{ ultisnips
  NeoBundle 'SirVer/ultisnips'

  let g:UltiSnipsUsePythonVersion    = 2
  let g:UltiSnipsExpandTrigger       = '<C-s>'
  let g:UltiSnipsListSnippets        = '<C-S-s>'
  let g:UltiSnipsJumpForwardTrigger  = '<C-J>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

  " }}}

  " {{{ powerline
  NeoBundle 'Lokaltog/vim-powerline'
  let g:Powerline_theme='simple'
  " }}}

  " YouCompleteMe {{{
  NeoBundle 'Valloric/YouCompleteMe'

  let g:ycm_key_list_select_completion                    = ['<TAB>']
  let g:ycm_key_list_previous_completion                  = ['<S-TAB>']
  let g:ycm_allow_changing_updatetime                     = 0
  let g:ycm_complete_in_comments_and_strings              = 1
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  let g:ycm_add_preview_to_completeopt                    = 0

  let g:ycm_filetype_specific_completion_to_disable = {
      \ 'ruby' : 1,
      \ 'javascript' : 1,
      \}
  " }}}

  NeoBundle 'gcmt/breeze.vim'

  " {{{ psearch
  NeoBundle 'Aaron2Ti/psearch.vim'

  noremap <leader>d :PSearch<CR>
  noremap <leader>dd :PSearchw<CR>
  let g:pse_max_height=30
  " }}}
endif

" 'ervandew/supertab'

NeoBundle 'ajf/puppet-vim'

NeoBundle 'thinca/vim-visualstar'

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'

" {{{ surround
NeoBundle 'tpope/vim-surround'

NeoBundle 't9md/vim-surround_custom_mapping'
let g:surround_custom_mapping = {}
let g:surround_custom_mapping.ruby = {
    \ '-':  "<% \r %>",
    \ '=':  "<%= \r %>",
    \ '9':  "(\r)",
    \ '5':  "%(\r)",
    \ 'w':  "%w(\r)",
    \ '3':  "#{\r}",
    \ 'E':  "<<EOS \r EOS",
    \ }
" }}}

NeoBundle 'vim-ruby/vim-ruby'

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

NeoBundle 'kablamo/vim-git-log'

" {{{ nerdcommenter
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

let g:NERDCustomDelimiters = {
  \ 'fsharp': { 'left': '//' }
\ }
" }}}

" NeoBundle 'msanders/snipmate.vim'
NeoBundle 'kchmck/vim-coffee-script'

" NeoBundle 'henrik/vim-qargs'
NeoBundle 'Peeja/vim-cdo'

" Ack {{{
" NeoBundle 'mihaifm/bck'
NeoBundle 'mileszs/ack.vim'
nmap <leader>a :Ack!<Space>

let g:ackhighlight=1
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}

" delimitMate {{{
NeoBundle 'Raimondi/delimitMate'
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType ruby    let b:delimitMate_matchpairs = "(:),[:],{:}"
" }}}

" {{{ YankRing.vim
NeoBundle 'YankRing.vim'
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
nnoremap <silent> <C-p> :YRShow<CR>
" }}}

NeoBundle 'slim-template/vim-slim'

NeoBundle 'Keithbsmiley/rspec.vim'

NeoBundle 'sk1418/Join'

" {{{ for clojure
" NeoBundle 'tpope/vim-fireplace'
" NeoBundle 'guns/vim-clojure-static'
" NeoBundle 'kien/rainbow_parentheses.vim'
" }}}

" {{{ lusty
NeoBundle 'sjbach/lusty'

" let g:LustyJugglerShowKeys='alpha'
" let g:LustyJugglerShowKeys = 'a'
" let g:LustyJugglerSuppressRubyWarning = 1

noremap <leader>f :LustyFilesystemExplorerFromHere<CR>
" noremap <leader>b :LustyBufferExplorer<CR>
" nmap <silent> <Leader>j :LustyJuggler<CR>
" }}}

" {{{ command-t
NeoBundle 'wincent/Command-T.git'

let g:CommandTMatchWindowReverse=1

let g:CommandTMaxHeight=20

let g:CommandTCursorLeftMap='<C-b>'
let g:CommandTBackspaceMap='<C-h>'
let g:CommandTDeleteMap='<C-d>'
let g:CommandTCancelMap='<Esc>'

noremap <leader>b :CommandTBuffer<CR>

" <D-...>   command-key (Macintosh only)
noremap <D-b> :CommandTBuffer<CR>

" map <leader>g :CommandTTag<CR>
" map <leader>s :CommandTJump<CR>
" }}}

NeoBundle 'derekwyatt/vim-scala'

" kana/vim-smartinput # auto close " ' ( [ etc

NeoBundle 'vim-scripts/scratch.vim'
noremap <leader>so :Scratch<CR>

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'rhysd/vim-textobj-ruby'

" NeoBundle 'nelstrom/vim-textobj-rubyblock'
"
" {{{ kana
" NeoBundle 'kana/vim-smartword'
" map w  <Plug>(smartword-w)
" map b  <Plug>(smartword-b)
" map e  <Plug>(smartword-e)
" map ge <Plug>(smartword-ge)

" NeoBundle 'kana/vim-smarttill'
" }}}

" NeoBundle 'justinmk/vim-sneak'
" nmap - <Plug>SneakPrevious
" xmap - <Plug>VSneakPrevious


" {{{ vim-smalls cursor movement
NeoBundle 't9md/vim-smalls'

nmap s <Plug>(smalls)
omap s <Plug>(smalls)
xmap s <Plug>(smalls)

let g:smalls_auto_jump = 1
let g:smalls_auto_jump_min_input_length = 1

if !has('gui')
  let g:smalls_highlight = {
  \ 'SmallsCandidate':  [['none',      'none', '33',   ], [ 'bold', '', '']],
  \ 'SmallsJumpTarget': [['none',      'none', '160',  ], [ 'bold', '', '']],
  \ 'SmallsCurrent':    [['reverse',   '3',    '160',  ], [ 'none', '', '']],
  \ 'SmallsPos':        [['underline', '3',    '160',  ], [ 'bold', '', '']],
  \ 'SmallsShade':      [['none',      'none', '241',  ], [ 'none', '', '']],
  \ 'SmallsCli':        [['none',      'none', 'grey', ], [ 'none', '', '']],
  \ 'SmallsCliCursor':  [['none',      'none', 'grey', ], [ 'none', '', '']],
  \ }
endif
" }}}

" {{{ easymotion
NeoBundle 'Lokaltog/vim-easymotion'
" let g:EasyMotion_mapping_F = '<C-h>'
" let g:EasyMotion_mapping_f = '<C-l>'
let g:EasyMotion_mapping_j = '<C-l>'
let g:EasyMotion_mapping_k = '<C-h>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXYz'
" }}}

NeoBundle 'aliva/vim-fish'
NeoBundle 'nginx.vim'
NeoBundle 'SearchComplete'

NeoBundle 'taglist.vim'
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

NeoBundle 'majutsushi/tagbar'
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_width = 30

" NeoBundle 'SQLComplete.vim'

" NeoBundle 'genutils'
" NeoBundle 'foldutil.vim'

" NeoBundle 'sjl/clam.vim'

" {{{ vim-signature
NeoBundle 'kshenoy/vim-signature'
let g:SignatureDisableMenu=1
" let g:SignatureDefaultMappings=0

" noremap m<Space> :call signature#PurgeMarks()<CR>
" noremap m<Space> <Plug>SIG_PurgeMarks
" nmap <Leader>x <Plug>ToggleAutoCloseMappings
" }}}

NeoBundle 'godlygeek/tabular'

NeoBundle 'junegunn/vim-emoji'

" {{{ vim-easy-align
NeoBundle 'junegunn/vim-easy-align'

vnoremap <silent> <cr> :EasyAlign<cr>

let g:easy_align_delimiters = {
\ 'B': { 'pattern': '{\|}' },
\ ']': { 'pattern': '[\|]' }
\ }
" }}}

" Align {{{
NeoBundle 'Align'
vmap <leader>a<Space> :Align! p0P0 \S\+\s<CR>
vmap <leader>aa :Align<Space>
vmap <leader>ah :Align =><CR>
" }}}

NeoBundle 'matchit.zip'
" let b:match_words = '<%=:%>,<%:%>'

" Indent-Guides {{{
NeoBundle 'Indent-Guides'
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_start_level = 2
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey13 ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey8  ctermbg=4

" autocmd FileType ruby,coffee,javascript,html IndentGuidesEnable
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

" let g:Powerline_symbols='fancy'
" vim: foldmethod=marker
