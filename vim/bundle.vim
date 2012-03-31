" ======================================================================
" Bundle.vim - Loads plugins via NeoBundle
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
NeoBundle 'git@github.com:poorlilrichboy/snipmate-snippets.git'
" Surround
NeoBundle 'tpope/vim-surround'
" Unimpaired
NeoBundle 'tpope/vim-unimpaired'
" Repeat
NeoBundle 'tpope/vim-repeat'
" Align
NeoBundle 'tsaleh/vim-align'
" Vim Indent Object
NeoBundle 'michaeljsmith/vim-indent-object'
" FIXME delete the below two plugins
" if ruby-vim provides block support
" Vim Text Object
"NeoBundle 'kana/vim-textobj-user'
" Vim Text Object - Ruby Block
"NeoBundle 'nelstrom/vim-textobj-rubyblock'
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
" Gist
NeoBundle 'mattn/gist-vim'
" Narrow Region
NeoBundle 'chrisbra/NrrwRgn'
" FIXME decide if the below plugins
" are here to stay
" Rename
NeoBundle 'vim-scripts/Rename2'
" Endwise
NeoBundle 'tpope/vim-endwise'
" Matchit
NeoBundle 'edsono/vim-matchit'
" Indent Guides
NeoBundle 'nathanaelkane/vim-indent-guides'
" Docs
" with read/write access
NeoBundle 'git@github.com:poorlilrichboy/vim-dochub.git'
" Marks
NeoBundle 'VimEz/ShowMarks'


" ======================================================================
" Themes
" ======================================================================
NeoBundle 'vim-scripts/Color-Sampler-Pack'
NeoBundle 'wgibbs/vim-irblack'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'altercation/vim-colors-solarized'


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
" JQuery
NeoBundle 'itspriddle/vim-jquery'
" JavaScript
NeoBundle 'pangloss/vim-javascript'
" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'
" SCSS
NeoBundle 'cakebaker/scss-syntax.vim'
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

