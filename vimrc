" {{{ Basic Setting
set nocompatible

" set noimdisable
" autocmd! InsertLeave * set imdisable | set iminsert=0
" autocmd! InsertEnter * set noimdisable | set iminsert=0


set shell=/bin/sh

set background=dark
colorscheme beijing_opera

" Remove ALL autocommands for the current group.
autocmd!

syntax on

set synmaxcol=200

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
scriptencoding utf-8

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

set colorcolumn=119

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

" {{{ wildignore
set wildignore+=*.o,*.obj,*.log,*.gif,*.jpg,*.png,*.gz,*.db,*.swf,*.mp3
set wildignore+=*.min.js
set wildignore+=coverage,*.gem
set wildignore+=*.xls,*.xlsx,*.doc,*.docx,*.pdf
set wildignore+=tmp/*
set wildignore+=spec/vcr_cassettes/*
set wildignore+=CVS,.git
set wildignore+=*.eot,*.svg,*.ttf,*.woff
set wildignore+=*.jar
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*$py.class,*.class,*.fasl
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,.DS_Store,.gitignore,.git,tags
set wildignore+=*.swp,*.dex,*.apk,*.d,*.cache,*.ap_,.env
set wildignore+=target/*
set wildignore+=classes/*
set wildignore+=node_modules/*
set wildignore+=.lein-deps-sum,.lein-repl-history,.lein-plugins,.lein-failures
set wildignore+=.eunit,deps,*.o,*.beam,*.plt,erl_crash.dump
set wildignore+=.keep
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

nmap <leader>g  :Gblame<CR>
nmap <leader>gg :Gstatus<CR>

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
" https://github.com/sheerun/vim-polyglot

set laststatus=2
NeoBundle 'itchyny/lightline.vim'

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], ['filename' ]],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

let g:lightline.mode_map = {
    \ 'n':      ' NORMAL',
    \ 'i':      ' INSERT',
    \ 'R':      'REPLACE',
    \ 'v':      ' VISUAL',
    \ 'V':      ' V-LINE',
    \ 'c':      'COMMAND',
    \ "\<C-v>": 'V-BLOCK',
    \ 's':      ' SELECT',
    \ 'S':      ' S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ '?':      '       ' }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return  &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return  &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" NeoBundle 'bling/vim-airline'
" let g:airline_powerline_fonts = 1
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'component': {
"       \   'readonly': '%{&readonly?"⭤":""}',
"       \ },
"       \ 'separator': { 'left': '⮀', 'right': '⮂' },
"       \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"       \ }



" Auto detect CJK and Unicode file encodings
" Install https://github.com/adah1972/tellenc
" FencView
NeoBundle 'mbbill/fencview'

NeoBundle 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 240

" NeoBundle 'idanarye/vim-vebugger'

NeoBundle 'zefei/vim-colortuner'

" NeoBundle 'hwartig/vim-seeing-is-believing'
" autocmd FileType ruby nmap <buffer> <F6> <Plug>(seeing-is-believing-mark)
" autocmd FileType ruby nmap <buffer> <F7> <Plug>(seeing-is-believing-run)


NeoBundle 'haya14busa/incsearch.vim'
autocmd VimEnter * :map /  <Plug>(incsearch-forward)
autocmd VimEnter * :map ?  <Plug>(incsearch-backward)

"{{{ latex
" NeoBundleLazy 'http://git.code.sf.net/p/vim-latex/vim-latex',
"               \ {'name': 'vim-latex-suite', 'type': 'git'}
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box'

autocmd FileType tex,latex,plaintex NeoBundleSource LaTeX-Box
" autocmd FileType tex,latex,plaintex NeoBundleSource vim-latex-suite
"}}}

NeoBundle '907th/vim-auto-save'
let g:auto_save_in_insert_mode = 0
let g:auto_save_no_updatetime = 1
let g:auto_save_silent = 1

NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = {
  \ 'mode':              'active',
  \ 'active_filetypes':  ['python', 'ruby', 'json', 'xml', 'xslt', 'html', 'xhtml', 'sh', 'yaml'],
  \ 'passive_filetypes': ['javascript',  'less', 'coffee', 'haskell', 'typescript', 'json'],
  \ }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_pylint_quiet_messages = { 'level': 'warnings', 'type': 'style', 'regex': 'F0401' }

"{{{ Python
NeoBundle 'klen/python-mode'
let g:pymode_rope              = 0
let g:pymode_options           = 0
let g:pymode_lint_signs        = 0
let g:pymode_lint_write        = 0
" let g:pymode_lint_checkers     = ['pep8']
let g:pymode_lint_checkers     = []
let g:pymode_lint_options_pep8 = { 'max_line_length': 119 }
let g:pymode_breakpoint_bind   = ''

let g:pymode_lint_ignore       = 'E702'

let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_cmd = 'e'

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType python setlocal commentstring=#%s
autocmd FileType python setlocal define=^\s*\\(def\\\\|class\\)
autocmd FileType python setlocal complete+=t
autocmd FileType python setlocal formatoptions-=t
"}}}

"{{{ ultisnips, YouCompleteMe etc
if has('python')
  " {{{ ultisnips
  NeoBundle 'SirVer/ultisnips'

  let g:UltiSnipsUsePythonVersion    = 2
  let g:UltiSnipsExpandTrigger       = '<C-s>'
  " let g:UltiSnipsListSnippets        = '<C-S-s>'
  let g:UltiSnipsJumpForwardTrigger  = '<C-J>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

  autocmd BufNewFile,BufRead *.snippets setf snippets
  " }}}

  NeoBundle "honza/vim-snippets"

  " YouCompleteMe {{{
  NeoBundle 'Valloric/YouCompleteMe'

  let g:ycm_key_list_select_completion                    = ['<TAB>']
  let g:ycm_key_list_previous_completion                  = ['<S-TAB>']
  let g:ycm_allow_changing_updatetime                     = 0
  let g:ycm_complete_in_comments_and_strings              = 1
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  " let g:ycm_autoclose_preview_window_after_completion     = 0
  let g:ycm_autoclose_preview_window_after_insertion      = 1
  let g:ycm_add_preview_to_completeopt                    = 1

  " nnoremap <leader>o :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
      \  'typescript': ['.'],
      \}

  let g:ycm_filetype_specific_completion_to_disable = {
      \ 'ruby':       1,
      \ 'javascript': 1,
      \ 'typescript': 1,
      \}

  let g:ycm_filetype_blacklist = {
        \ 'tagbar':  1,
        \ 'qf':      1,
        \ 'notes':   1,
        \ 'text':    1,
        \ 'vimwiki': 1,
        \ 'pandoc':  1,
        \ 'mail':    1,
        \}
  " }}}

  NeoBundle 'gcmt/breeze.vim'

endif
"}}}

"{{{ javascript
NeoBundleLazy 'pangloss/vim-javascript'

autocmd FileType javascript NeoBundleSource vim-javascript

" ReactJS
NeoBundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0
"}}}

NeoBundle 'elixir-lang/vim-elixir'

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
autocmd FileType sass NeoBundleSource vim-haml
autocmd FileType scss NeoBundleSource vim-haml
"}}}

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-commentary'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'jreybert/vimagit'
let g:magit_show_help = 0

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
autocmd BufNewFile,BufRead *.tsx setfiletype typescript
NeoBundleLazy 'leafgarland/typescript-vim'

NeoBundle 'Quramy/tsuquyomi'
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript map <buffer> <C-]> <Plug>(TsuquyomiDefinition)
autocmd FileType typescript map <buffer> <C-[> <Plug>(TsuquyomiGoBack)
autocmd FileType typescript map <buffer> <C-p> <Plug>(TsuquyomiReferences)
" <C-^>			<Plug>(TsuquyomiReferences)
" noremap <C-]> <Plug>(TsuquyomiReferences)<CR>

" for json validation
NeoBundle 'Quramy/vison'

" autocmd BufRead,BufNewFile package.json Vison

NeoBundle 'jason0x43/vim-js-indent'

" clausreinke/typescript-tools {{{
" NeoBundleLazy 'clausreinke/typescript-tools', {
"       \ 'build' : {
"       \     'windows': 'npm install -g',
"       \     'cygwin':  'npm install -g',
"       \     'mac':     'npm install -g',
"       \     'unix':    'npm install -g',
"       \    },
"       \ }
"}}}

autocmd FileType typescript NeoBundleSource typescript-vim
autocmd FileType typescript setlocal shiftwidth=4 softtabstop=4 tabstop=8

" autocmd FileType typescript map <buffer> <C-s> <Plug>(TsuquyomiReferences)
" autocmd FileType typescript NeoBundleSource typescript-tools
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

" NeoBundle 'chrisbra/unicode.vim'

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

autocmd FileType haskell setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

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
" noremap <leader>r   :R<Space>
" noremap <leader>rr  :R config/routes.rb<CR>
" noremap <leader>rm  :Rmodel<Space>
" noremap <leader>rc  :Rcontroller<Space>
" noremap <leader>rl  :Rlayout<Space>
" noremap <leader>rv  :Rview<Space>
" noremap <leader>rh  :Rhelper<Space>
" noremap <leader>ri  :Rinitializer<Space>
" noremap <leader>rj  :Rjavascript<Space>
" noremap <leader>rs  :Rstylesheet<Space>
" }}}

NeoBundle 'kablamo/vim-git-log'

"{{{ coffee-script
NeoBundleLazy 'kchmck/vim-coffee-script'

NeoBundleLazy 'mtscout6/vim-cjsx'

autocmd FileType coffee NeoBundleSource vim-coffee-script
autocmd FileType coffee NeoBundleSource vim-cjsx
autocmd FileType coffee setlocal shiftwidth=4 softtabstop=4 tabstop=8 expandtab foldmethod=indent foldlevel=1
"}}}

" NeoBundle 'henrik/vim-qargs'
NeoBundle 'Peeja/vim-cdo'

" Ag {{{
" NeoBundle 'rking/ag.vim'

" nmap <leader>a  :Ag!<Space>
" nmap <leader>ap :Ag! -G '\.py'<Space>
" }}}

" {{{ delimitMate
NeoBundle 'Raimondi/delimitMate'
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType ruby    let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType r       let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType haskell let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType python  let b:delimitMate_matchpairs = "(:),[:],{:}"
" }}}


"{{{ jade
NeoBundleLazy 'digitaltoad/vim-jade'

autocmd FileType jade NeoBundleSource vim-jade
autocmd FileType jade setlocal shiftwidth=4 softtabstop=4 tabstop=8
"}}}

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

noremap <leader>fe :LustyFilesystemExplorerFromHere<CR>
let g:LustyJugglerSuppressRubyWarning = 1
" }}}

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

NeoBundle 'Shougo/vimshell.vim'

" junegunn/fzf {{{
" NeoBundle 'junegunn/fzf'
" https://github.com/D630/fzf-contrib

" if !has('gui_macvim')
"   noremap <leader>f :FZF! --extended --no-mouse .<CR>
" endif
" }}}

" Shougo/unite.vim {{{
NeoBundle 'majkinetor/unite-cmdmatch'
NeoBundle 'tsukkee/unite-tag'

NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_enable_clipboard = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

let g:unite_winheight = 10

let g:unite_prompt='» '
let g:unite_candidate_icon = '-'
let g:unite_cursor_line_highlight = 'InsertCursor'
let g:unite_marked_icon = '+'
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_grep_encoding = 'utf-8'
let g:unite_source_grep_max_candidates = 200

NeoBundle 'Shougo/unite.vim'


noremap <leader>f  :Unite file_rec/async -start-insert                        <CR>
noremap <leader>ff :Unite file file/new directory/new -start-insert           <CR>
noremap <leader>ft :Unite tag -start-insert                                   <CR>
noremap <leader>fd :VimFiler                                                  <CR>
noremap <leader>fc :VimFilerCurrentDir                                        <CR>
noremap <leader>fb :Unite buffer         -start-insert                        <CR>
noremap <leader>fl :Unite line           -start-insert                        <CR>
noremap <leader>fk :Unite bookmark       -start-insert                        <CR>
noremap <leader>fa :UniteWithInput grep -no-quit -keep-focus                  <CR>
noremap <leader>fy :Unite history/yank  -start-insert                         <CR>
noremap <leader>fh :Unite history/unite -start-insert                         <CR>
noremap <leader>b  :UniteResume                                               <CR>

" if executable('ag')
"   " Use ag in unite grep source.
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts =
"   \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
"   \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
"   let g:unite_source_grep_recursive_opt = ''
" elseif executable('pt')
"   " Use pt in unite grep source.
"   " https://github.com/monochromegane/the_platinum_searcher
"   let g:unite_source_grep_command = 'pt'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"   let g:unite_source_grep_recursive_opt = ''
" endif

" " nmap <leader>ap :Ag! -G '\.py'<Space>
" if executable('pt')
"   let g:unite_source_grep_command = 'pt'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"   let g:unite_source_grep_recursive_opt = ''
"   let g:unite_source_grep_encoding = 'utf-8'
" endif
"}}}

" bufexplorer {{{
NeoBundle 'bufexplorer.zip'
let g:bufExplorerShowRelativePath=1
map <leader>bb :BufExplorer<CR>
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

let g:smalls_auto_jump                  = 1
let g:smalls_auto_jump_timeout          = 1
let g:smalls_auto_jump_min_input_length = 1

let g:smalls_highlight = {
  \ 'SmallsCandidate':  [['NONE',      'NONE', '33'],  ['NONE', '#403d3d', '#66daef']],
  \ 'SmallsCurrent':    [['reverse',   'NONE', '33'],  ['NONE', '#403d3d', '#66daef']],
  \ 'SmallsJumpTarget': [['NONE',      'NONE',  '1'],  ['NONE', 'NONE',    '#f92573']],
  \ 'SmallsPos':        [['underline', '3',    '160'], ['NONE', '#7efc00', '#000000']],
  \ 'SmallsShade':      [['NONE',      'NONE', '241'], ['NONE', 'NONE',    '#777777']],
  \ }
" }}}

" {{{ easymotion
NeoBundle 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1

" let g:EasyMotion_mapping_F = '<C-h>'
" let g:EasyMotion_mapping_f = '<C-l>'
let g:EasyMotion_mapping_j = '<C-l>'
let g:EasyMotion_mapping_k = '<C-h>'
let g:EasyMotion_keys = 'sdfjklhgawoeiqpnmvbcxAJKFDHGSL;z'

" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" nmap s <Plug>(easymotion-s)
" vmap s <Plug>(easymotion-s)
" nmap t <Plug>(easymotion-t2)
" nmap s <Plug>(easymotion-sn)

" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
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
let g:SignatureDisableMenu = 1
let g:SignatureMarkTextHL  = "'Operator'"
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

" Start configurations

call unite#custom#profile('default', 'context', {
\   'start_insert': 0,
\   'winheight':    10,
\   'direction':    'botright',
\ })
call unite#filters#sorter_default#use('sorter_rank')
call unite#custom#default_action('directory', 'narrow')

call vimfiler#custom#profile('default', 'context', {
\ 'safe' : 1,
\ })


" call unite#custom#profile('grep', 'context', {
" \   'no-quit' : 1,
" \   'keep-focus' : 1,
" \ })

" call unite#custom#source('file_rec/async', 'ignore_globs', split(&wildignore, ','))


NeoBundleCheck
" }}}

" {{{ filetypes
autocmd BufRead,BufNewFile *.ru,*.watchr setfiletype ruby
autocmd BufRead,BufNewFile *.treetop     setfiletype treetop
autocmd BufRead,BufNewFile *.coffee      setfiletype coffee
autocmd BufRead,BufNewFile *.slim        setfiletype slim
" }}}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

autocmd FileType ruby   UltiSnipsAddFiletypes ruby
autocmd FileType eruby  UltiSnipsAddFiletypes eruby.ruby
autocmd FileType haml   UltiSnipsAddFiletypes haml.ruby
autocmd FileType slim   UltiSnipsAddFiletypes slim.ruby
autocmd FileType python UltiSnipsAddFiletypes python

" {{{
" vim: foldmethod=marker
" }}}
