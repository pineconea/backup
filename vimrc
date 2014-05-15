"""""""""""""""""""""""""""""""""""""""""""
"			VIM基本配置					  " 
"""""""""""""""""""""""""""""""""""""""""""
"取消vi兼容模式
set nocompatible
"允许插件
filetype plugin on 
"关闭文件类型自动检测(使用Vundle进行管理)
filetype off
"开启语法高亮 
syntax on 
"设置VIM记录条数
set history=400
"设置增量匹配
set incsearch
"显示行号 
set nu 
"自动换行 
set ai 
set ci 
"tab为4个空格 
set tabstop=4 
"统一缩进4个空格
set shiftwidth=4
set softtabstop=4
"显示底部状态条
set laststatus=2
"状态栏显示内容
set statusline=%F%m%r%h%w\ [文件格式=%{&ff}]\ [文件类型=%Y]\ [当前位置=%04l,%04v][%p%%]\ [文件总行数=%L]
"设置匹配模式
set showmatch
"设置补齐样式
"set completeopt=preview,menu
set completeopt=menu,longest
"Vundle配置
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"完成配对
"inoremap ( ()<LEFT>
"inoremap { {}<LEFT><CR><CR><UP><Tab>
"inoremap [ []<LEFT>
"inoremap )
"inoremap }
"inoremap ]

"""""""""""""""""""""""""""""""""""""""""""
"			插件配置				   	  "
"""""""""""""""""""""""""""""""""""""""""""

""""""""""""Vundle个人配置""""""""""""""""""""
Bundle 'taglist.vim'
"golang Fmt插件
Bundle 'cespare/vim-golang'	
"golang 自动跳转插件
Bundle 'dgryski/vim-godef'	
"golang 大纲显示
Bundle 'majutsushi/tagbar'
"golang 自动补全
Bundle 'undx/vim-gocode'
"pythone 插件
Bundle 'rkulla/pydiction'



"""""""""""""ctags设置"""""""""""""""""""
"易热开发ctags文件
set tags=/home/easy/golang/src/tags
map <F2> <C-]>


"""""""""""""Taglist设置"""""""""""""""""
let Tlsit_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow=1
map <F12> :TlistToggle<CR>

""""""""""""tagbar设置"""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'	  : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\],
	\'sro' : '.',
	\'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\},
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\},
	\ 'ctagsbin' : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\}

"""""""""""""C语言设置""""""""""""""""""
"C语言编译和运行
map <F6> :call ComplieRunGcc()<CR>
func! ComplieRunGcc()
exec "w"
exec "!gcc %-o %<"
exec "! ./%<"
endfunc


"""""""""""""go语言设置""""""""""""""""""
au BufRead,BufNewFile *.go set filetype=go
"gocode自动补齐
imap <C-f> <C-x><C-o>
"go语言编译
map <F5> :call ComplieGo()<CR>
func! ComplieGo()
exec "w"
exec "!go build"
endfunc

"""""""""""python设置"""""""""""""""""
let g:pydiction_location = '/home/easy/.vim/bundle/pydiction/complete-dict'
