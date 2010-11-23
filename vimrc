""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","				"设置map前导符

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
autocmd FileType c,cpp,java set mps+==:;	"三元表达式配对

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme lucius
syntax enable
