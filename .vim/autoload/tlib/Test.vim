" Test.vim -- A test class
" @Author:      Thomas Link (mailto:samul AT web de?subject=[vim])
" @Website:     http://members.a1.net/t.link/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-05-01.
" @Last Change: 2007-05-18.
" @Revision:    0.1.3

if &cp || exists("loaded_tlib_Test_autoload")
    finish
endif
let loaded_tlib_Test_autoload = 1

let s:prototype = tlib#Object#New({'_class': ['Test']}) "{{{2
function! tlib#Test#New(...) "{{{3
    let object = s:prototype.New(a:0 >= 1 ? a:1 : {})
    return object
endf

function! s:prototype.Dummy() dict "{{{3
    return 'Test.vim'
endf

