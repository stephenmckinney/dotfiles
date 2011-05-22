" TODO: commenting and indentation

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype plugin indent on " load the plugin and indent settings for the detected filetype

" Basic options
" ======================================================================
set encoding=utf-8
set history=100 " keep 100 lines of command line history
set showcmd " display incomplete commands
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Tab completion options in Command mode
set wildmode=list:longest,list:full
set wildmenu
set wildignore=*.o,CVS,*.pyc,._*,.DS_Store,*~,*.gif,*.jpg,*.png,*.pdf,*.psd,*.svn,.svn,.git,.hg

" Whitespace (Softtabs, 2 spaces)
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:· "Show tailing whitespace as .

" Use modeline overrides
set modeline
set modelines=10

" Load all plugins using Pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Presentation
" ======================================================================
" UI
set ruler " show the cursor position all the time
set number " show line numbers
set numberwidth=4
set laststatus=2 " Always display the status bar

" Color scheme
colorscheme vividchalk
set guifont=Monaco:h12

" Syntax Highlighting
" ======================================================================
syntax on

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  " Hammer - to preview Github markup
  map <buffer> <leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make                                     set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{rdoc,md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Search
" ======================================================================
set incsearch " do incremental searching
set hlsearch
set ignorecase
set smartcase

" Commands and Plugin Configuration
" ======================================================================
" <,> is the leader character
let mapleader = ","

" Window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Split window vertically
nnoremap <leader>v <C-w>v<C-w>l
" Split window horizontally
nnoremap <leader>s <C-w>s<C-w>j
" Close all but current
nnoremap <leader>o <C-w>o
" Cycle through all windows
nnoremap <leader>w <C-w>w
" Exchange with other window
nnoremap <leader>x <C-w>x

" Command-T
" Default for Command-T is <leader>t
let g:CommandTMaxHeight=20

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>n :NERDTree<space>

" Ack
nnoremap <leader>f :Ack<space>

" CTags
map <leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

