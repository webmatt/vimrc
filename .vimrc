" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'

"My bundles:

Bundle 'tpope/vim-fugitive'
Bundle 'othree/html5.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-sleuth'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'


call vundle#end()

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" lhs comments
map ,# :s/^/#/<CR>:noh<CR>
map ,/ :s/^/\/\//<CR>:noh<CR>
map ,> :s/^/> /<CR>:noh<CR>
map ," :s/^/\"/<CR>:noh<CR>
map ,% :s/^/%/<CR>:noh<CR>
map ,! :s/^/!/<CR>:noh<CR>
map ,; :s/^/;/<CR>:noh<CR>
map ,- :s/^/--/<CR>:noh<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:noh<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:noh<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:noh<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:noh<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:noh<CR>

" aus der vimrc von derek wyatt

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

" Make command line two lines high
set ch=2

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=B$

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

set wildmenu
" Make it easier to complete buffers, open files, etc...
"set wildignorecase

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 80 chars
"set textwidth=160

" get rid of the silly characters in separators
set fillchars = ""

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
set number
"set relativenumber

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" System default for mappings is now the "," character
let mapleader = ","

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Alright... let's try this out
imap jj <esc>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn

" NerdTree
map <F2> :NERDTreeToggle<CR>

map  <silent> <F7>    <Esc>:cprevious<CR>
map  <silent> <F8>    <Esc>:cnext<CR>

" Change default leader '\' for c-support to ','
let g:C_MapLeader = ','

" Disable autocomment on 'o'
autocmd FileType * setlocal formatoptions-=o

colorscheme desert

" eclim settings
" Add eclims-LocateFile as mapping
nnoremap <silent> <leader>o :LocateFile<cr>
let g:EclimBuffersDefaultAction = 'edit'
let g:EclimLocateFileDefaultAction = 'edit'
