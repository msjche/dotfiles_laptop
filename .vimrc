set paste
set pastetoggle=<F2>
set mouse=a
"set foldmethod=indent
set rnu

let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

"Airline Themes
"let g:airline_theme='dark'
"let g:airline_theme='badwolf'
"let g:airline_theme='ravenpower'
"let g:airline_theme='simple'
"let g:airline_theme='term'
"let g:airline_theme='ubaryd'
"let g:airline_theme='laederon'
let g:airline_theme='kolor'
"let g:airline_theme='molokai'
"let g:airline_theme='powerlineish'

"colorscheme wombat256
"colorscheme tango
"colorscheme railscasts
"colorscheme vividchalk
"colorscheme distinguished
"colorscheme monokai
"colorscheme molokai
colorscheme ir_black
"colorscheme neodark
"colorscheme gotham
"colorscheme jellybeans 
"volorscheme desertEx
"colorscheme skittles_berry
"colorscheme codeblocks_dark

let g:neodark#terminal_transparent = 1

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible        " don't use old settings that vi used.  
						" Use the newer features that vim offers

" Make the leader key be space
let mapleader = "\<Space>"

set backspace=2       	" make backspace able to go over end of lines
set laststatus=2    	"always show the status line
set t_Co=256        	"set colors to 256

set number          	"show line number on side
"set nornu           	"do not make the line numbers relative to cursor
set mousehide       	"hide mouse cursor while typing
set showmode        	"display the current mode
set cursorline      	"highlight the current line
set backspace=2			"make backspace able to go over end of lines
set backspace=indent,eol,start	"Set regular backspace during insert mode

syntax enable			"use syntax highlighting


" Tab stops
	set tabstop=4    	" when you press tab, it will move forward 
						" by 4 spaces
" ----------------------------------------------------------------------
	set shiftwidth=4 	" the number of spaces the >>, <<, >, and < 
						" commands will move by will be 4
" ----------------------------------------------------------------------
	set smarttab 		" pressing backspace on a blank indented line 
						" will delete the amount of spaces equal to 
						" shiftwidth

" Neo bundle stuff
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
		" Let NeoBundle manage NeoBundle (Required!)
			NeoBundleFetch 'Shougo/neobundle.vim'
		" Fuzzy finding for files
			NeoBundle 'kien/ctrlp.vim'
		"Move around easier
			NeoBundle 'Lokaltog/vim-easymotion'
		"File navigation
			NeoBundle 'scrooloose/nerdtree'
		"Coffeescript integration and syntax highlighting
			NeoBundle 'kchmck/vim-coffee-script'
		"Vim-Airline
			NeoBundle 'vim-airline/vim-airline'
"		"Vim-Airline-Themes
"			NeoBundle 'vim-airline/vim-airline-themes'
"		" Gotham theme
"			NeoBundle 'whatyouhide/vim-gotham'

	call neobundle#end()

  filetype plugin indent on 			" Required:

	 " If there are uninstalled bundles found on startup,
	 " this will conveniently prompt you to install them.
	 NeoBundleCheck


" Key mappings

	" I hate the Escape key
		imap jj <Esc>

	" easymotion <leader> remap
	" Easymotion shortcut
		map <leader>e <leader><leader>W
		map <leader>e <leader><leader>W

"	" space-n to open a new file (in a new tab)
		nnoremap <leader>n :tabnew<cr>
"	" space-t to open a new tab
"		nnoremap <leader>t :tabnew<cr>

	" tab stuff
		nnoremap tn :tabnew<cr>
		nnoremap tk :tabnext<cr>
		nnoremap tj :tabprev<cr>
		nnoremap th :tabfirst<cr>
		nnoremap tl :tablast<cr>


	" <shift-tab> to go to next tab
		nnoremap <s-tab> :tabnext<cr>
		inoremap <s-tab> <esc>:tabnext<cr>

	" <alt-q> to exit Insert	
		inoremap <leader>j <esc>

	" <c-shift-tab> to go to previous tab
		nnoremap <c-s-tab> :tabprev<cr>
		inoremap <c-s-tab> <esc>:tabprev<cr>

	" space-f to open fuzzy file finder
		nnoremap <leader>f :CtrlPClearCache<cr>:CtrlP .<cr>

	" space-o to open the file browser
		nnoremap <leader>o :NERDTreeToggle<cr>

	" space-s to save
		nnoremap <leader>s :w<cr>

	" space-shift-s to save as
		nnoremap <leader><s-s> :w 

	" space-q to quit (doesn't save, watch out!)
		nnoremap <leader>q :q!<cr>
	
	" alt-x to Esc
		inoremap <a-d> <esc>

	" pageup and page down
		nnoremap <leader>u :PageUp
		nnoremap <leader>d :PageDown

	" space-1 insert "!" commenting
		nnoremap <leader>1 :norm i!<cr>
		vnoremap <leader>1 :norm i!<cr>

	" space-' insert """ commenting
		nnoremap <leader>' :norm i"<cr>
		vnoremap <leader>' :norm i"<cr>

	" space-3 insert "#" commenting
		nnoremap <leader>3 :norm i#<cr>
		vnoremap <leader>3 :norm i#<cr>

	" space-- insert "--" commenting
		nnoremap <leader>- :norm i--<cr>
		vnoremap <leader>- :norm i--<cr>

	" space-6 uncomment
		nnoremap <leader>6 :norm ^x<cr>
		vnoremap <leader>6 :norm ^x<cr>

	" edit config files
		nnoremap <leader>ez :tabnew ~/.zshrc<cr>
	
	" set relative number
"	 	nnoremap <c-n> set rnu<cr>
"	 	nnoremap <c-s-n> set number<cr>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <c-n> :call NumberToggle()<cr>

" Key mappings that might be new
	" space-rv to reload vimrc
		nnoremap <leader>rv :source<Space>$MYVIMRC<cr>

	" space-ev to edit the vimrc file (think: edit-vim)
		nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" Other keymappings to make the experience less painful
  "make j and k keys go up normally instead of to the previous line number
    nnoremap j gj
    nnoremap k gk

" vim: set ft=vim :
