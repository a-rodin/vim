set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set fdl=0
set fdm=marker
filetype indent on
set nohlsearch
set ignorecase
set mouse=a
set mousemodel=extend
set clipboard=unnamed
set foldenable
set hlsearch
syntax enable
set ffs=unix
set cc=120
let g:NERDTreeWinSize=22
" :nnoremap <C-D> "=strftime("%c")<CR>P
" :inoremap <C-D> <C-R>=strftime("%c")<CR>

set tags=./tags;

imap {<CR> {<CR>}<Esc>O
imap {<Space> {<Space><Space>}<Left><Left>
imap /*<Space> /*<Space><Space>*/<Left><Left><Left>
imap /**<Space> /**<Space><Space>*/<Left><Left><Left>

vmap <C-k> :'<,'>%!column -t\|sed 's/^/  /'\|sed 's/, */, /g'\|sed 's/ *$//g'<CR>
" map <C-j> :%!bash -c '(echo -n javascript:; jq -sRr @uri)'<CR>

set cm=blowfish

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-scripts/Ambient-Color-Scheme'
Plugin 'vim-scripts/Simple256'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
" Plugin 'sheerun/vim-polyglot'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'fatih/vim-go'
Plugin 'gregsexton/gitv'
Plugin 'slashmili/alchemist.vim'
Plugin 'mdlerch/mc-stan.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'gcmt/taboo.vim'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'mileszs/ack.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'szw/vim-maximizer'
Plugin 'racer-rust/vim-racer'
" Plugin 'cjrh/vim-conda'
Plugin 'davidhalter/jedi-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'cespare/vim-toml'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'prettier/vim-prettier'
Plugin 'jparise/vim-graphql'
Plugin 'hashivim/vim-terraform'
Plugin 'xavierd/clang_complete'

" Plugin 'ActivityWatch/aw-watcher-vim'

call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256   " This is may or may not needed.
" set background=dark
" set background=light
colorscheme simple256
" colorscheme PaperColor
" colorscheme ambient
" set background=light
" colorscheme tango
"highlight Normal ctermfg=black

" Filetype-specific indent settings
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.conf set filetype=dosini
autocmd FileType javascript,json,yaml,typescript set ts=2 sts=2 sw=2
autocmd FileType dockerfile setlocal commentstring=#\ %s

" Nerdtree configuration
autocmd StdinReadPre * let s:std_in=1
" let g:NERDTreeWinPos = "right"
map <C-l> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_synchronize_focus=1
let g:NERDTreeMouseMode=3
let g:NERDTreeIgnore=['node_modules', '.*.swp', '.git', '.*.pyc', '__pycache__', '.DS_Store', '.nyc_output', '.*\.o$', '^moc_', '^\.qmake', '\.moc$', '^ui_.*\.h$']
let NERDTreeShowHidden=1

let g:firstStart=0
function NERDTreeMyOpenFile(node)
  wincmd w
  if g:firstStart
    let where='p'
    let g:firstStart=0
  elseif len(undotree().entries) == 0
    let where='p'
  else
    let where='t'
  endif
  wincmd w
  call a:node.activate({'reuse': 'all', 'where': where})
  NERDTreeTabsFind
  NERDTreeFocusToggle
endfunction
function NERDTreeMyOpenFileNew(node)
  if g:firstStart
    let where='p'
    let g:firstStart=0
  else
    let where='t'
  endif
  call a:node.activate({'reuse': 'all', 'where': where})
  NERDTreeTabsFind
  NERDTreeFocusToggle
endfunction
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': 'o', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': '<LeftRelease>', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': 't', 'callback': 'NERDTreeMyOpenFileNew', 'scope': 'FileNode', 'override': 1 })
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': '<M-LeftRelease>', 'callback': 'NERDTreeMyOpenFileNew', 'scope': 'FileNode', 'override': 1 })

" autocmd FileType nerdtree cnoreabbrev <buffer> q <nop>
autocmd FileType nerdtree cnoreabbrev <buffer> q :NERDTreeFocusToggle<CR>:q<CR>

function! TabCloseRight(bang)
  let cur=tabpagenr()
  while cur < tabpagenr('$')
    exe 'tabclose' . a:bang . ' ' . (cur + 1)
  endwhile
endfunction

function! TabCloseLeft(bang)
  while tabpagenr() > 1
    exe 'tabclose' . a:bang . ' 1'
  endwhile
endfunction

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')

" autocmd BufnewFile,BufRead * let g:nerdtree_tabs_open_on_console_startup=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | let g:nerdtree_tabs_open_on_console_startup=1 | let g:firstStart=1 | endif

" let g:taboo_tab_format=" %N:%f%m "
let g:taboo_tab_format=" %N:%r%m "

set ruler
set laststatus=0

" Gdiff config
" map <C-D> :Gdiff<CR>
imap <C-N> <C-X><C-O>

hi Normal ctermbg=none
hi NonText ctermbg=none
set t_ut=

let g:autopep8_max_line_length=120

" Typescript configuration
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript nmap <buffer> <C-E> <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript imap <buffer> <C-E> <Esc><C-E>
autocmd FileType javascript set filetype=typescript.tsx
autocmd FileType typescript set ts=2 sts=2 sw=2
" autocmd FileType c set noet
" autocmd FileType c set ts=8 sts=8 sw=8
autocmd FileType qf wincmd J

" Go configuration
let g:go_template_autocreate=0
autocmd CompleteDone * pclose
autocmd FileType go nmap <buffer> <C-E> :GoRename<CR>
autocmd FileType go imap <buffer> <C-E> <Esc><C-E>

" Elixir and OTP configuration
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

set backspace=indent,eol,start

" JSON configuration
let g:vim_json_syntax_conceal = 1

" commentary
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" spell check
autocmd FileType md,txt,gitcommit set spell

" racer config
set hidden
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
au FileType rust map <C-]> <Plug>(rust-def)

" jedi config
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<C-]>"
let g:jedi#force_py_version = 3
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = 0

" vim-conda config
let g:conda_startup_msg_suppress = 1

" color picker
map cc :VCoolor<CR>

" autoformatting
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier

let g:rustfmt_autosave = 1

let g:terraform_align=1
let g:terraform_fmt_on_save=1

if system('uname') =~ 'Linux'
    let g:clang_library_path='/usr/lib/llvm-8/lib/libclang.so.1'
else
    let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
endif

" project-specific settings
au BufNewFile,BufRead */vector/* set binary
au BufNewFile,BufRead */vector/* set et
au BufNewFile */vector/* set noeol
