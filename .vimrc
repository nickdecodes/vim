" ---------------------------------------------------------------------------
" init configuration.
" ---------------------------------------------------------------------------
set shiftwidth=4 " 自动缩进的时候，缩进尺寸为 4 个空格
set tabstop=4 " Tab 宽度为 4 个字符
set softtabstop=4
set expandtab
set smarttab " 删除Tab一键delete
set smartindent " 智能对齐
set linebreak " 数字加空格
set fo+=mB " 打开断行模块对亚洲语言支持。m 表示允许在两个汉字之间断行，即使汉字之间没有出现空格。B 表示将两行合并为一行的时候，汉字与汉字之间不要补空格。
set sm " 显示括号配对情况
set selection=inclusive " 指定在选择文本时，光标所在位置也属于被选中的范围
set wildmenu " 在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来
set mousemodel=popup " 当右键单击窗口的时候，弹出快捷菜单
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" file type configuration.
" ---------------------------------------------------------------------------
au FileType php setlocal dict+=~/.vim/ftdetect/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/ftdetect/dict/css.dict
au FileType c setlocal dict+=~/.vim/ftdetect/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/ftdetect/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/ftdetect/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/ftdetect/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/ftdetect/dict/ftdetectjavascript.dict
au FileType html setlocal dict+=~/.vim/ftdetect/dict/css.dict
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" view configuration.
" ---------------------------------------------------------------------------
syntax on " 语法高亮开启
set cursorline " 高亮光标所在行
set cursorcolumn " 高亮光标所在列
set shortmess=atI " 启动的时候不显示那个援助乌干达儿童的提示  
set go= " 不要图形按钮  
color xcodelight " 设置xcodelight背景主题  
"color xcodedark " 设置xcodedark背景主题
"set guifont=Courier_New:h10:cANSI " 设置字体  
"autocmd InsertLeave * se nocul " 不用浅色高亮当前行  
autocmd InsertEnter * se cursorline " 用浅色高亮当前行  
set ruler " 显示标尺  
set showcmd " 输入的命令显示出来，看的清楚些  
"set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界(不建议)  
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} " 状态行显示的内容  
set laststatus=2 " 启动显示状态行(1),总是显示状态行(2)  
"set foldenable " 允许折叠  
"set foldmethod=manual " 手动折叠  
set nocompatible " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
set autoindent " 自动缩进
set cindent
set tabstop=4 " Tab键的宽度
set softtabstop=4 " 统一缩进为4
set shiftwidth=4
set expandtab " 使用空格代替制表符
set smarttab " 在行和段开始处使用制表符
set number " 显示行号
set history=1000 " 历史记录数
set hlsearch " 搜索逐字符高亮
set incsearch
set langmenu=zh_CN.UTF-8 " 语言设置
set helplang=cn
set cmdheight=2 " 总是显示状态行
filetype on " 侦测文件类型
filetype plugin on " 载入文件类型插件
filetype indent on " 为特定文件类型载入相关缩进文件
set viminfo+=! " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
" 字符间插入的像素行数目
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" markdown configuration.
" ---------------------------------------------------------------------------
" markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
au BufRead,BufNewFile *.{go} set filetype=go
au BufRead,BufNewFile *.{js} set filetype=javascript
" markdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" new file titles configuration.
" ---------------------------------------------------------------------------
" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
function SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")
    elseif &filetype == 'md'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: ") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunction 
autocmd BufNewFile * normal G
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" keyboard configuration.
" ---------------------------------------------------------------------------
:nmap <silent> <F9> <ESC>:Tlist<RETURN>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <Esc><Esc> :w<CR>
map <F12> gg=G
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
" 选中状态下 Ctrl+c 复制
"map <C-v> "*pa
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y
set mouse=v
"set clipboard=unnamed
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录  
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" C，C++ 按F5编译运行 configuration.
" ---------------------------------------------------------------------------
map <F5> :call CompileRunGcc()<CR>
function! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunction
" C,C++的调试
map <F8> :call Rungdb()<CR>
function! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunction
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" 代码格式优化化 configuration.
" ---------------------------------------------------------------------------
map <F6> :call FormartSrc()<CR><CR>
" 定义FormartSrc()
function FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunction
" 结束定义FormartSrc
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" 实用设置 configuration.
" ---------------------------------------------------------------------------
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set autoread " 设置当文件被改动时自动载入
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr> 
set completeopt=preview,menu " 代码补全 
" set clipboard+=unnamed " 共享剪贴板 
set autowrite " 自动保存
set magic " 设置魔术
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
" set foldcolumn=0
" set foldmethod=indent 
" set foldlevel=3 
set nocompatible " 不要使用vi的键盘模式，而是vim自己的
set noeb " 去掉输入错误的提示声音
set confirm " 在处理未保存或只读文件的时候，弹出确认
set nobackup " 禁止生成临时文件
set noswapfile
set ignorecase " 搜索忽略大小写
set linespace=0
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界
set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）__
set selection=exclusive
set selectmode=mouse,key
set report=0 " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set showmatch " 高亮显示匹配的括号
set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
filetype plugin indent on 
set completeopt=longest,menu " 打开文件类型检测, 加了这句才可以用智能补全
" ---------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" CTags configuration.
" ---------------------------------------------------------------------------
let Tlist_Sort_Type = "name" " 按照名称排序  
let Tlist_Use_Right_Window = 1 " 在右侧显示窗口  
let Tlist_Compart_Format = 1 " 压缩方式  
let Tlist_Exist_OnlyWindow = 1 " 如果只有一个buffer，kill窗口也kill掉buffer  
" let Tlist_File_Fold_Auto_Close = 0 " 不要关闭其他文件的tags  
" let Tlist_Enable_Fold_Column = 0 " 不要显示折叠树  
" let Tlist_Show_One_File=1 " 不同时显示多个文件的tag，只显示当前文件的
" 设置tags  
set tags=tags;  
set autochdir 
let Tlist_Auto_Open=0 " 默认打开Taglist 
"""""""""""""""""""""""
" Tag list (ctags) 
""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
nmap tl :Tlist<cr>
" python补全
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

filetype plugin indent on " required!
"""""""""""""""""""""""""
"ctrlp设置
"""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

let NERDTreeIgnore=['\.pyc']
" ---------------------------------------------------------------------------

set nocompatible " be iMproved, required
filetype on " Enable file type detection
" ---------------------------------------------------------------------------
" Hivim configuration.
" ---------------------------------------------------------------------------
" set the runtime path to include hivim and initialize
" filetype off " required
set rtp+=~/.vim/bundle/hivim/
call hivim#begin()
" alternatively, pass a path where Hivim should install plugins
" call vundle#begin('~/some/path/here')
" Keep Plugin commands between hivim#begin/end.
" let Hivim manage Hivim, required
Bundle 'NickDeCodes/hivim'
Bundle 'NickDeCodes/auto_pairs'
Bundle 'NickDeCodes/capture_clipboard'

call hivim#end()

filetype plugin indent on " Automatically detect file types.
filetype indent on " Automatic indentation