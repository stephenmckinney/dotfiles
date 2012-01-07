" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set visualbell            " don't beep
set noerrorbells          " don't beep
filetype plugin indent on " load the plugin and indent settings for the detected filetype

" Basic options
" ======================================================================
set encoding=utf-8
set history=100 " keep 100 lines of command line history
set showcmd " display incomplete commands
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" Tab completion options in Command mode
set wildmode=list:longest,list:full
set wildmenu
set wildignore=*.o,CVS,*.pyc,._*,.DS_Store,*~,*.gif,*.jpg,*.png,*.pdf,*.psd,*.svn,.svn,.git,.hg,log/**,tmp/**,vendor/**,**/migrations/**

" Whitespace (Softtabs, 2 spaces)
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Use modeline overrides
set modeline
set modelines=10

" enable ruby folding, default to unfolded
let ruby_fold=1
set foldlevelstart=99

" Load all plugins using Pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Handling extra whitespace
" ======================================================================
"Show trailing whitespace as .
set list listchars=tab:\ \ ,trail:·
" Highlight extra white space
"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"match ExtraWhitespace /\s\+$\|^\t/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhitespace /\s\+$\|^\t/
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
" Strip trailing whitespace on save
autocmd BufWritePre *.rb,*.py,*.html :call <SID>StripTrailingWhitespaces()

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
  "set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  " Hammer - to preview Github markup
  map <buffer> <leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{rdoc,md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au  BufRead,BufNewFile *.py  set tabstop=4 softtabstop=4 shiftwidth=4

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Enable matchit.vim for Ruby blocks and HTML navigation
runtime macros/matchit.vim

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
" Toggle ZoomWin
nnoremap <leader>z :ZoomWin<cr>

" Page up/Page down
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>

" Unhighlight search
nnoremap <leader>n :noh<cr>

" Open/Close quickfix window
nnoremap <leader>q :cclose<cr>
nnoremap <leader>Q :copen<cr>

" Command-T
" Default for Command-T is <leader>t
nnoremap <leader>T :CommandTFlush<cr>
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

" CTags
map <leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Snipmate
let g:snippets_dir='~/.vim/bundle/snipmate-snippets/snippets/'

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

