# my dotfiles

Configures ack, gem, git, irb, pry, rails, rspec, rvm, tmux, vim, zsh...for use at home and on the road.


## Install

    git clone git://github.com/stephenmckinney/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install
    git clone --recursive git://github.com/stephenmckinney/oh-my-zsh ~/.oh-my-zsh
    cd ~/.oh-my-zsh
    git co my-customizations-and-theme

Follow further instructions from [Oh My Zsh](https://github.com/sorin-ionescu/oh-my-zsh).

### Install Requirements and Dependencies on Mac OS X

#### Aside: A Nice Vim-Emacs Hack

[Remap Caps Lock to act like Control and ESC](http://www.quora.com/How-can-I-remap-Caps-Lock-in-Mac-OS-X-so-that-it-acts-like-Control-in-Emacs-but-acts-like-Escape-in-Vim)

#### Brews

Install [Homebrew](http://mxcl.github.com/homebrew/), then:

    brew install git mercurial ack wget ctags hub coreutils fasd tmux reattach-to-user-namespace

Install terminal Vim with Ruby support:

    brew install https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb

#### Rubies & Pythons

[RVM](http://beginrescueend.com/) and [Homebrew'd Python](https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python)

#### Gems

    gem install pry pry-doc pry-nav awesome_print tmuxinator

#### Vim plugins

To install Vim plugins, open Vim and run `:NeoBundleInstall`.

### Install Dependencies on Linux

TBD

## Stay Updated

### Zsh

Merge updates from sorin/master and rebase changes.

### Vim

Open Vim and run `:NeoBundleUpdate`


## Requirements and Dependencies

These are installed by following the above.

### Required

* [Zsh](http://www.zsh.org/) 4.3.10 or greater
* [Tmux](http://tmux.sourceforge.net/)
* [Git](http://git-scm.com/)
* [Vim](http://www.vim.org/) or [MacVim](https://github.com/b4winckler/macvim) 7.3 or greater

### Optional

#### Zsh
* My [fork](https://github.com/stephenmckinney/oh-my-zsh) of sorin-ionescu's [Oh My Zsh](https://github.com/sorin-ionescu/oh-my-zsh)
* [fasd](https://github.com/clvv/fasd) gives you quick access to frequent/recent files and directories
* [GNU Coreutils](http://www.gnu.org/software/coreutils/) is required to use Solarized dircolors

#### Tmux
* [tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) for accessing the Mac OS X pasteboard in tmux sessions

#### Git
* [Hub](https://github.com/defunkt/hub) adds Github syntax sugar to Git

#### Vim
* [Ack](http://betterthangrep.com/) is required for [Ack.vim](https://github.com/mileszs/ack.vim)
* [Exuberant Ctags](http://ctags.sourceforge.net/) is required for [Tagbar](http://majutsushi.github.com/tagbar/)

#### Pry
* [Pry-nav](https://github.com/nixme/pry-nav) teaches Pry about step, next, and continue to create a simple debugger
* [Awesome Print](https://github.com/michaeldv/awesome_print) pretty prints Ruby objects in full color with proper indentation


## Makes Use Of

These are included within the repo.

### Zsh

* [Solarized](http://ethanschoonover.com/solarized) color scheme
* [Solarized dircolors](https://github.com/seebi/dircolors-solarized)


### Vim

* [NeoBundle](https://github.com/Shougo/neobundle.vim) to manage plugins
* Many [other Vim plugins](https://github.com/stephenmckinney/dotfiles/blob/master/vim/plugin.vim),
  including my [snipmate-snippets](https://github.com/stephenmckinney/snipmate-snippets)
  and [dochub.vim](https://github.com/stephenmckinney/vim-dochub)

## TODO
* Add vim cheatsheet.
* Test dotfiles on linux, especially vimrc and zshrc.
