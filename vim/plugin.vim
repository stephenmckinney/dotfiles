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
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
" My Snipmate Snippets
" with read/write access
NeoBundle 'git@github.com:stephenmckinney/snipmate-snippets.git'
" Surround
NeoBundle 'tpope/vim-surround'
" Unimpaired
NeoBundle 'tpope/vim-unimpaired'
" Repeat
NeoBundle 'tpope/vim-repeat'
" Tabularize
NeoBundle "godlygeek/tabular"
" Indent Object
NeoBundle 'michaeljsmith/vim-indent-object'
" Ruby Block Object
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-user'
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
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
" Narrow Region
NeoBundle 'chrisbra/NrrwRgn'
" Indent Guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" history of yanks, changes, and deletes.
NeoBundle 'vim-scripts/YankRing.vim'
" Marks
NeoBundle 'VimEz/ShowMarks'
" Rename
NeoBundle 'vim-scripts/Rename2'
" Vim-Tmux integration
NeoBundle 'jgdavey/vim-turbux'
NeoBundle 'jgdavey/tslime.vim'
" =========================================
" TODO try: scratch, 'nelstrom/vim-markdown-preview'
" =========================================
" =========================================
" TODO decide if the below experimental
" plugins are here to stay
" =========================================
" Powerline
NeoBundle 'skwp/vim-powerline'
" Endwise
NeoBundle 'tpope/vim-endwise'
" Matchit
NeoBundle 'edsono/vim-matchit'
" Docs
" with read/write access
NeoBundle 'git@github.com:stephenmckinney/vim-dochub.git'
" colors parenthesis.
"NeoBundle 'kien/rainbow_parentheses.vim'


" ======================================================================
" Themes
" ======================================================================
NeoBundle 'vim-scripts/Color-Sampler-Pack'
NeoBundle 'wgibbs/vim-irblack'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'altercation/vim-colors-solarized'
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

" 'sjl/gundo.vim'
" 'sjl/threesome.vim'
" 'Lokaltog/vim-easymotion'
" 'Lokaltog/vim-powerline'
