set nu! 
if has("vms")
set nobackup
else
set backup
endif
set hls 
"set expandtab
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

