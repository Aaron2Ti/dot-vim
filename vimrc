" {{{ Basic Setting
set nocompatible
filetype on " !!!!

set shell=/bin/sh

set background=dark
colorscheme beijing_opera

" Remove ALL autocommands for the current group.
autocmd!

syntax on

set synmaxcol=200

" indent code by syntax
filetype indent on

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set helplang=En
set history=100

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight invisible characters
set list
set listchars=tab:⇢\ ,nbsp:_,trail:·
set showbreak=↳
set linebreak
		" #add8e6"

set colorcolumn=80

set autoindent
set smartindent
set copyindent

set switchbuf=useopen

set expandtab
set nojoinspaces
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2

set virtualedit=all

set autoread

set complete=.,w,b,u,t,k,i,d

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" set cursorcolumn
set cursorline
set mouse=

set modeline

set grepformat=%f:%l:%m

set hlsearch incsearch ignorecase showmatch infercase smartcase

set magic hidden

set wrap
set whichwrap=<,>,h,l,~,[,]

set ruler showmode showcmd

set norelativenumber
set nonumber

set scrolloff=3
set sidescrolloff=5
set sidescroll=1

" set titlestring=%<%f%m
set titlestring=%f%m
set title
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
autocmd BufRead,BufNewFile *.ru,*.watchr setlocal ft=ruby
autocmd BufRead,BufNewFile *.treetop     setlocal ft=treetop
autocmd BufRead,BufNewFile *.coffee      setlocal ft=coffee
autocmd BufRead,BufNewFile *.slim        setlocal ft=slim
" }}}

" {{{ wildignore
set wildignore+=*.o,*.obj,*.log,*.gif,*.jpg,*.png,*.gz,*.db,*.swf,*.mp3
set wildignore+=*.min.js
set wildignore+=coverage,.gem
set wildignore+=*.xls,*.xlsx,*.doc,*.docx,*.pdf
set wildignore+=tmp/cache/*
set wildignore+=CVS,.git
set wildignore+=*.eot,*.svg,*.ttf,*.woff
set wildignore+=*.jar
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*$py.class,*.class,*.fasl
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,.DS_Store,.gitignore,.git,tags
set wildignore+=*.swp,*.dex,*.apk,*.d,*.cache,*.ap_,.env
set wildignore+=target/*
set wildignore+=classes/*
set wildignore+=.lein-deps-sum,.lein-repl-history,.lein-plugins,.lein-failures

set wildignore+=.eunit,deps,*.o,*.beam,*.plt,erl_crash.dump

" }}} wildignore

" {{{ Core Maps
" inoremap ' "
" inoremap " '

iabbrev teh the
iabbrev accross across

vnoremap zy "+y
nnoremap zp "+p

vnoremap Q gq

" use , as leader character
nnoremap - ,
vnoremap - ,
let mapleader = ','

" [<Space> by default is like l]
noremap <Space>   15<C-E>
noremap <S-Space> 15<C-Y>


nnoremap ' `
nnoremap ` '


vnoremap g_ $
vnoremap $  g_


" move current line up or down
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

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

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" A collection of language packs for Vim
" NeoBundle 'sheerun/vim-polyglot'

" Shougo/vimproc.vim {{{
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows': 'make -f make_mingw32.mak',
      \     'cygwin':  'make -f make_cygwin.mak',
      \     'mac':     'make -f make_mac.mak',
      \     'unix':    'make -f make_unix.mak',
      \    },
      \ }
"}}}

" Auto detect CJK and Unicode file encodings
" Install https://github.com/adah1972/tellenc
" FencView
NeoBundle 'mbbill/fencview'

NeoBundle 'haya14busa/incsearch.vim'
autocmd VimEnter * :map /  <Plug>(incsearch-forward)

"{{{ latex
" NeoBundleLazy 'http://git.code.sf.net/p/vim-latex/vim-latex',
"               \ {'name': 'vim-latex-suite', 'type': 'git'}
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box'

autocmd FileType tex,latex,plaintex NeoBundleSource LaTeX-Box
" autocmd FileType tex,latex,plaintex NeoBundleSource vim-latex-suite
"}}}

"{{{ Python
NeoBundleLazy 'klen/python-mode'

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType python NeoBundleSource python-mode
"}}}

"{{{ ultisnips, YouCompleteMe, Powerline etc
if has('python')
  " {{{ ultisnips
  NeoBundle 'SirVer/ultisnips'

  let g:UltiSnipsUsePythonVersion    = 2
  let g:UltiSnipsExpandTrigger       = '<C-s>'
  " let g:UltiSnipsListSnippets        = '<C-S-s>'
  let g:UltiSnipsJumpForwardTrigger  = '<C-J>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-K>'
  " }}}

  " YouCompleteMe {{{
  NeoBundle 'Valloric/YouCompleteMe'

  let g:ycm_key_list_select_completion                    = ['<TAB>']
  let g:ycm_key_list_previous_completion                  = ['<S-TAB>']
  let g:ycm_allow_changing_updatetime                     = 0
  let g:ycm_complete_in_comments_and_strings              = 1
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  let g:ycm_add_preview_to_completeopt                    = 0

  let g:ycm_semantic_triggers =  {
      \  'c':          ['->', '.'],
      \  'objc':       ['->', '.'],
      \  'ocaml':      ['.', '#'],
      \  'cpp,objcpp': ['->', '.', '::'],
      \  'perl':       ['->'],
      \  'php':        ['->', '::'],
      \  'cs,java':    ['.'],
      \  'ruby':       ['.', '::'],
      \  'lua':        ['.', ':'],
      \  'erlang':     [':'],
      \  'haskell':    ['.'],
      \}


  let g:ycm_filetype_specific_completion_to_disable = {
      \ 'ruby' : 1,
      \ 'javascript' : 1,
      \}

  let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'notes' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'pandoc' : 1,
        \ 'mail' : 1
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
"}}}

"{{{ javascript
NeoBundleLazy 'pangloss/vim-javascript'

autocmd FileType javascript NeoBundleSource vim-javascript
"}}}

NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'elixir-lang/vim-elixir'

NeoBundle 'vim-scripts/SyntaxRange'

"{{{ markdown
NeoBundleLazy 'tpope/vim-markdown'

autocmd FileType markdown setlocal spell
autocmd FileType markdown NeoBundleSource vim-markdown
"}}}

"{{{ liquid
NeoBundleLazy 'tpope/vim-liquid'

autocmd FileType liquid NeoBundleSource vim-liquid
"}}}

"{{{ haml
NeoBundleLazy 'tpope/vim-haml'

autocmd FileType haml NeoBundleSource vim-haml
"}}}

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-dispatch'

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

"{{{ typescript
NeoBundleLazy 'leafgarland/typescript-vim'

" clausreinke/typescript-tools {{{
NeoBundleLazy 'clausreinke/typescript-tools', {
      \ 'build' : {
      \     'windows': 'npm install -g',
      \     'cygwin':  'npm install -g',
      \     'mac':     'npm install -g',
      \     'unix':    'npm install -g',
      \    },
      \ }
"}}}

autocmd FileType typescript NeoBundleSource typescript-vim
autocmd FileType typescript NeoBundleSource typescript-tools
"}}}

"{{{ idris
NeoBundle 'idris-hackers/idris-vim'
autocmd FileType idris setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType idris setlocal commentstring=--\ %s
"}}}

"{{{ erlang
NeoBundleLazy 'jimenezrick/vimerl'

let erlang_show_errors = 0
let erlang_completion_cache = 1

autocmd FileType erlang setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType erlang let g:ycm_cache_omnifunc=0

NeoBundleLazy 'edkolev/erlang-motions.vim'

autocmd FileType erlang NeoBundleSource vimerl
autocmd FileType erlang NeoBundleSource erlang-motions.vim
"}}}

NeoBundle 'chrisbra/unicode.vim'

"{{{ fsharp
autocmd FileType fsharp setlocal shiftwidth=4 softtabstop=4 tabstop=8

NeoBundle 'kongo2002/fsharp-vim'
"}}}

"{{{ Haskell
NeoBundle 'pbrisbin/vim-syntax-shakespeare'

NeoBundle 'travitch/hasksyn'

NeoBundleLazy 'eagletmt/ghcmod-vim'
NeoBundleLazy 'eagletmt/neco-ghc'

NeoBundleLazy 'Twinside/vim-haskellFold'

autocmd FileType haskell setlocal shiftwidth=4 softtabstop=4 tabstop=8 omnifunc=necoghc#omnifunc

autocmd FileType haskell NeoBundleSource ghcmod-vim
autocmd FileType haskell NeoBundleSource neco-ghc
autocmd FileType haskell NeoBundleSource vim-haskellFold
"}}}

"{{{ R
NeoBundleLazy 'R.vim'

autocmd FileType r NeoBundleSource R.vim
"}}}


" {{{ julia
" NeoBundleLazy 'JuliaLang/julia-vim'

" autocmd FileType julia NeoBundleSource julia-vim
" }}}

" XtermColorTable
NeoBundle 'guns/xterm-color-table.vim'

" Make gvim-only colorschemes work transparently in terminal vim
NeoBundle 'godlygeek/csapprox'

NeoBundle 'bruno-/vim-vertical-move'

NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'vim-scripts/VisIncr'

" NeoBundle 'justincampbell/vim-eighties'

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

NeoBundle 'thinca/vim-visualstar'

NeoBundle 'vim-scripts/indent-motion'

NeoBundle 'b4winckler/vim-angry'

NeoBundle 'ajf/puppet-vim'

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

"{{{
NeoBundle 'tpope/vim-commentary'
"}}}

"{{{ coffee-script
NeoBundleLazy 'kchmck/vim-coffee-script'

autocmd FileType coffee NeoBundleSource vim-coffee-script
"}}}

" NeoBundle 'henrik/vim-qargs'
NeoBundle 'Peeja/vim-cdo'

" Ag {{{
" NeoBundle 'mihaifm/bck'
NeoBundle 'rking/ag.vim'

nmap <leader>a :Ag!<Space>
" }}}

" {{{ delimitMate
NeoBundle 'Raimondi/delimitMate'
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType ruby    let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType r       let b:delimitMate_matchpairs = "(:),[:],{:}"
" }}}

" {{{ YankRing.vim
NeoBundle 'YankRing.vim'
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
let g:yankring_history_dir = '~/.tmp'
nnoremap <silent> <C-p> :YRShow<CR>
" }}}

"{{{ slim
NeoBundleLazy 'slim-template/vim-slim'

autocmd FileType slim NeoBundleSource vim-slim
"}}}

" {{{ clojure
NeoBundle 'tpope/vim-classpath'
" NeoBundleLazy 'tpope/vim-leiningen'
" https://github.com/clojure-emacs/cider-nrepl
NeoBundleLazy 'tpope/vim-fireplace'

NeoBundle 'guns/vim-clojure-static'
NeoBundle 'guns/vim-clojure-highlight'
NeoBundleLazy 'typedclojure/vim-typedclojure'

" autocmd FileType clojure NeoBundleSource vim-leiningen
autocmd FileType clojure NeoBundleSource vim-fireplace
autocmd FileType clojure NeoBundleSource vim-typedclojure
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
noremap <leader>t :CommandT .<CR>

" <D-...>   command-key (Macintosh only)
" noremap <D-b> :CommandTBuffer<CR>

let g:CommandTWildIgnore=&wildignore . ",**/tmp/cache/*"

" map <leader>g :CommandTTag<CR>
" map <leader>s :CommandTJump<CR>
" }}}

"{{{ scala
NeoBundleLazy 'derekwyatt/vim-scala'

autocmd FileType scala NeoBundleSource vim-scala
"}}}

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

NeoBundle 'junegunn/vim-emoji'

" {{{ vim-easy-align
NeoBundle 'junegunn/vim-easy-align'

vnoremap <silent> <cr> :EasyAlign<cr>

let g:easy_align_delimiters = {
\ '>': { 'pattern': '=>\|->','left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ '}': { 'pattern': '}\|{',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\ '{': { 'pattern': '}\|{',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ ']': { 'pattern': ']\|[',  'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\ '[': { 'pattern': ']\|[',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ '|': { 'pattern': '||\||>\||',  'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ '&': { 'pattern': '&&\|\\\@<!&\|\\\\', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ }

let g:easy_align_ignore_groups = []
" }}}

NeoBundle 'matchit.zip'
" let b:match_words = '<%=:%>,<%:%>'

" Indent-Guides {{{
NeoBundle 'Indent-Guides'
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_start_level = 2
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey13 ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey8  ctermbg=235

  " autocmd FileType ruby,coffee,javascript,html IndentGuidesEnable
" }}}

filetype plugin indent on

call neobundle#end()

NeoBundleCheck
" }}}

" {{{
" vim: foldmethod=marker
" }}}
