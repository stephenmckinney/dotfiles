" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin indent on

" Basic options
" ======================================================================
set nobackup " backups suck?
set nowritebackup " backups suck?
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set laststatus=2 " Always display the status line

" Tab completion options
set wildmode=list:longest,list:full
set wildmenu
set wildignore=*.o,CVS,*.pyc,._*,.DS_Store,*~,*.gif,*.jpg,*.png,*.pdf,*.psd,*.svn,.svn,.git,.hg

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent		" always set autoindenting on

" Presentation
" ======================================================================
set number " show line numbers
set numberwidth=4
set nowrap textwidth=0 " softwrap

" Color scheme
colorscheme ir_black 
set guifont=Monaco:h12
hi LineNr           guifg=#4A4A4A
hi Visual           guibg=#562D56
"hi Visual           guibg=#751012

" Search
" ======================================================================
set incsearch		" do incremental searching

" <,> is the leader character
let mapleader = ","

" Window navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
" Split window vertically
nnoremap <leader>w <C-w>v<C-w>l 

" NERDTree
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>o :NERDTree<space>

" Ack
nnoremap <leader>f :Ack<space>

" .vimrc
nnoremap <leader>ev <C-w>v<C-w>l :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

