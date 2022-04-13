set encoding=utf-8
" 定义转义符
let mapleader = ";" 

if !has('nim')
  set nocompatible                     " 与Vi不兼容
  filetype plugin indent on            " 对现在的插件是必须的
  syntax on                            " 语法高亮
  set autoindent                       " 沿用上一行缩进
  set autoread                         " 从磁盘自动重载文件
  set backspace=indent,eol,start       " 现代编辑器的退格键行为
  set belloff=all                      " 禁用错误报警声
  set cscopeverbose                    " 详细输出cscope结果
  set complete-=i                      " 补全时，不要对当前被包含的文件进行扫描
  "set display=lastline,msgsep          " 显示更多消息文本
  set encoding=utf-8                   " 设置默认编码
  "set fillchars=vert:|,fold:           " 分隔字符
  set formatoptions=tcqj               " 更直观的自动格式化
  set fsync                            " 调用fsync()实现更健壮的文件保存
  set history=10000                    " 最大的历史记录数
  set hlsearch                         " 搜索结果高亮显示
  set incsearch                        " 搜索时边输入边搜索、并移动光标
  set langnoremap                      " 避免出现映射崩溃的情况
  set laststatus=2                     " 总是显示状态栏
  set listchars=tab:>\ ,trail:-,nbsp:+ " :list时一些特殊字符的显示
  set nrformats=bin,hex                " 对<c-a>和<c-x>的支持
  set ruler                            " 在状态栏角落里显示当前行位置信息
  set sessionoptions-=options          " 不同会话不共享选项
  set shortmess=F                      " 文件信息少显示一些
  set showcmd                          " 在状态栏中显示最后一条命令
  set sidescroll=1                     " 更平滑的侧边滚动条
  set smarttab                         " 更智能的<Tab>键响应方式
  set tabpagemax=50                    " -p选项能够打开的最大数目的标签页
  set tags=./tags;,tags                " 用于搜索标签的那些文件名
  set ttimeoutlen=50                   " 按键序列中等待下一个的时间，单位为毫秒
  set ttyfast                          " 要求实现快速的终端连接
  set viminfo+=!                       " 为多个会话保存全局变量
  set wildmenu                         " 增强命令行补全功能(文件)
  set wildmode=list:longest,full       " 补全为允许的最长字符串，然后打开wildmenu
endif


"搜索忽略大小写 
" set ignorecase 
" 禁止光标闪烁
" set gcr=a:block-blinkon0
" 禁止显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" set guioptions-=R
" 禁止显示菜单和工具条
" set guioptions-=m
" set guioptions-=T

" -----------添加辅助信息-----------
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn


" -----------美观-----------
" 设置 gvim 显示字体
" set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
set nowrap
" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'

" -----------开发相关-----------
" 开启语法高亮功能
syntax enable
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" (需安装插件 Indent Guides
" let g:indent_guides_enable_on_vim_startup=1 " 随 vim 自启动  
let g:indent_guides_start_level=2   " 从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1  " 色块宽度
nmap <silent> <Leader>i <Plug>IndentGuidesToggle    " 快捷键 i 开/关缩进可视化
set background=dark
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"( 需安装插件 NerdTree  
let NERDTreeShowBookmarks=1  " 启动NERDTree时显示书签
autocmd VimEnter * NERDTree  " 自动启动。隐藏的命令 NERDTreeToggle
"当目录窗口是最后一个窗口时自动关闭
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   
let NERDTreeHijackNetrw=0  "避免 Vinegar与NerdTree 同时安装时，与Netrw冲突

" nmap <C-b> :CtrlPBuffer<cr>  "(需安装Ctrlp)将CtrlP缓冲区模式绑定到Ctrl+b组合键中

" 基于缩进或语法进行代码折叠 ( za 打开(zo)/关闭(zo)  zM 关闭所有 zR 打开所有
" set foldmethod=indent
set foldmethod=syntax

"set foldcolumn=1  "0~12
" 启动 vim 时关闭折叠代码
set nofoldenable

" vim-signature 快捷键设置 
" (常用：m, 自动设置下个可用书签、mda 删除当前文件所有独立书签、m? 列出当前文件所有书签
" mn 按行号跳转至下个、mp 按行号跳转至上个 
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "mda",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "mn",
    \ 'GotoPrevSpotByPos'  :  "mp",
    \ 'GotoNextMarker'     :  "[+",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListLocalMarks'     :  "ms",
    \ 'ListLocalMarkers'   :  "m?"
    \ }


" -----------自定义快捷键-----------
" 有一个以上大写字母时仍大小写敏感  
set smartcase 
" 定义快捷键到行首和行尾
nmap <Leader>v <C-Q>
" nmap <Leader>; ;

" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
imap <C-S> <ESC>:w<CR>
nmap <C-S> :w<CR>
nmap <Leader>q :q<CR>
imap <Leader>d <ESC>
vmap <Leader>d <ESC>
nmap <Leader>d <ESC>
" 全部保存并退出
nmap <Leader>WQ :wa<CR>:q<CR> 
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 窗口跳转
nnoremap nw <C-W><C-W>      " 依次遍历子窗口
nnoremap <Leader>lw <C-W>l  " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h  " 跳转至左方的窗口
nnoremap <Leader>kw <C-W>k  " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j  " 跳转至下方的子窗口
nnoremap <Leader>Lw <C-W>L  
nnoremap <Leader>Hw <C-W>H 
nnoremap <Leader>Kw <C-W>K
nnoremap <Leader>Jw <C-W>J
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

command! Bd :bp | :sp | :bn | :bd   " 关闭缓冲区而不关闭窗口

" nmap <Leader>s zz
" vmap <Leader>s zz
" imap <Leader>s <ESC>zz<Insert><Right>
vmap <C-C> \"+y
vmap <C-X> \"+d
" imap <C-F> <ESC>:vsc Edit.Find<CR>
map <Space> 5j
"map<S-Space> 5k
map <S-Enter> -
map <Leader><Enter> ^
nmap<Leader>y yiw
nmap<Leader>p diw<ESC>"0P
"set clipboard=unamed,unnamedplus "y/p 默认复制到寄存器 *|+ 中
nmap<Leader>xh :noh<CR>
imap ' ''<esc>i
imap " ""<esc>i
imap ( ()<esc>i
imap { {}<esc>i
imap [ []<esc>i

set so=3
set hi
set hls



if &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[2 q"
endif
set smartindent

" -----------插件管理-----------
" vundle 环境设置
"filetype off                   "必须"
"设置包括vundle和初始化相关的运行时路径"
set rtp+=~/.vim/bundle/Vundle.vim
"启用vundle管理插件，必须"
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'yegappan/grep'
Plugin 'mileszs/ack.vim'  "需安装 ack-grep (Ack xxx *)
Plugin 'tpope/vim-unimpaired'  "缓冲区快捷键 [b ]b  [f ]f  [l ]l [q ]q [t ]t   yos yoc

Plugin 'ctrlpvim/ctrlp.vim' " ctrl+p 打开文件 （ctrl+f / b）
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
" Plugin 'vim-scripts/phd'
" Plugin 'Lokaltog/vim-powerline'
" c++ 语法高 (可能需要再加 syntax keyword cppSTLtype initializer_list
" Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'nathanaelkane/vim-indent-guides' " 代码缩进可见
" "c++ 接口与实现快速切换 *.cpp <-> *.h (可添加快捷 nmap <silent> <Leader>sw :FSHere<cr>
" Plugin 'derekwyatt/vim-fswitch' 
" 书签可视化
Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'rust-lang/rust.vim'
Plugin 'majutsushi/tagbar'
Plugin 'universal-ctags/ctags'
" Plugin 'vim-scripts/indexer.tar.gz'
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/DrawIt'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'  "IDE目录树
Plugin 'tpope/vim-vinegar'  "辅助nerdtree 
" Plugin 'Shougo/defx.nvim'   "目录树，加载速度更快
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
Plugin 'easymotion/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'


call vundle#end()


" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
