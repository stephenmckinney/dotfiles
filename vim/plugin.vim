" ======================================================================
" Loads plugins via NeoBundle
" ======================================================================

filetype plugin indent off     " required

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
 call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim' " required


" ======================================================================
" Tools
" ======================================================================
" Ack
NeoBundle 'mileszs/ack.vim'
" Ctrl-P
NeoBundle 'kien/ctrlp.vim'
" Nerdtree
NeoBundle 'scrooloose/nerdtree'
" Nerdcommenter
NeoBundle 'ddollar/nerdcommenter'
" Snipmate
NeoBundle 'garbas/vim-snipmate', { 'depends' : [
    \ 'MarcWeber/vim-addon-mw-utils',
    \ 'tomtom/tlib_vim',
    \ ]}
" Snipmate Snippets
NeoBundle 'git@github.com:stephenmckinney/snipmate-snippets.git'
" Surround
NeoBundle 'tpope/vim-surround'
" Repeat
NeoBundle 'tpope/vim-repeat'
" Tabularize
NeoBundle "godlygeek/tabular"
" Indent Object
NeoBundle 'michaeljsmith/vim-indent-object'
" Ruby Block Object
NeoBundle 'nelstrom/vim-textobj-rubyblock', { 'depends' : [
    \ 'kana/vim-textobj-user',
    \ ]}
" Tagbar
NeoBundle 'majutsushi/tagbar'
" Supertab
NeoBundle 'ervandew/supertab'
" ZoomWin
NeoBundle 'vim-scripts/ZoomWin'
" QFixToggle
NeoBundle 'Valloric/QFixToggle'
" BufOnly
NeoBundle 'vim-scripts/BufOnly.vim'
" Fugitive
NeoBundle 'tpope/vim-fugitive'
" Gitv
NeoBundle 'gregsexton/gitv'
" Gist
NeoBundle 'mattn/gist-vim', { 'depends' : [
    \ 'mattn/webapi-vim',
    \ ]}
" Narrow Region
NeoBundle 'chrisbra/NrrwRgn'
" Indent Guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" Yank History
NeoBundle 'vim-scripts/YankRing.vim'
" Marks
NeoBundle 'VimEz/ShowMarks'
" Rename
NeoBundle 'vim-scripts/Rename2'
" Powerline
NeoBundle 'skwp/vim-powerline'
" Vim-Tmux integration
NeoBundle 'jgdavey/vim-turbux', { 'depends' : [
    \ 'jgdavey/tslime.vim',
    \ ]}
" =========================================
" The below plugins I am experimenting with
" =========================================
" Endwise
NeoBundle 'tpope/vim-endwise'
" Matchit
NeoBundle 'edsono/vim-matchit'
" Docs
NeoBundle 'git@github.com:stephenmckinney/vim-dochub.git'
" Ruby/RSpec/Rails
NeoBundle 'lucapette/vim-ruby-doc'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'danchoi/ri.vim'

" ======================================================================
" Themes
" ======================================================================
NeoBundle 'vim-scripts/Color-Sampler-Pack'
NeoBundle 'wgibbs/vim-irblack'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'git@github.com:stephenmckinney/vim-colors-solarized'
NeoBundle 'chriskempson/vim-tomorrow-theme'


" ======================================================================
" Languages & Syntax
" ======================================================================
" Syntastic
NeoBundle 'scrooloose/syntastic'
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
" Rails
NeoBundle 'tpope/vim-rails'
" Rspec
NeoBundle 'skwp/vim-rspec'
" Cucumber
NeoBundle 'tpope/vim-cucumber'
" Shoulda
NeoBundle 'tsaleh/vim-shoulda'
" MiniTest
NeoBundle 'sunaku/vim-ruby-minitest'
" JQuery
NeoBundle 'itspriddle/vim-jquery'
" JavaScript
NeoBundle 'pangloss/vim-javascript'
" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'
" SCSS
NeoBundle 'cakebaker/scss-syntax.vim'
" Less
NeoBundle 'groenewege/vim-less'
" Haml
NeoBundle 'tpope/vim-haml'
" Textile
NeoBundle 'timcharper/textile.vim'
" Markdown
NeoBundle 'tpope/vim-markdown'
" Git
NeoBundle 'tpope/vim-git'
" Puppet
NeoBundle 'ajf/puppet-vim'

" ======================================================================
" Tried and didn't like
" ======================================================================
"
" 'sjl/gundo.vim'
" 'sjl/threesome.vim'
" 'Lokaltog/vim-easymotion'
" 'tpope/vim-unimpaired' - RSI
" 'kien/rainbow_parentheses.vim' - Never worked right
"
" ======================================================================
" Will try some day when I have time
" ======================================================================
" 'scratch'
" 'nelstrom/vim-markdown-preview'
