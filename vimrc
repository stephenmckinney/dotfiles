" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup " backups suck
set nowritebackup " backups suck
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent		" always set autoindenting on

"Change softwrap to sane setting
set nowrap textwidth=0

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Always display the status line
set laststatus=2

" Color scheme
colorscheme ir_black 
set guifont=Monaco:h12
hi LineNr           guifg=#4A4A4A
hi Visual           guibg=#562D56
"hi Visual           guibg=#751012

" Line numbers
set number
set numberwidth=4

" Tab completion options
set wildmode=list:longest,list:full
set wildmenu
set wildignore=*.o,CVS,*.pyc,._*,.DS_Store,*~,*.gif,*.jpg,*.png,*.pdf,*.psd,*.svn,.svn,.git,.hg

" <,> is the leader character
let mapleader = ","

" Window navigation
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" NERDTree
map <leader>d :NERDTreeToggle<CR>
map <leader>n :NERDTree<space>
"let NERDTreeIgnore=['\log$', '\tmp$', '\vendor$', '\~$']
