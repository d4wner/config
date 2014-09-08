set nu!
if has("vms")
set nobackup
else
set backup
endif
set hls
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set showmatch
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-
" 不产生临时文件
set nobackup
set nowritebackup
set noswapfile

"四个空格;
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4

autocmd FileType php setlocal et sta sw=4 sts=4

" python auto-complete code
" Typing the following (in insert mode):
" os.lis<Ctrl-n>
" will expand to:
" os.listdir(
" Python 自动补全功能，用 Ctrl-N 调用
if has("autocmd")
autocmd FileType python set complete+=k~/.vim/pydiction "isk+=.,
endif

"php自动加分号
autocmd FileType php inoremap <expr> <cr> Enterc()
function! Enterc()
let line=getline('.')
if line =~ '\<if\>' || line =~ '\<while\>' || line =~ '\\\s*$' || line =~ '^\s*$' || line =~ '{\s*$' || line =~ '<?php' || line =~ '?>'
return "\n"
else
return ";\n"
endif
endfunc

autocmd BufNewFile *.[ch],*.sh,*.php,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
"如果文件类型为.sh文件


if &filetype == 'sh'
call setline(1,"#!/bin/bash")
call append(line("."), "")
 
elseif &filetype == 'python'
call setline(1,"\#!/usr/bin/env python")
call append(line("."),"#coding=utf-8")
call append(line(".")+1, "")

elseif &filetype == 'php'
call setline(1,"<?php")
call append(line("."),"?>")
"call append(line(".")+1, "")

else
call setline(1, "*************************************************************************")
call append(line("."), " > File Name: ".expand("%"))
call append(line(".")+1, " > Author: demon")
call append(line(".")+2, " > Mail: demon@dawner.info ")
call append(line(".")+3, " > Created Time: ".strftime("%c"))
call append(line(".")+4, " ************************************************************************/")
call append(line(".")+5, "")
 
endif
endfunc

autocmd BufNewFile * normal G
