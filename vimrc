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
set fileencodings=utf-8,cp936,gb18030,ucs-bom,big5,euc-jp,euc-kr,latin1
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

set colorcolumn=140

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

set ruler showmode showcmd

set relativenumber
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

" {{{ tab setting
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType html setlocal shiftwidth=4 softtabstop=4 tabstop=8
" }}}

" {{{ Core Maps
" inoremap ' "
" inoremap " '

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

nmap <Leader>w :w<CR>

nmap <Leader>g  :Gblame<CR>
nmap <Leader>gg :Gstatus<CR>

" Paste and select
noremap <Leader>p p'[v']$


" by default the K would run the "man" command
" Run a program to lookup the keyword under the
" cursor.  The name of the program is given with the
" 'keywordprg' (kp) option (default is "man").  The
noremap K k

" nmap <silent> <Leader>/ :let @/=""<CR>
" clears the search buffer, nohl

" clean the search highlighting
nmap <silent> <ESC><ESC>  :nohlsearch <CR>

" replace " with '
noremap <Leader>sq :%s/"/'/gc<CR>

" Delete all the buffers
noremap <Leader>bd :bufdo bd<CR>

" Switch to last buffer
" nnoremap <Leader><Leader> <C-^>


" mkview & loadview
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
" noremap <Leader>ej  :mkview<CR>
" noremap <Leader>je  :loadview<CR>

vnoremap <Leader>a y:'<,'>!sort -t= -k2
" }}}

"{{{
set runtimepath+=$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.vim/bundle')
  call dein#begin('$HOME/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('907th/vim-auto-save')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('Valloric/YouCompleteMe')
  call dein#add('Valloric/vim-operator-highlight')
  call dein#add('andymass/vim-matchup')
  call dein#add('b4winckler/vim-angry')
  call dein#add('bruno-/vim-vertical-move')
  call dein#add('derekwyatt/vim-sbt',                     {'lazy': 1, 'on_ft': 'scala'})
  call dein#add('derekwyatt/vim-scala',                   {'lazy': 0, 'on_ft': 'scala'})
  call dein#add('easymotion/vim-easymotion')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('flowtype/vim-flow',                      {'lazy': 1, 'on_ft': 'javascript'})
  call dein#add('hdima/python-syntax',                    {'lazy': 1, 'on_ft': 'python'})
  call dein#add('honza/vim-snippets')
  call dein#add('hynek/vim-python-pep8-indent',           {'lazy': 1, 'on_ft': 'python'})
  call dein#add('itchyny/lightline.vim')
  call dein#add('junegunn/fzf',                           {'build': './install --all', 'merged': 0})
  call dein#add('junegunn/fzf.vim',                       {'depends': 'fzf'})
  call dein#add('junegunn/vim-easy-align')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kshenoy/vim-signature')
  call dein#add('lifepillar/pgsql.vim',                   {'lazy': 1, 'on_ft': 'sql'})
  call dein#add('majkinetor/unite-cmdmatch')
  call dein#add('majutsushi/tagbar')
  call dein#add('mattn/emmet-vim')
  call dein#add('mbbill/fencview')
  call dein#add('mileszs/ack.vim')
  call dein#add('mxw/vim-jsx',                            {'lazy': 1, 'on_ft': 'javascript'})
  call dein#add('othree/html5.vim',                       {'lazy': 1, 'on_ft': 'html'})
  call dein#add('pangloss/vim-javascript',                {'lazy': 1, 'on_ft': 'javascript'})
  call dein#add('ron89/thesaurus_query.vim')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('slim-template/vim-slim',                 {'lazy': 1, 'on_ft': 'slim'})
  call dein#add('t9md/vim-surround_custom_mapping')
  call dein#add('tenfyzhong/CompleteParameter.vim')
  call dein#add('thinca/vim-visualstar')
  call dein#add('tpope/vim-abolish')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-markdown')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-rsi')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tsukkee/unite-tag')
  call dein#add('vim-ruby/vim-ruby',                      {'lazy': 1, 'on_ft': 'ruby'})
  call dein#add('vim-scripts/DrawIt')
  call dein#add('vim-scripts/SearchComplete')
  call dein#add('vim-scripts/VisIncr')
  call dein#add('vim-scripts/indent-motion')
  call dein#add('vim-scripts/scratch.vim')
  call dein#add('w0rp/ale')
  call dein#add('wincent/terminus')

  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
  " call dein#add('jparise/vim-graphql')
  " call dein#add('ensime/ensime-vim',            {'lazy': 1, 'on_ft': 'scala'})
  " call dein#add('Peeja/vim-cdo')
  " call dein#add('guns/xterm-color-table.vim')
  " call dein#add('salsifis/vim-transpose')

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
    return  &ft == 'vimfiler' ? vimfiler#get_status_string() :
          \ &ft == 'unite' ? unite#get_status_string() :
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
          \ winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  let g:unite_force_overwrite_statusline = 0
  let g:vimfiler_force_overwrite_statusline = 0
  let g:vimshell_force_overwrite_statusline = 0
  " }}}

  "{{{ javascript
  let g:flow#enable = 0
  let g:flow#omnifunc = 1

  autocmd FileType javascript nnoremap <C-p> :FlowJumpToDef<CR>
  " ReactJS
  let g:jsx_ext_required = 0
  "}}}

  "{{{
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  map z/ <Plug>(incsearch-fuzzy-/)
  map z? <Plug>(incsearch-fuzzy-?)
  map zg/ <Plug>(incsearch-fuzzy-stay)
  "}}}

  " Required:
  call dein#end()
  call dein#save_state()
endif

" {{{ settings after plugin
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

autocmd FileType scala nnoremap <C-p> :EnDeclaration<CR>
autocmd FileType scala nnoremap <Leader>yK :EnDocBrowse<CR>
autocmd FileType scala nnoremap <Leader>yt :EnType<CR>

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
"}}}

autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=8
autocmd FileType python setlocal commentstring=#%s
autocmd FileType python setlocal define=^\s*\\(def\\\\|class\\)
autocmd FileType python setlocal complete+=t
autocmd FileType python setlocal formatoptions-=t

" {{{ ultisnips
let g:UltiSnipsUsePythonVersion    = 2
let g:UltiSnipsExpandTrigger       = '<C-s>'
" let g:UltiSnipsListSnippets        = '<C-S-s>'
let g:UltiSnipsJumpForwardTrigger  = '<C-J>'
let g:UltiSnipsJumpBackwardTrigger = '<C-K>'

autocmd BufNewFile,BufRead *.snippets setf snippets
" }}}

" YouCompleteMe {{{
let g:ycm_python_binary_path = 'python'

let g:ycm_key_list_select_completion                    = ['<TAB>']
let g:ycm_key_list_previous_completion                  = ['<S-TAB>']
let g:ycm_allow_changing_updatetime                     = 0
let g:ycm_complete_in_comments_and_strings              = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_autoclose_preview_window_after_completion     = 0
let g:ycm_autoclose_preview_window_after_insertion      = 1
let g:ycm_add_preview_to_completeopt                    = 1
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_log_level                                     = 'warning'

nnoremap <Leader>y :YcmCompleter<Space>
nnoremap <Leader>yK :YcmCompleter GetDoc<CR>
nnoremap <Leader>yt :YcmCompleter GetType<CR>
nnoremap <Leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>ye :YcmCompleter GoToType<CR>
nnoremap <Leader>yf :YcmCompleter RefactorRename<Space>
nnoremap <Leader>yg :YcmCompleter GoTo<CR>
autocmd FileType typescript nnoremap <C-p> :YcmCompleter GoToDefinition<CR>
autocmd FileType python     nnoremap <C-p> :YcmCompleter GoToDeclaration<CR>

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
    \ 'scala':      1,
    \ 'ruby':       1,
    \ 'vim':       1,
    \ 'javascript': 1,
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

noremap <Leader>sw :Switch<CR>
noremap <Leader>st f:xepldf>
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=4

let g:ackprg = 'rg --vimgrep '
nmap <Leader>fa  :Ack -tscala<Space>
autocmd FileType clojure let b:delimitMate_quotes = "\""
autocmd FileType clojure let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType ruby    let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType r       let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType haskell let b:delimitMate_matchpairs = "(:),[:],{:}"
autocmd FileType python  let b:delimitMate_matchpairs = "(:),[:],{:}"

noremap <Leader>f  :FZF .    <CR>
noremap <Leader>fe :execute 'VimFiler' expand('%:p:h')    <CR>
noremap <Leader>fg :GitFiles <CR>
noremap <leader>fb :Buffers  <CR>
noremap <Leader>fl :BLines   <CR>

" Shougo/unite.vim {{{
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

noremap <Leader>fd :VimFiler                           <CR>
noremap <Leader>fk :Unite bookmark       -start-insert <CR>
"}}}

noremap <Leader>so :Scratch<CR>

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

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}
"
if has('nvim')
  colorscheme one
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"}}}

" {{{
" vim: foldmethod=marker
" }}}
