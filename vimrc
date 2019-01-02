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

set synmaxcol=300

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set fileencodings=utf-8,cp936,gb18030,ucs-bom,big5,euc-jp,euc-kr,latin1

set helplang=En
set history=500

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" highlight invisible characters
set list
set listchars=tab:⇢\ ,nbsp:_,trail:·
set showbreak=↳
set linebreak
    " #add8e6"

set autoindent
set smartindent
set copyindent

set switchbuf=useopen

set expandtab
set nojoinspaces
set shiftround
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=4

set virtualedit=all

set autoread

set complete=.,w,b,u,t,k,i,d

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set colorcolumn=160

set cursorcolumn
set cursorline
set mouse=

set modeline
set foldlevel=1

set grepformat=%f:%l:%m

set hlsearch incsearch ignorecase showmatch infercase smartcase

set magic hidden

set wrap
set whichwrap=<,>,h,l,~,[,]

set ruler showcmd
set noshowmode

set relativenumber
set nonumber

set scrolloff=3
set sidescrolloff=5
set sidescroll=1

" set titlestring=%<%f%m
set titlestring=%f%m
set title
" title titleold=OSX

set completeopt=menu,menuone

set shortmess=atIc
set wildmode=list:longest
set wildmenu wildmode=list:longest,full

set visualbell t_vb=
set formatoptions-=t
set formatoptions+=n

set ttyfast

" not redraw while executing macros, registers and other commands
set lazyredraw

set dictionary+=~/.vim/dict/default
autocmd BufWinEnter * setlocal dictionary+=~/.vim/dict/default

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

" {{{ tab setting
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType html setlocal shiftwidth=4 softtabstop=4 tabstop=8
" }}}

" {{{ Core Maps
" inoremap ' "
" inoremap " '

" replay macro
nnoremap Q @q
vnoremap Q :normal @q<CR>

vnoremap zy "+y
nnoremap zp "+p

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


" by default the K would run the "man" command
" Run a program to lookup the keyword under the
" cursor.  The name of the program is given with the
" 'keywordprg' (kp) option (default is "man").  The
noremap K k

" clean the search highlighting
nmap <silent> <ESC><ESC>  :nohlsearch <CR>
" }}}

"{{{
call plug#begin('$HOME/.vim/bundle')
  " Add or remove your plugins here:

  Plug 'thinca/vim-visualstar'
  Plug 'RRethy/vim-illuminate'
  Plug 'markonm/traces.vim'           " Live preview for Ex commands

  Plug 'echuraev/translate-shell.vim'
  let g:trans_default_direction = ":zh"
  let g:trans_advanced_options = "-brief -engine bing"
  " brew install translate-shell

  Plug '907th/vim-auto-save'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'Raimondi/delimitMate'
  Plug 'SirVer/ultisnips'

  "{{{ incsearch
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  " map g/ <Plug>(incsearch-stay)

  " map z/ <Plug>(incsearch-fuzzy-/)
  " map z? <Plug>(incsearch-fuzzy-?)
  " map zg/ <Plug>(incsearch-fuzzy-stay)
  "}}}

  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim',   { 'do': ':UpdateRemotePlugins' }

  " LanguageClient
  " Plug 'autozimu/LanguageClient-neovim', {
  " \ 'branch': 'next',
  " \ 'do':     'bash install.sh',
  " \ }

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1

  Plug 'ujihisa/neco-look'
  Plug 'zchee/deoplete-jedi'

  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/echodoc.vim'
  let g:echodoc_enable_at_startup = 1

  Plug 'Shougo/context_filetype.vim'

  Plug 'Valloric/vim-operator-highlight'
  Plug 'andymass/vim-matchup'
  Plug 'b4winckler/vim-angry'
  Plug 'bruno-/vim-vertical-move'
  Plug 'derekwyatt/vim-sbt',                     {'for': 'scala'}
  Plug 'derekwyatt/vim-scala',                   {'for': 'scala'}
  Plug 'easymotion/vim-easymotion'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'hdima/python-syntax',                    {'for': 'python'}
  Plug 'honza/vim-snippets'
  Plug 'hynek/vim-python-pep8-indent',           {'for': 'python'}
  Plug 'itchyny/lightline.vim'

  Plug 'junegunn/fzf',                           {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'

  Plug 'junegunn/vim-easy-align'
  Plug 'kana/vim-textobj-user'
  Plug 'kshenoy/vim-signature'
  Plug 'majutsushi/tagbar'
  Plug 'mattn/emmet-vim'
  Plug 'mbbill/fencview'

  " Plug 'mhinz/vim-grepper'

  Plug 'mxw/vim-jsx',                            {'for': 'javascript'}
  Plug 'othree/html5.vim',                       {'for': 'html'}
  Plug 'pangloss/vim-javascript',                {'for': 'javascript'}
  Plug 'ron89/thesaurus_query.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'slim-template/vim-slim',                 {'for': 'slim'}
  Plug 't9md/vim-surround_custom_mapping'

  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

  Plug 'vim-ruby/vim-ruby',                      {'for': 'ruby'}
  Plug 'vim-scripts/DrawIt'
  Plug 'vim-scripts/SearchComplete'
  Plug 'vim-scripts/VisIncr'
  Plug 'vim-scripts/indent-motion'
  Plug 'vim-scripts/scratch.vim'
  Plug 'w0rp/ale'

  " {{{ lightline & laststatus
  set laststatus=2

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
        \ 'separator':    { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
        " unicode chars in http://be5invis.github.io/Iosevka/specimen.html

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
    return &ft !~? 'help' && &readonly ? '' : ''
  endfunction

  function! LightLineFilename()
    let fname = expand('%:t')
    return  ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
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
    return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  let g:vimshell_force_overwrite_statusline = 0
  " }}}

call plug#end()
"}}}

" Shougo/denite.vim etc {{{
function! s:defx_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr>       <CR>              defx#do_action('open')
  nnoremap <silent><buffer><expr>       c                 defx#do_action('copy')
  nnoremap <silent><buffer><expr>       m                 defx#do_action('move')
  nnoremap <silent><buffer><expr>       p                 defx#do_action('paste')
  nnoremap <silent><buffer><expr>       l                 defx#do_action('open')
  nnoremap <silent><buffer><expr>       K                 defx#do_action('new_directory')
  nnoremap <silent><buffer><expr>       N                 defx#do_action('new_file')
  nnoremap <silent><buffer><expr>       d                 defx#do_action('remove')
  nnoremap <silent><buffer><expr>       yy                defx#do_action('yank_path')
  nnoremap <silent><buffer><expr>       .                 defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr>       h                 defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr>       ~                 defx#do_action('cd')
  nnoremap <silent><buffer><expr>       q                 defx#do_action('quit')
  nnoremap <silent><buffer><expr>       <Space>           defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr>       *                 defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr>       j                 line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr>       k                 line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr>       <C-l>             defx#do_action('redraw')
  nnoremap <silent><buffer><expr>       <C-g>             defx#do_action('print')
  nnoremap <silent><buffer><expr>       cd                defx#do_action('change_vim_cwd')
endfunction

autocmd FileType defx call s:defx_settings()
"}}}

"{{{ deoplete#enable
call deoplete#enable()
call deoplete#custom#option({
\ 'smart_case':           v:true,
\ 'num_processes':        6,
\ 'max_list':             40,
\ })

" call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
call deoplete#custom#source('_', 'sorters', [])

call deoplete#custom#source('look', 'matchers', ['matcher_full_fuzzy', 'matcher_length'])
call deoplete#custom#source('look', 'sorters',  ['sorter_rank', 'sorter_word'])

call deoplete#custom#option('sources', {
\  '_':      ['member', 'buffer', 'tag', 'file', 'dictionary', 'look', 'ultisnips', 'syntax'],
\  'python': ['member', 'buffer', 'tag', 'file', 'dictionary', 'look', 'ultisnips', 'syntax', 'jedi'],
\ })

call deoplete#custom#source('jedi',       'rank', 250)
call deoplete#custom#source('member',     'rank', 220)
call deoplete#custom#source('buffer',     'rank', 210)
call deoplete#custom#source('tag',        'rank', 200)
call deoplete#custom#source('file',       'rank', 190)
call deoplete#custom#source('ultisnips',  'rank', 190)
call deoplete#custom#source('dictionary', 'rank', 180)
call deoplete#custom#source('look',       'rank', 100)

call deoplete#custom#source('_',    'min_pattern_length', 2)
call deoplete#custom#source('look', 'min_pattern_length', 4)

call deoplete#custom#source('ultisnips',
\ 'matchers',
\ ['matcher_head', 'matcher_length']
\ )

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" }}}

"{{{ settings after plugin
"{{{ javascript
let g:flow#enable = 0
let g:flow#omnifunc = 1

autocmd FileType javascript nnoremap <C-p> :FlowJumpToDef<CR>
" ReactJS
let g:jsx_ext_required = 0
"}}}

autocmd BufRead,BufNewFile *.ru,*.watchr setfiletype ruby
autocmd BufRead,BufNewFile *.treetop     setfiletype treetop
autocmd BufRead,BufNewFile *.coffee      setfiletype coffee
autocmd BufRead,BufNewFile *.slim        setfiletype slim

autocmd FileType ruby   UltiSnipsAddFiletypes ruby
autocmd FileType eruby  UltiSnipsAddFiletypes eruby.ruby
autocmd FileType haml   UltiSnipsAddFiletypes haml.ruby
autocmd FileType slim   UltiSnipsAddFiletypes slim.ruby
autocmd FileType python UltiSnipsAddFiletypes python

autocmd FileType markdown setlocal spell

autocmd FileType sbt.scala setlocal commentstring=//%s
autocmd FileType scala setlocal commentstring=//%s

let g:tq_enabled_backends = ['thesaurus_com']
let g:tq_language = ['en']
let g:ophigh_color = 246
let g:TerminusMouse          = 0
let g:TerminusFocusReporting = 0
let g:TerminusAssumeITerm    = 1
let g:TerminusBracketedPaste = 0
let g:user_emmet_settings = {
\    'html' : {
\        'quote_char': "'",
\    },
\    'coffee': {
\        'extends': 'html',
\        'attribute_name': {'class': 'className'},
\        'empty_element_suffix': ' />',
\        'indentation' : '    '
\    },
\}
let g:auto_save = 0
let g:auto_save_silent = 1

let g:sql_type_default = 'pgsql'
autocmd FileType sql setlocal commentstring=--%s

" let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
\   'ruby':   [],
\   'scss':   [],
\   'python': ['pylint'],
\}

" let g:ale_linters.scala = ['scalac', 'scalastyle']
let g:ale_linters.scala = []
let g:ale_python_pylint_options = ' -E  -d no-name-in-module -d no-member '

highlight link ALEError             Normal
highlight link ALEWarning           Normal
highlight link ALEInfo              Normal
highlight link ALEStyleError        Normal
highlight link ALEStyleWarning      Normal
highlight link ALEErrorSign         SignColumn
highlight link ALEErrorSign         SignColumn
highlight link ALEWarningSign       SignColumn
highlight link ALEInfoSign          SignColumn
highlight link ALEStyleErrorSign    SignColumn
highlight link ALEStyleWarningSign  SignColumn

let g:ale_sign_error         = '🎈'
let g:ale_sign_warning       = '🍭'
let g:ale_sign_style_error   = '⁉️'
let g:ale_sign_style_warning = '💩'

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType python setlocal commentstring=#%s
autocmd FileType python setlocal define=^\s*\\(def\\\\|class\\)
autocmd FileType python setlocal complete+=t
autocmd FileType python setlocal formatoptions-=t

" {{{ ultisnips
let g:UltiSnipsUsePythonVersion    = 3
let g:UltiSnipsExpandTrigger       = '<C-s>'
" let g:UltiSnipsListSnippets        = '<C-S-s>'
let g:UltiSnipsJumpForwardTrigger  = '<C-J>'
let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

autocmd BufNewFile,BufRead *.snippets setf snippets
" }}}

" {{{ surround
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

autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=4

autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType ruby    let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType r       let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType haskell let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType python  let b:delimitMate_matchpairs = "(:),[:],{:}"


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case ' . <q-args>,
  \   1,
  \   <bang>0 ? fzf#vim#with_preview('up:100%')
  \           : fzf#vim#with_preview('up:80%:hidden', '?'),
  \   <bang>0)


command! HelpfulCommands call fzf#run({
\  'sink'       : function('execute'),
\  'source'     : [
\     'BCommits',
\     'Commands',
\     'Commits',
\     'Filetypes',
\     'Gblame',
\     'Helptags',
\     'History',
\     'History/',
\     'History:',
\     'Maps',
\     'Marks',
\     'Tags',
\  ],
\  'options': '--ansi -x --prompt "Helpful> "',
\  'tmux_height': '20%',
\ })

function! s:call_command(m)
  call feedkeys(':edit ' . a:m . "\<CR>" )
endfunction

command! FZFBookmarks call fzf#run({
\  'source': 'cat $FZFBOOKMARKS',
\  'sink': function('s:call_command'),
\  'tmux_height': '20%',
\ })
let g:fzf_layout = { 'down': '15' }

" Leader key mappings
noremap <Leader>f  :FZF                            <Space>.<CR>
noremap <Leader>fb :Buffers                        <CR>
noremap <Leader>fd :Defx                           <CR>
noremap <Leader>fe :execute 'Defx' expand('%:p:h') <CR>
noremap <Leader>fg :Rg<Space>
noremap <Leader>fh :HelpfulCommands                <CR>
noremap <Leader>fk :FZFBookmarks                   <CR>
noremap <Leader>fl :BLines                         <CR>
" noremap <Leader>fa :Grepper -grepprg rg -H --no-heading --vimgrep<Space>

noremap <Leader>so :Scratch<CR>
noremap <Leader>sw :Switch<CR>
noremap <Leader>st f:xepldf>

" Paste and select
noremap <Leader>p p'[v']$

" Write or save
noremap <Leader>w :w<CR>

" replace " with '
noremap <Leader>sq :%s/"/'/gc<CR>

" Delete all the buffers
noremap <Leader>bd :bufdo bd<CR>

" Sort with separator
vnoremap <Leader>a y:'<,'>!sort -t= -k2

" {{{ easymotion
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-s2)
omap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)

let g:EasyMotion_mapping_j = '<C-l>'
let g:EasyMotion_mapping_k = '<C-h>'
let g:EasyMotion_keys = 'sdfjklhgawoeiqpnmvbcxAJKFDHGSL;z'
" }}}

nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_width = 30

" {{{ vim-signature
let g:SignatureDisableMenu = 1
let g:SignatureMarkTextHL  = 'SignatureMarkTextHL'

sign define dummy
autocmd BufWinEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" }}}

vnoremap <silent> <cr> :EasyAlign<cr>

let g:easy_align_delimiters = {
\ '>': { 'pattern': '=>\|->',            'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ '}': { 'pattern': '}\|{',              'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\ '{': { 'pattern': '}\|{',              'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ ']': { 'pattern': ']\|[',              'left_margin': 0, 'right_margin': 0, 'stick_to_left': 0 },
\ '[': { 'pattern': ']\|[',              'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ '|': { 'pattern': '||\||>\||',         'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ '&': { 'pattern': '&&\|\\\@<!&\|\\\\', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ }

let g:easy_align_ignore_groups = []

" disable for vim-operator-highlight{{{
let g:ophigh_filetypes_to_ignore = {}
let g:ophigh_filetypes_to_ignore.ruby     = 1
let g:ophigh_filetypes_to_ignore.eruby    = 1
let g:ophigh_filetypes_to_ignore.markdown = 1

function! s:OperatorCharsForRuby()
  " syntax match OperatorChars "?\|+\|-\|\*\|;\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
  syn match rubyOperator "[;,~!^|*/+-]\|&\.\@!\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@1<!>\|\*\*\|\.\.\.\|\.\.\|::"
  syn match rubyOperator "=>\|=\|->\|-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!=\|(\|)\|{\|}\|\.\|\[\|\]\|/\(/\|*\)"
endfunction

let ruby_operators = 1
hi link rubyOperator Comment
autocmd BufRead,BufNewFile *.rb call s:OperatorCharsForRuby()

let g:ophigh_highlight_link_group='Comment'
hi link OperatorChars Comment

"}}}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}

if has('nvim')
  tnoremap            <Esc>           <C-\><C-n>
endif

" Required:
filetype plugin indent on
syntax enable


" {{{
" vim: foldmethod=marker
" }}}
