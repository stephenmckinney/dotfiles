# my dotfiles

Configures ack, gem, git, irb, pry, rails, rspec, rvm, vim, zsh...for use at home and on the road.

## Dependencies

### Required

* [Git](http://git-scm.com/)
* [Vim](http://www.vim.org/) or [MacVim](https://github.com/b4winckler/macvim) 7.3 or greater

### Optional

#### Zsh
* [fasd](https://github.com/clvv/fasd) gives you quick access to frequent/recent files and directories
* [Hub](https://github.com/defunkt/hub) adds Github syntax sugar to Git
* [GNU Coreutils](http://www.gnu.org/software/coreutils/) is required to use Solarized dircolors

#### Vim
* [Ack](http://betterthangrep.com/) is required for [Ack.vim](https://github.com/mileszs/ack.vim)
* [Exuberant Ctags](http://ctags.sourceforge.net/) is required for [Tagbar](http://majutsushi.github.com/tagbar/)

#### Pry
* [Pry-nav](https://github.com/nixme/pry-nav) teaches Pry about step, next, and continue to create a simple debugger
* [Awesome Print](https://github.com/michaeldv/awesome_print) pretty prints Ruby objects in full color with proper indentation

## Install

    git clone git://github.com/poorlilrichboy/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install

To install Vim plugins, open Vim and run `:NeoBundleInstall`.

### Install Dependencies on Mac OS X

Install [Homebrew](http://mxcl.github.com/homebrew/), then:

    brew install git ack ctags hub coreutils fasd

To install MacVim:

    brew install macvim

Or to install terminal vim with Ruby support:

    brew install https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb

Other recommended installs: [RVM](http://beginrescueend.com/) and [Homebrew'd Python](https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python)

### Install Dependencies on Linux

TBD

## Stay Updated

### Zsh

TBD by OMZ 2.0

### Vim

Open Vim and run `:NeoBundleUpdate`

## Makes Use Of

### Zsh

* My [fork](https://github.com/poorlilrichboy/oh-my-zsh) of sorin-ionescu's [Oh My Zsh](https://github.com/sorin-ionescu/oh-my-zsh)
* [Solarized](http://ethanschoonover.com/solarized) color scheme
* [Solarized dircolors](https://github.com/seebi/dircolors-solarized)


### Vim

* [NeoBundle](https://github.com/Shougo/neobundle.vim) to manage the numerous
other Vim plugins (see [plugin.vim](https://github.com/poorlilrichboy/dotfiles/blob/master/vim/plugin.vim))
* My [snipmate-snippets](https://github.com/poorlilrichboy/snipmate-snippets)
* My [dochub.vim](https://github.com/poorlilrichboy/vim-dochub) plugin

## TODO
* Add vim cheatsheet.
* Test dotfiles on linux, especially vimrc and zshrc.
