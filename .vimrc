"
"  ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄  
" ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█  
"  ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄ 
"   ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"    ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"    ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"    ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒   
"      ░░   ▒ ░░      ░     ░░   ░ ░        
"       ░   ░         ░      ░     ░ ░      
"      ░                           ░        

	set nocompatible              " be iMproved, required
	filetype off                  " required
	
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')
	
	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	
	Plugin 'xolox/vim-misc'
	Plugin 'xolox/vim-notes'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'vim-latex/vim-latex'
	Plugin 'lervag/vimtex'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	"filetype plugin on
	"
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
	
	"  Set Colorscheme 
	set background=dark
	colorscheme wal	
	hi clear CursorLine
	
	"""UI Config 
	filetype plugin on
	syntax on
	set number				" show line number
	set noshowmode		" Hide Vim UI
	set smartindent
	set ttimeoutlen=10
	set modelines=0
	set cursorline
	"set colorcolumn=80
	set numberwidth=3
	set shiftwidth=2
	set tabstop=2
	set showmatch 		" highlight matching
	nnoremap <C-J> :bprev<CR>
	nnoremap <C-K> :bnext<CR>
 
	let g:tex_flavor = 'latex'
	command Lw silent execute "!pdflatex %:t " | redraw!
	nnoremap <C-F5> :Lw<CR>	

	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
	let g:airline_powerline_fonts = 0
	let g:airline_theme='bubblegum'
	let g:airline_section_z = '%3p%%'
	let g:airline_section_warning = ''
	
	" unicode symbols
	"  let g:airline_left_sep = '»'
	let g:airline_left_sep = ''
	"  let g:airline_left_sep = '▶'
	"  let g:airline_right_sep = '«'
	let g:airline_right_sep = ''
	"  let g:airline_right_sep = '◀'
	"  let g:airline_symbols.crypt = '🔒'
	"  let g:airline_symbols.linenr = '☰'
	"  let g:airline_symbols.linenr = '␊'
	"  let g:airline_symbols.linenr = '␤'
	"  let g:airline_symbols.linenr = '¶'
	"  let g:airline_symbols.maxlinenr = ''
	"  let g:airline_symbols.maxlinenr = '㏑'
	"  let g:airline_symbols.branch = '⎇'
	"  let g:airline_symbols.paste = 'ρ'
	"  let g:airline_symbols.paste = 'Þ'
	"  let g:airline_symbols.paste = '∥'
	"  let g:airline_symbols.spell = 'Ꞩ'
	"  let g:airline_symbols.notexists = '∄'
	"  let g:airline_symbols.whitespace = 'Ξ'
	
	" powerline symbols
	"  let g:airline_left_sep = ''
	"  let g:airline_left_alt_sep = ''
	"  let g:airline_right_sep = ''
	"  let g:airline_right_alt_sep = ''
	"  let g:airline_symbols.branch = ''
	"  let g:airline_symbols.readonly = ''
	"  let g:airline_symbols.linenr = '☰'
	"  let g:airline_symbols.maxlinenr = ''
