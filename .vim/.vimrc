" my personal vimrc file.
" vim:noexpandtab
"
" Author: Kommit <kommit@gmail.com>

" ====================================================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'scrooloose/nerdtree'
Plugin 'bufexplorer.zip'
Plugin 'vcscommand.vim'
Plugin 'indentpython.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ervandew/supertab'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'elixir-lang/vim-elixir'
Plugin 'posva/vim-vue'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ====================================================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let python_highlight_all=1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" bufExplorer setting
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerMaxHeight=15
let g:bufExplorerResize=1
autocmd BufWinEnter \[Buf\ List\] setl nonumber

" to make VCSCommit commit all when opening current directory
let g:NERDTreeHijackNetrw = 0

let xml_use_xhtml = 1









" ====================================================================================================
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("win32")
	let g:MYDIR=substitute($VIM, "\\", "/", "g") . "/vim"
elseif has("unix")
	let g:MYDIR=$HOME . '/.vim'
endif

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50

" keep 100 lines of command line history
set history=100

" always set autoindenting on
set autoindent

" the max length of one 'tab'
set tabstop=4

" using space to replace 'tab'
set softtabstop=4

" shift which used by '>'
set shiftwidth=4

" show the entering command
set showcmd

" increase search
set incsearch

" show Cursor posision, NOT good in cygwin.
set ruler

" show match parentheses
set showmatch

" no wrap when the line exceed the text width
set nowrap

" break the line at word bounder.
set linebreak

" no numbering lines
set nonumber

" default text width
set textwidth=1000

" let the new split window on the bottom
set splitbelow

" words-completion modes.
set complete=.,b,u,k,s,i

" tenths of a second to show the matching paren
set matchtime=3

set wildmenu
set wildmode=list:full
" set wildmode=list:longest

" Auto change CWD to current dir
set autochdir

" Hide a buffer instead of close it
set hidden

set startofline

set number
set background=dark
set matchpairs=(:),{:},[:],<:>
set grepprg=grep\ -nH\ $*
set formatoptions+=tcrqvmMB
set iminsert=0
set imsearch=0
set shortmess=a
set ambiwidth=double
" set clipboard=unnamed


" Folding setting comes here
set foldlevel=2			" too high of folding level is not good
set foldmethod=marker	" default folding method.

" Set fileencoding priority
set encoding=utf-8
" set fencs=utf-8,cp936,cp932,ucs-bom,utf-16le

" NO swap file would lead to DATA LOSE
" when your system crashed some way
" Swap by default
" set noswapfile
" let swap file to sit on HOME directory,
" but not the tmp dir.
let &directory=g:MYDIR . "/swap"
let &backupdir=g:MYDIR . "/backup"
set backupcopy=yes
set backup
set writebackup

" '-' is a keyword in modern programming language
" set iskeyword+=-

" use '=' as a file name is not a good habit
set isfname-==

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("gui_running")
	"set guioptions-=m
	set guioptions-=T
	set guioptions-=t
	set guioptions+=b
	"set guioptions+=M
	" guifontset for 'gvim'
	"set guifont=SimSun\ 14
	"set guifontset=sony-*-*-*-*-*-14-*-*-*-*-*-iso8859-1,-*-*-*-*-*-*-14-*-*-*-*-*-gbk-0
	"set guifont=MS_Gothic:h11:cSHIFTJIS
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
	"winsize 120 50
	"winpos 40 30

	" Maximize window
	if has("win32") || has("win64")
		au GUIEnter * simalt ~x
	endif
	" color scheme setting
	colors wombat
else
	" colors desert
	colors torte
endif

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif


lan C
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

filetype plugin on
filetype indent on

" Current working directory, always equals to the directory
" started vim
let s:CWD = substitute(getcwd(), "\\", "/", "g")
" }}} common settings

" {{{ Plugin Settings
" default tags file searching path
if &tags
	let &tags=&tags.",./tags,../tags," . s:CWD . "/tags," . s:CWD . "/../tags"
else
	let &tags="./tags,../tags," . s:CWD . "/tags," . s:CWD . "/../tags"
endif

" Options about ctags
if has("win32")
	let g:Ctags_Cmd = g:MYDIR . '/bin/ctags.exe'
elseif has("unix")
	let g:Ctags_Cmd = 'ctags'
endif
let Tlist_Ctags_Cmd = g:Ctags_Cmd
let TE_Ctags_Path = Tlist_Ctags_Cmd
fun! CtagsCmd()
	let opt = '-R'
	silent execute '!' . g:Ctags_Cmd . ' ' . opt
endfun

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let s:eslint_path =system('PATH=$(npm bin):$PATH && which eslint') "定义eslint_path变量
let g:syntastic_javascript_checkers = ['eslint']
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')


" }}} Plugin Settings

" {{{ functions
fun! JKKeyMap()
	map j gj
	map k gk
endfun

fun! UpdateTimestamp()
	if &modified
		normal mnHmm`n
		silent :%s/\([Tt]ime-\=[Ss]tamp: [^A-Za-z0-9: -"']\=[<"'][^<>A-Za-z0-9: -"']\=\)[0-9: -]*\([^<>A-Za-z0-9: -"']\=[>"'][^A-Za-z0-9: "']\=\)/\=submatch(1) . strftime("%Y-%m-%d %H:%M:%S") . submatch(2)/e
		silent :%s/\([Ll]ast-\=[Uu]pdate: [^A-Za-z0-9: -"']\=[<"'][^<>A-Za-z0-9: -"']\=\)[0-9: -]*\([^<>A-Za-z0-9: "']\=[>"'][^A-Za-z0-9: "']\=\)/\=submatch(1) . strftime("%Y-%m-%d %H:%M:%S") . submatch(2)/e
		normal 'mzt`n
	endif
endfun
" }}}

" {{{ load configurations
silent execute 'source ' . g:MYDIR . '/dict.vim'
silent execute 'source ' . g:MYDIR . '/autocmd.vim'
silent execute 'source ' . g:MYDIR . '/keymaps.vim'
" }}}
