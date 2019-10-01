" This syntax file changes the indentation of NERDTree to appear as 1 space
" per level instead of the normal 2 spaces. It works only if your vim has the
" +conceal feature turned on, and it must be saved as
" ~/.vim/after/syntax/nerdtree.vim to work properly.
"
" See https://github.com/scrooloose/nerdtree/issues/974#issuecomment-484118019

if has("conceal")
    syntax clear NERDTreeOpenable
    syntax clear NERDTreeClosable
    let s:dirArrows = escape(g:NERDTreeDirArrowCollapsible, '~]\-').escape(g:NERDTreeDirArrowExpandable, '~]\-')
    exec 'syntax match CompressSpaces #['.s:dirArrows.' ]\zs \ze.*' . g:NERDTreeNodeDelimiter . '# containedin=ALL conceal'
endif
