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
"set mousemodel=extend
set clipboard+=unnamed
set foldenable
syntax enable
"set foldmethod=indent
"set modeline

imap {<CR> {<CR>}<Esc>O
imap {<Space> {<Space><Space>}<Left><Left>
imap /*<Space> /*<Space><Space>*/<Left><Left><Left>
imap /**<Space> /**<Space><Space>*/<Left><Left><Left>

if $TERM=="xterm"
    set t_Co=256
    colorscheme simple256
"    set background=light " I use light background in terminal
else
    set background=dark
    color default
    hi PreProc ctermfg=white cterm=bold
endif

function! SwitchHeaderImpl()
    let filename = expand("%:r")
    let fileext = expand("%:e")
    if fileext == "cpp"
        lopen eval('filename.".h"')
    elseif fileext == "h"
        lopen eval('filename.".cpp"')
    endif
endfunction

map <F3> :call SwitchHeaderImpl()<CR>
map <F4> :close<CR>
map <F7> :wa!<CR>:make<CR><CR><CR>:copen<CR>
map <F10> :copen<CR>
map <F11> :Project<CR>
map <C-C-S> :q!

imap <F1> <Esc><F1>i
imap <F2> <Esc><F2>i
imap <F3> <Esc><F3>i
imap <F4> <Esc><F3>i
imap <F5> <Esc><F5>i
imap <F6> <Esc><F6>i
imap <F7> <Esc><F7>i
imap <F8> <Esc><F8>i
imap <F9> <Esc><F9>i
imap <F10> <Esc><F10>i
imap <F11> <Esc><F11>i
imap <F12> <Esc><F12>i
imap <C-B> <Esc>%i

let g:tskelUserName="Alexander Rodin"
let g:tskelDontSetup=1
autocmd BufNewFile */qstardict/*.h          TSkeletonSetup qstardict_source.h
autocmd BufNewFile */qstardict/*.cpp        TSkeletonSetup qstardict_source.cpp
autocmd BufNewFile */qstardict/*.pro        TSkeletonSetup qstardict_project.pro
autocmd BufNewFile */kde/*.h                TSkeletonSetup kde_source.h
autocmd BufNewFile */kde/*.cpp,*/kde/*.c    TSkeletonSetup kde_source.cpp
autocmd BufNewFile *.py                     TSkeletonSetup source.py
autocmd BufNewFile *.cc,*.cpp,*.cxx,*.d,*.c TSkeletonSetup source.cpp
autocmd BufNewFile *.h,*.hh,*.hpp,*.hxx     TSkeletonSetup source.h
autocmd BufNewFile *.html                   TSkeletonSetup html.html
autocmd BufNewFile *.tex                    TSkeletonSetup doc.tex

au BufNewFile,BufRead *.slim set filetype=slim
au BufNewFile,BufRead *.twig set filetype=html
au BufNewFile,BufRead *.twig set filetype=jinja
au BufNewFile,BufRead *.twig iunmap {<Space>
au BufNewFile,BufRead *.twig imap {{<Space> {{<Space><Space>}}<Left><Left><Left>
au BufNewFile,BufRead *.twig imap {%<Space> {%<Space><Space>%}<Left><Left><Left>

