" Also see gvimrc

" ======================================================================
" Basic options
" ======================================================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load all plugins using Pathogen
call pathogen#infect()
call pathogen#helptags()

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
set wildignore+=*.gif,*.GIF,*.jpg,*.JPG,*.png,*.PNG,*.pdf,*.PDF,*.psd,*.PSD
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
  set statusline+=%c,     "cursor column
  set statusline+=%l/%L   "cursor line/total lines
  set statusline+=\ %P    "percent through file
endif


" ======================================================================
" Functions
" ======================================================================
" Strip trailing whitespace
" http://vimcasts.org/episodes/tidying-whitespace/
function! s:StripTrailingWhitespaces()
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

" Wrap text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

" Wrap text and allow preview
function! s:setupMarkup()
  call s:setupWrapping()
  " Preview in Marked.app
  nmap <leader>p :silent !open -a Marked.app '%:p'<CR>
endfunction

" NERDTree Customizations (taken from Janus)
" https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction


" ======================================================================
" Filetypes and autocmds
" ======================================================================
" Load the filetype detection, plugin, and indent settings
filetype plugin indent on
" Turn on syntax highlighting allowing local overrides
syntax enable

" Show trailing whitespace as .
set list listchars=tab:\ \ ,trail:·

if has("autocmd")
  augroup poorlilrichboy
    au!
    " rb, html, css, js indention are handled by the defaults
    au FileType make   setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
    au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
    au FileType ruby setlocal foldmethod=syntax
    au FileType ruby compiler ruby
    au BufRead,BufNewFile *.{rdoc,md,markdown,mdown,mkd,mkdn,txt} call s:setupMarkup()
    " Strip trailing whitespace on save
    au BufWritePre *.rb,*.py,*.html,*.css,*.js :call s:StripTrailingWhitespaces()
    " Remember last location in file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
    " NERDTree Customizations (taken from Janus)
    " https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
    au VimEnter * call s:CdIfDirectory(expand("<amatch>"))
    au FocusGained * call s:UpdateNERDTree()
  augroup END
endif


" ======================================================================
" Plugin Configuration
" ======================================================================
" Syntastic
let g:syntastic_quiet_warnings=1

"CtrlP
let g:ctrlp_map = ''
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 15
let g:ctrlp_extensions = ['tag']

" Command-T
"let g:CommandTMatchWindowAtTop=1
"let g:CommandTMaxHeight=15
"let g:CommandTMaxFiles=20000

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o', '\~$']
let NERDTreeHijackNetrw = 0
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'

" Snipmate
let g:snips_author='Steve McKinney'
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['eruby'] = 'eruby, eruby-rails, html'
let g:snipMate.scope_aliases['htmldjango'] = 'htmldjango, html'
let g:snipMate.scope_aliases['php'] = 'php, html'
let g:snipMate.scope_aliases['ruby'] = 'ruby, ruby-factorygirl, ruby-rails, ruby-rspec, ruby-shoulda'

" Matchit
runtime macros/matchit.vim " Enable matchit.vim for Ruby blocks and HTML navigation

" Tagbar
let g:tagbar_compact = 1


" ======================================================================
" Key mappings Commands
" ======================================================================
" <,> is the leader character
let mapleader = ","

" It's not like :W is bound to anything anyway.
command! W :w

" Window navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
" Split window vertically
nmap <leader>v <C-w>v<C-w>l
" Split window horizontally
nmap <leader>s <C-w>s<C-w>j
" Close all but current
nmap <leader>o <C-w>o
" Cycle through all windows
nmap <leader>w <C-w>w
" Exchange with other window
nmap <leader>x <C-w>x
" Adjust viewports to the same size
nmap <Leader>= <C-w>=
" Toggle ZoomWin
nmap <silent> <leader>z :ZoomWin<CR>

" Turn off hightlight search
nnoremap <silent> <CR> :noh<CR>

" Edit vimrc file
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" Find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
" Maintain selection after indent
vmap > >gv
vmap < <gv

" Toggle Quickfix window
nmap <silent> <leader>q :QFix<CR>

" Toggle Tagbar
nmap <silent> <C-t> :TagbarToggle<CR>

" CtrlP
nmap <silent> <Leader>t :CtrlP<CR>
nmap <silent> <leader>T :ClearCtrlPCache<CR>\|:CtrlP<CR>
nmap <silent> <Leader>b :CtrlPBuffer<CR>
nmap <silent> <leader>B :BufOnly<CR><CR>

" Command-T
"nmap <silent> <Leader>t :CommandT<CR>
"nmap <silent> <leader>T :CommandTFlush<CR>\|:CommandT<CR>
"nmap <silent> <Leader>b :CommandTBuffer<CR>
"nmap <silent> <leader>B :BufOnly<CR>\|:CommandTBuffer<CR>

" NERDTree
nmap <silent> <leader>d :NERDTreeToggle<CR>
nmap <leader>e :NERDTree<space>

" Ack
" Ack igs are stored in ~/.ackrc
nmap <leader>f :Ack!<space>

" Align
xmap <leader>a :Align<space>

" NarrowRegion
vmap <silent> <leader>n :NarrowRegion<CR>

" Fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
" I'm not ready to start committing and pushing from vim. Maybe one day.
"nmap <leader>gc :Gcommit<CR>
"nmap <leader>gp :Git push<CR>
"
""" Code folding options
nmap <silent> <D-0> :set foldlevel=99<CR>
nmap <silent> <D-1> :set foldlevel=0<CR>
nmap <silent> <D-2> :set foldlevel=1<CR>
nmap <silent> <D-3> :set foldlevel=2<CR>
nmap <silent> <D-4> :set foldlevel=3<CR>
nmap <silent> <D-5> :set foldlevel=4<CR>
nmap <silent> <D-6> :set foldlevel=5<CR>
nmap <silent> <D-7> :set foldlevel=6<CR>
nmap <silent> <D-8> :set foldlevel=7<CR>
nmap <silent> <D-9> :set foldlevel=8<CR>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

