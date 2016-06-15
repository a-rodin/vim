set tabstop=4
set softtabstop=4
set shiftwidth=4
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
set clipboard=unnamedplus
set foldenable
set hlsearch
syntax enable

set tags=./tags;

imap {<CR> {<CR>}<Esc>O
imap {<Space> {<Space><Space>}<Left><Left>
imap /*<Space> /*<Space><Space>*/<Left><Left><Left>
imap /**<Space> /**<Space><Space>*/<Left><Left><Left>

set cm=blowfish

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'sheerun/vim-polyglot'
Plugin 'tell-k/vim-autopep8'
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor

au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.conf set filetype=dosini
autocmd FileType javascript,json,yaml,typescript set ts=2 sts=2 sw=2
autocmd FileType dockerfile setlocal commentstring=#\ %s

" Nerdtree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinPos = "right"

" Gdiff shortcuts
map <C-D> :Gdiff<CR>

hi Normal ctermbg=none
set t_ut=

let g:autopep8_max_line_length=120