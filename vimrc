""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible				"设置不兼容VI
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
"let vundle manage vundle
"required
Bundle 'gmarik/Vundle.vim'

Bundle 'ervandew/supertab'
Bundle 'nanotech/jellybeans.vim'
Bundle 'netrw.vim'
Bundle 'winmanager'
Bundle 'Vimball'
Bundle 'a.vim'
Bundle 'OmniCppComplete'
Bundle 'FencView.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'The-NERD-Commenter'
Bundle 'Mark'
Bundle 'bufexplorer.zip'
Bundle 'genutils'
Bundle 'TabBar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'CSApprox'
Bundle 'TagHighlight'
Bundle 'jnwhiteh/vim-golang'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'altercation/vim-colors-solarized'
Bundle 'wakatime/vim-wakatime'
"dependency for vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle 'garbas/vim-snipmate'
filetype plugin indent on

set linebreak					"英文单词换行时不截断
set history=500

"set mouse=a						"设置可以使用鼠标

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
set backspace=2					"backspace的作用，删除eol
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSApprox
set background=dark
colorscheme molokai
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
"colorscheme lucius
if has('syntax')
	syntax enable
	syntax on
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Auto Command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	filetype plugin indent on	"打开文件类型检测
	autocmd FileType c,cpp,java set mps+==:;	"三元表达式配对
	autocmd BufNewFile,BufRead,BufEnter,WinEnter,FileType *.m setfiletype objc
	autocmd BufWritePost .vimrc source ~/.vimrc	"如果配置文件变化了，自动重载
	autocmd BufWritePost vimrc source ~/.vimrc	"如果配置文件变化了，自动重载
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Short cuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","				"设置map前导符
let g:mapleader = ","			"设置全局map前导符

"快速切换窗口
nnoremap <C-H>  <C-W><C-H>
nnoremap <C-J>  <C-W><C-J>
nnoremap <C-K>  <C-W><C-K>
nnoremap <C-L>  <C-W><C-L>

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
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
	"if getline('.')[col('.') - 1] == a:char
		"return "\<Right>"
	"else
		"return a:char
	"endif
"endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Plugin Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Windows Manager"
let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagBar"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
autocmd BufWinEnter \[File\ List\] setlocal nonumber

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

"superTab"
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"cscope"
"
"0 or s: Find this C symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
if has("cscope")
	if has("mac")|| has("macunix")
		set csprg=/opt/local/bin/cscope
	else
		set csprg=/usr/local/bin/cscope
	endif
	set csto=0
	set cst
	set nocsverb
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-C' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-C>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-C*twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-C><C-C>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-C>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-C>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-C>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-C>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-C>i
	\:vert scs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C><C-C>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>

"map F8 to open tagbar
nmap <F8> :TagbarToggle<CR>

"powerline
set laststatus=2

" taghighlight
if ! exists('g:TagHighlightSettings')
	let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['TagFileName'] = 'tagfile'
nmap <leader>re :UpdateTypesFile<CR>
