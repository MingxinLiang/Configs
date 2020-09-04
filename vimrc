set tabstop=4
set autoindent shiftwidth=4
set cindent shiftwidth=4
set smarttab
set expandtab
" 处理换行和tab

set encoding=utf-8
set fileencodings=ucs-bom,gb18030,gbk,utf-8,cp936,gb2312
set fileencoding=utf-8
set termencoding=utf-8
"设置编码格式

set background=dark
"colorscheme solarized

set modelines=0" CVE-2007-2438
" Configuration file for vim

set nocompatible" Use Vim defaults instead of 100% vi compatibility
set backspace=2" more powerful backspacing
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements

syntax enable
syntax on
" 语法高亮

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 用浅色高亮当前行

set confirm
" 在处理未保存或只读文件的时候，弹出确认

set number
" 显示行号

set cursorline
set cursorcolumn
" 高亮显示当前行/列

set history=50
" 历史纪录数

set hlsearch
set incsearch
" 搜索逐字符高亮

set gdefault
" 行内替换

" colorscheme torte
" 设置颜色主题

"set guifont=Menlo:h18:cANSI
" 设置字体

set langmenu=zn_CN.UTF-8
set helplang=cn
" 语言设置

set cmdheight=2
" 命令行（在状态行）的高度，默认为1,这里是2

set ruler
" 在编辑过程中，在右下角显示光标位置的状态行

set laststatus=2
" 总是显示状态行

set showcmd
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来

set scrolloff=3
" 光标移动到buffer的顶部和底部时保持3行距离

set showmatch
" 高亮显示对应的括号

set matchtime=5
" 对应括号高亮的时间（单位是十分之一秒）

set autowrite
" 在切换buffer时自动保存当前文件

set wildmenu
" 增强模式中的命令行自动完成操作

set linespace=2
" 字符间插入的像素行数目

set whichwrap=b,s,<,>,[,]
" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能。

set ignorecase 
" 检索忽略大小写

let mapleader=";"
" Leader map

filetype on
filetype plugin on
filetype plugin indent on
" 分为三部分命令：file on, file plugin on, file indent on.分别表示自动识别文件类型，用文件类型脚本，使用缩进定义文件。

set foldmethod=indent
set foldmethod=syntax
" 基于缩进或语法进行代码折叠
set nofoldenable
" 启动 vim 时关闭折叠代码

" 窗口切换
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"==================自定义的键映射======================
" 括号自动生成
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
" 括号自动生成

" F5 自动格式化 依赖astyle
" map <F5> :call FormartSrc()<CR><CR>
" 
" "定义FormartSrc()
" func FormartSrc()
"     exec "w"
"     if &filetype == 'c'
"         exec "!astyle --style=ansi -a --suffix=none %"
"     elseif &filetype == 'cpp' || &filetype == 'hpp'
"         exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
"     elseif &filetype == 'perl'
"         exec "!astyle --style=gnu --suffix=none %"
"     elseif &filetype == 'py'||&filetype == 'python'
"         exec "r !autopep8 -i --aggressive %"
"     elseif &filetype == 'java'
"         exec "!astyle --style=java --suffix=none %"
"     elseif &filetype == 'jsp'
"         exec "!astyle --style=gnu --suffix=none %"
"     elseif &filetype == 'xml'
"         exec "!astyle --style=gnu --suffix=none %"
"     else
"         exec "normal gg=G"
"         return
"     endif
"     exec "e! %"
" endfunc
"结束定义FormartSrc
"
"F6 自动运行
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "     exec "!go build %<"
        exec "!time go run %"
    elseif &filetype =='mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

" F7 winmanager 开关
"
" 按下F8重新生成tag文件，并更新taglist  
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:TlistUpdate<CR>  
imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:TlistUpdate<CR>  
set tags=tags  
set tags+=./tags "add current directory's generated tags file
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" 
" 插件使用vim-plus安装
call plug#begin('~/.vim/plugged')
" 配色
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1
" 主题使用     
set background=dark   
"set background=light 
set t_Co=256   
colorscheme molokai
"colorscheme solarized

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 对齐
Plug 'junegunn/vim-easy-align'

" 添加括号
Plug 'tpope/vim-surround'

" 高亮括号
Plug 'kien/rainbow_parentheses.vim'

" taglist
Plug 'vim-scripts/taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt=30      "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1      "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1     "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1  "在左侧窗口中显示taglist窗口

" F2 打开文件树
Plug 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

"" winmanager
" Plug 'vim-scripts/winmanager'
" let g:winManagerWindowLayout='FileExplorer|TagList'
" let g:winManagerWidth =25
" nmap <silent> <F7> :WMToggle<cr>
" let g:AutoOpenWinManager = 1 "开启Vim时自动打开

"下方插件增强
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
let g:Powerline_colorscheme='solarized256'
set laststatus=2

"" Python 配置

" pythgon的语法高亮 for python.vim syntax highlight
Plug 'hdima/python-syntax' 
let python_highlight_all = 1

" C/C++ 配置
Plug 'octol/vim-cpp-enhanced-highlight'

" Tiger bar
Plug 'majutsushi/tagbar'
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <F3> :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0',
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \ 'm:members:0:1',
            \ 'n:namespaces:0:1',
            \ 'p:functions_prototypes:0:1',
            \ 's:structs:0:1',
            \ 't:typedefs:0:1',
            \ 'u:unions:0:1',
            \ 'v:global:0:1',
            \ 'x:external:0:1'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ }
            \ }

" ctrlp 搜索字符串
" Plug 'ctrlpvim/ctrlp.vim'
" " 敲击<leader>+p键，进入搜索模式，这里为目录、MRU的混合模式
" let g:ctrlp_map = '<leader>p'
" let g:ctrlp_cmd = 'CtrlPMixed'
" " 根据通配符来忽略不需要搜索的文件
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
" " 本地工作目录的规则，可设置以下选项
" " 'c' - 设为当前文件所在的目录
" " 'r' - 如果最近的祖先有包含以下目录，则将该祖先目录设为工作目录：.git .hg .svn .bzr _darcs, 
" " 'a' - 和c选项类似，理解为仅在r不生效的情况下，才执行c选项
" let g:ctrlp_working_path_mode = 'ra'
" " 哪些文件、目录、链接不在搜索范围内
" let g:ctrlp_custom_ignore = {
"             \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"             \ 'file': '\v\.(exe|so|dll)$',
"             \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"             \ }

" fzf 搜索文件
" fzf 文件搜索，需要安装fzf比ctrlp更好使用
" Go语言编写，速度更快
nnoremap <F4> :FZF<CR>
nnoremap <F5> :Buffers<CR>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" 代码块补全

" 超级tab
" 补全只使用 当前文件 buffer 其他窗口 include文件 
Plug 'ervandew/supertab'
set cpt=.,b,w,i 

call plug#end()


