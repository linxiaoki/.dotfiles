set encoding=utf-8
let mapleader = ";" 
set clipboard=unamed,unnamedplus "复制到系统寄存器(*,+)"

" => ------- vim 与 neovim 配置兼容 {{{
if !has('nim')
  set nocompatible                     " 与Vi不兼容
  filetype plugin indent on            " 对现在的插件是必须的
  syntax on                            " 语法高亮
  "set autoindent                      " 沿用上一行缩进
  set smartindent
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



"=> ------- 编辑<empty> -------{{{1

"=> ------- 移动 -------{{{1


" => ------- 搜索<empty> -------{{{1

" => ------- 预加载 -------{{{1
"若未安装vim-plug，则下载安装
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --Sync| source $MYVIMRC
endif


" => ------- 开发相关-------{{{1
" 开启语法高亮功能
syntax enable
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2

" 离开INSERT模式时，Preview窗口自动关闭
autocmd CursorMovedi * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" (需安装插件 Indent Guides
let g:indent_guides_enable_on_vim_startup=1 " 随 vim 自启动  
let g:indent_guides_start_level=2   " 从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1  " 色块宽度
nmap <silent> <Leader>i <Plug>IndentGuidesToggle    " 快捷键 i 开/关缩进可视化
set background=dark
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"( 需安装插件 NerdTree  
let NERDTreeShowBookmarks=1  " 启动NERDTree时显示书签
"autocmd VimEnter * NERDTree  " 自动启动。隐藏的命令 NERDTreeToggle
"当目录窗口是最后一个窗口时自动关闭
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   
let NERDTreeHijackNetrw=0  "避免 Vinegar与NerdTree 同时安装时，与Netrw冲突
" (需安装Ctrlp)将CtrlP缓冲区模式绑定到Ctrl+b组合键中
nmap <C-b> :CtrlPBuffer<cr>

" 基于缩进或语法进行代码折叠 ( za 打开(zo)/关闭(zo)  zM 关闭所有 zR 打开所有
" set foldmethod=indent
"set foldmethod=marker
set foldmethod=syntax
au BufRead,BufNewFile .vimrc set foldmethod=marker

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

"定义跳出括号函数，用于跳出括号
 func SkipPair()
   if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
     return "\<ESC>la"
   else
     return "\t"
   endif
 endfunc

set so=3
set hi

if &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[2 q"
endif

" => ------- 插件管理-------{{{1
" vundle 环境设置
"filetype off                   "必须"
"使用 vim-plug 管理插件
call plug#begin()
Plug 'liuchengxu/space-vim-dark'  "主题
Plug 'liuchengxu/space-vim-theme'  "主题
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'  "在vim中提供对git的支持
Plug 'yegappan/grep'
Plug 'mileszs/ack.vim'  "需安装 ack-grep (Ack xxx *)
Plug 'tpope/vim-unimpaired'  "缓冲区快捷键 [b ]b  [f ]f  [l ]l [q ]q [t ]t   yos yoc
Plug 'tabnine/YouCompleteMe',{'do': './install.py'}  "代码自动补全 (自动安装)

Plug 'jiangmiao/auto-pairs'  "自动补全括号
Plug 'ctrlpvim/ctrlp.vim' " ctrl+p 打开文件 （ctrl+f / b）
" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
" Plug 'vim-scripts/phd'
" Plug 'Lokaltog/vim-powerline'
" c++ 语法高 (可能需要再加 syntax keyword cppSTLtype initializer_list
" Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'nathanaelkane/vim-indent-guides' " 代码缩进可见
"Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'  "测试
"Plug 'vim-syntastic/Syntastic'  "语法检查，提示语法问题信息(同步)(需要在添加一些配置)
"Plug 'dense-analysis/ale' "语法检查 （后台异步检查）
"Plug '

"c++ 接口与实现快速切换 *.cpp <-> *.h (可添加快捷 nmap <silent> <Leader>sw :FSHere<cr>
" Plug 'derekwyatt/vim-fswitch' 
" 书签可视化
Plug 'kshenoy/vim-signature'
" Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
" Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'universal-ctags/ctags'
" Plug 'vim-scripts/indexer.tar.gz'
" Plug 'vim-scripts/DfrankUtil'
" Plug 'vim-scripts/vimprj'
" Plug 'dyng/ctrlsf.vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'scrooloose/nerdcommenter'
" Plug 'vim-scripts/DrawIt'
" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe'
" Plug 'derekwyatt/vim-protodef'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}  "IDE目录树
"Plug 'tpope/vim-vinegar'  "辅助nerdtree 
Plug 'weirongxu/coc-explorer'  "另一个目录树
" Plug 'Shougo/defx.nvim'   "目录树，加载速度更快
" Plug 'fholgado/minibufexpl.vim'
" Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'  "撤销目录树
Plug 'easymotion/vim-easymotion'
" Plug 'suan/vim-instant-markdown'
"Plug 'lilydjwg/fcitx.vim'
call plug#end()

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" => ------- 外观 -------{{{1
" 设置 gvim 显示字体
" set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
set nowrap
" 设置状态栏主题风格
" lei g:Powerline_colorscheme='solarized256'
" 添加辅助信息
set number  " 开启行号显示
set cursorline  " 高亮显示当前行
set cursorcolumn  " 高亮显示当前列
"插件主题
"colorscheme space-vim-theme
colorscheme space-vim-dark
"hi Comment cterm=italic "斜体
hi Comment guifg=#5C6370 ctermfg=59 "灰色
"背景透明
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE
"真彩色
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

" => ------- 插件配置 -------{{{1
"  "ctrlp 插件
"  nnoremap <C-b> :CtrlPBuffer<cr>  
"  let g:ctrlp_working_path_mod='ra'
"  "将ctrlp的工作目录默认设置为仓库根目录(若存在)
"  let g:plug_timeout = 300  "为YouCompleteMe增加vim-plug的超时时间
"  "youcompleteMe配置
"  set runtimepath+=~/.vim/plugged/YouCompleteMe
"  let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM
"  基于标签引擎
"  "let g:ycm_collect_identifiers_from_comments_and_strings = 1 "
"  注释与字符串中的内容也用于补全
"  "let g:syntastic_ignore_files=[".*\.py$"]
"  "let g:ycm_seed_identifiers_with_syntax = 1                  "
"  语法关键字补全
"  "let g:ycm_complete_in_comments = 1
"  "let g:ycm_confirm_extra_conf = 0
"  "let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,
"  没有这个会拦截掉tab, 导致其他插件的tab不能用.
"  "let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"  "let g:ycm_complete_in_comments = 1                          "
"  在注释输入中也能补全
"  "let g:ycm_complete_in_strings = 1                           "
"  在字符串输入中也能补全
"  "let g:ycm_collect_identifiers_from_comments_and_strings = 1 "
"  注释和字符串中的文字也会被收入补全
"  "let
"  g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"  "let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
"  "inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            "
"  回车即选中当前项
"  "nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     "
"  跳转到定义处
"  "let g:ycm_min_num_of_chars_for_completion=2                 "
"  从第2个键入字符就开始罗列匹配项
 "关闭自动弹出函数原型
 "set completeopt=menu,menuone
 "let g:ycm_add_preview_to_completeopt = 0
 nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  "重新编译
 " :YcmRestartServer  重新打开ycmd服务器

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  "Turn on case-insensitive feature
let g:EasyMotion_use_smartsign_us = 1  "匹配特殊字符 1 可相当于!
 "nmap <Space>s <Plug>(easymotion-s2)
 "nmap <Space>t <Plug>(easymotion-t2)
 " Jump to anywhere you want with minimal keystrokes, with just one key binding.
 " `s{char}{label}`
 "nmap <Space> <Plug>(easymotion-overwin-f)
 nmap <Space> <Plug>(easymotion-overwin-w)
 " or
 " `s{char}{char}{label}`
 " Need one more keystroke, but on average, it may be more comfortable.
 "nmap <Space> <Plug>(easymotion-overwin-f2)
 " JK motions: Line motions
 " map <Leader>j <Plug>(easymotion-j)
 "s map <Leader>k <Plug>(easymotion-k)


" => ------- 自定义快捷键 -------{{{1
" 有一个以上大写字母时仍大小写敏感  
set smartcase 
" 定义快捷键到行首和行尾
nmap <Leader>v <C-Q>
nnoremap , :

" 定义快捷键保存当前窗口内容
nnoremap <Leader>w :w<CR>zz    "zt、zb
inoremap <Leader>w <ESC>:w<CR>zz
imap <C-S> <ESC>:w<CR>
nmap <C-S> :w<CR>
nmap <Leader>q :q<CR>
imap <Leader>d <ESC>
"vmap <Leader>d <ESC>
"nmap <Leader>d <ESC>
" 全部保存并退出
nmap <Leader>WQ :wa<CR>:q<CR> 
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 窗口跳转
"nnoremap nw <C-W><C-W>      "依次遍历子窗口
"nnoremap <Leader>lw <C-W>l  "跳转至右方的窗口
"nnoremap <Leader>hw <C-W>h  "跳转至左方的窗口
"nnoremap <Leader>kw <C-W>k  "跳转至上方的子窗口
"nnoremap <Leader>jw <C-W>j  "跳转至下方的子窗口
"nnoremap <Leader>Lw <C-W>L  
"nnoremap <Leader>Hw <C-W>H 
"nnoremap <Leader>Kw <C-W>K
"nnoremap <Leader>Jw <C-W>J

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

command! Bd :bp | :sp | :bn | :bd   " 关闭缓冲区而不关闭窗口

"重命名变量 (后使用 :s 命令
nnoremap gr *:%s///gc<left><left><left>
"nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
"nnoremap gR gD:%s/<C-R>///gc<left><left><left>
"其他方式： :arg**/*.py  :argdo %s/\<旧字符串\>/新字符串/ge | update

nnoremap gw gdV%
" nmap <Leader>s zz
" vmap <Leader>s zz
" imap <Leader>s <ESC>zz<Insert><Right>
vmap <C-C> \"+y
vmap <C-X> \"+d
" imap <C-F> <ESC>:vsc Edit.Find<CR>
vnoremap <Space> 5j
vnoremap <S-Space> 5k
"map <S-Enter> -
map <Leader><Enter> $
map <Leader>a ^
nmap<Leader>y yiw
nmap<Leader>p diw<ESC>"0P
"set clipboard=unamed,unnamedplus "y/p 默认复制到寄存器 *|+ 中
nmap<Leader>xh :noh<CR>
"inoremap ' ''<esc>i
"inoremap ""<esc>i
"inoremap ( ()<esc>i
"inoremap { {}<esc>i
"inoremap [ []<esc>i
"搜索忽略大小写 
set ignorecase 
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

 " 将tab键绑定为跳出括号
 "inoremap <Tab> <c-r>=SkipPair()<CR>
 inoremap <C-l> <right>
 inoremap <C-h> <left>
 "imap{ {}<ESC>i<CR><ESC>O 
