""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible				"设置不兼容VI
set linebreak					"英文单词换行时不截断
set history=500

set autoread					"自动重读

set number						"显示行号
set ruler						"标尺？不理解
set rulerformat=%15(%c%V\ %p%%%)

set hlsearch					"高亮显示搜索内容
set ignorecase					"搜索时忽略大小写

set tabstop=4					"一个TAB占的空格数
set shiftwidth=4				"缩进宽度
set softtabstop=4				"一次tab按键的宽度
set noexpandtab					"不允许自动将tab转变为空格
set smarttab					"智能tab？不了解：

set autoindent					"自动缩进
set smartindent					"智能缩进

set foldmethod=indent			"代码折叠

set list						"显示tab及空格
set listchars=tab:\|\ ,trail:-	"显示TAB的字符

set matchpairs+=<:>				"书名号配对

set equalalways					"分割窗口总是等宽/高
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme lucius
if has('syntax')
	syntax enable
	syntax on
	colorscheme molokai
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Auto Command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	filetype plugin indent on	"打开文件类型检测
	autocmd FileType c,cpp,java set mps+==:;	"三元表达式配对
	autocmd BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m setfiletype objc
	autocmd BufWritePost .vimrc source ~/.vimrc	"如果配置文件变化了，自动重载
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Short cuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","				"设置map前导符
let g:mapleader = ","			"设置全局map前导符

"快速编辑vim配置文件"
nmap <leader>ec   :e ~/.vimrc<CR>

"保存
"快速退出(保存)
"快速退出(不保存)
nmap <leader>s   :w!<cr>
nmap <leader>w   :wq!<cr>
nmap <leader>q   :q!<cr>
" Normal Mode, Visual Mode, and Select Mode,
" use <Tab> and <Shift-Tab> to indent
" @see http://c9s.blogspot.com/2007/10/vim-tips.html
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Plugin Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"Windows Manager"
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>

" BufExplorer"
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left
let g:bufExplorerSplitVertical=1     " Split vertically
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setlocal nonumber

" Command-T"
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>j :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>

"omnicppcomplete"
let OmniCpp_DisplayMode = 1
let OmniCpp_MayCompleteScope = 1
