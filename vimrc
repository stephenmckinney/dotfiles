" ======================================================================
" Basic options
"     Also see gvimrc
" ======================================================================

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load plugins
if filereadable(expand("~/.vim/plugin.vim"))
  source ~/.vim/plugin.vim
endif

" Load the filetype detection, plugin, and indent settings
filetype plugin indent on

" Basics
set encoding=utf-8
set shell=/bin/sh
set history=100 " keep 100 lines of command line history
set showcmd " display incomplete commands
set showmode " display mode
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom and 15 lines on the left
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Indentation (Softtabs, 2 spaces): rb, html, css, js
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set foldmethod=indent
set foldlevel=99

" No backups
set nobackup
set nowritebackup
set noswapfile

" No beeps
set noerrorbells visualbell t_vb=

" Always open vertical splits to the right
set splitright

" Tab completion options in Command mode
set wildmode=list:longest,list:full
set wildmenu
" wildignore - A file that matches with one of these patterns is ignored when  completing file or directory names
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,*.pyc,.git,.hg,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Disable images
set wildignore+=*.gif,*.GIF,*.jpg,*.JPG,*.png,*.PNG,*.pdf,*.PDF,*.psd,*.PSD
" Disable temp and backup files
set wildignore+=*.swp,*~,._*,.DS_Store
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore Rails log and tmp
set wildignore+=log/**,tmp/**

" Use modeline overrides
set modeline
set modelines=10

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the 'must save first' error doesn't come up)
set hidden


" ======================================================================
" Search
" ======================================================================
set incsearch " do incremental searching
set hlsearch
set ignorecase
set smartcase


" ======================================================================
" UI
" ======================================================================
set ruler " show the cursor position all the time
set number " show line numbers
set numberwidth=4
set guifont=Menlo:h13
set background=dark
colorscheme solarized
syntax enable " Turn on syntax highlighting allowing local overrides
set list listchars=tab:▸\ ,trail:· " Show tabs and trailing whitespace


" ======================================================================
" Status line
" ======================================================================
if has("statusline")
  set laststatus=2 " Always display the status bar
  set statusline=%t       "tail of the filename
  set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
  set statusline+=%{&ff}] "file format
  set statusline+=%h      "help file flag
  set statusline+=%y      "filetype
  set statusline+=%r      "read only flag
  set statusline+=%m      "modified flag
  set statusline+=%=      "left/right separator
  set statusline+=%l/%L   "cursor line/total lines
  set statusline+=\ %P    "percent through file
endif


" ======================================================================
" Load functions, autocommands, plugin configurations,
" key mappings, and local vim conifg
" ======================================================================
if filereadable(expand("~/.vim/functions.vim"))
  source ~/.vim/functions.vim
endif

if filereadable(expand("~/.vim/plugin_config.vim"))
  source ~/.vim/plugin_config.vim
endif

if filereadable(expand("~/.vim/keymaps.vim"))
  source ~/.vim/keymaps.vim
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

