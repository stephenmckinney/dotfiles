" Basic options
" ======================================================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load all plugins using Pathogen
call pathogen#infect()
call pathogen#helptags()

" Load the filetype detection, plugin, and indent settings
filetype plugin indent on

" Basics
set encoding=utf-8
set history=100 " keep 100 lines of command line history
set showcmd " display incomplete commands
set showmode " display mode
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom and 15 lines on the left
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Indentation (Softtabs, 2 spaces)
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
" Special indention for some languages
" FIXME does python ft work better than *.py?
"autocmd BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
autocmd FileType make   setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" No backups
set nobackup
set nowritebackup
set noswapfile

" No beeps
set visualbell
set noerrorbells

" Tab completion options in Command mode
set wildmode=list:longest,list:full
set wildmenu
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,*.pyc,.git,.hg,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Disable images
set wildignore+=*.gif,*.jpg,*.png,*.pdf,*.psd
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore Rails log, tmp, and migrations; as well as Django migrations
set wildignore+=log/**,tmp/**,**/migrations/**
" Disable temp and backup files
set wildignore+=*.swp,*~,._*,.DS_Store

" Use modeline overrides
set modeline
set modelines=10

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the 'must save first' error doesn't come up)
set hidden

" Enable ruby folding, default to unfolded
let ruby_fold=1
set foldlevelstart=99


" UI
" ======================================================================
set ruler " show the cursor position all the time
set number " show line numbers
set numberwidth=4


" Status line
" ======================================================================
set laststatus=2 " Always display the status bar
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


" Search
" ======================================================================
set incsearch " do incremental searching
set hlsearch
set ignorecase
set smartcase


" Functions
" ======================================================================
" Strip trailing whitespace
" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Wrap like a text file
function! s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

" Wrap like a text file and allow preview
function! s:setupMarkup()
  call s:setupWrapping()
  " Preview in Marked.app
  nnoremap <leader>p :silent !open -a Marked.app '%:p'<cr>
endfunction

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


" Whitespace
" ======================================================================
"Show trailing whitespace as .
set list listchars=tab:\ \ ,trail:·

" FIXME will this stay or not?
" Highlight extra white space
"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"match ExtraWhitespace /\s\+$\|^\t/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhitespace /\s\+$\|^\t/

" Strip trailing whitespace on save
autocmd BufWritePre *.rb,*.py,*.html,*.css,*.js :call <SID>StripTrailingWhitespaces()


" Syntax and Syntax Highlighting
" ======================================================================
syntax enable

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
" FIXME I here this is handle by ruby.vim
"au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{rdoc,md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Enable matchit.vim for Ruby blocks and HTML navigation
runtime macros/matchit.vim


" Commands and Plugin Configuration
" ======================================================================
" <,> is the leader character
let mapleader = ","

" It's not like :W is bound to anything anyway.
command! W :w

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
" Adjust viewports to the same size
nnoremap <Leader>= <C-w>=
" Toggle ZoomWin
nnoremap <leader>z :ZoomWin<cr>

" Page up/Page down
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>

" TODO Toggle highligth search
" TODO turn it off with <CR>
"nnoremap <CR> :nohlsearch<cr>
" Turn off hightlight search
nnoremap <leader>n :noh<cr>

" Edit vimrc file
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Toggle Quickfix window
nnoremap <leader>q :QFix<cr>

" Toggle Tagbar
nnoremap <C-t> :TagbarToggle<cr>

" Command-T
" Default for Command-T window list is <leader>t
" Default for Command-T buffer list is <leader>b
nnoremap <leader>T :CommandTFlush<cr>\|:CommandT<cr>
nnoremap <leader>B :BufOnly<cr>\|:CommandTBuffer<cr>
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=15
let g:CommandTMaxFiles=20000

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>e :NERDTree<space>

" Ack
" Ack ignores are stored in ~/.ackrc
nnoremap <leader>f :Ack!<space>

" Align
xnoremap <leader>a :Align<space>

" Snipmate
let g:snippets_dir='~/.vim/bundle/snipmate-snippets/snippets/'

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

