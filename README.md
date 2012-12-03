# my dotfiles

Configures ack, gem, git, irb, iterm2, pry, rails, rspec, rvm,
tmux, zsh with a focus on Ruby and Rails development. Solarized **ALL** the
things.

## Install

    git clone git://github.com/stephenmckinney/dotfiles ~/.dotfiles
    cd ~/.dotfiles && rake install
    git clone --recursive git://github.com/stephenmckinney/prezto ~/.zprezto
    cd ~/.zprezto && git co my-customizations-and-theme

Follow further instructions from [Prezto](https://github.com/stephenmckinney/prezto).

### Install Requirements and Dependencies on Mac OS X

#### Brews

Install [Homebrew](http://mxcl.github.com/homebrew/), then:

    brew install zsh git mercurial hub coreutils fasd tmux reattach-to-user-namespace wget tree ack

#### Rubies & Pythons

Install [RVM](http://beginrescueend.com/) and [Homebrew'd Python](https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python)

#### Gems

    gem install pry pry-doc pry-nav awesome_print tmuxinator

### Install Dependencies on Linux

TBD

## Stay Updated

Merge updates from prezto/sorin/master and rebase changes.

## Requirements and Dependencies

These are installed by following the above.

### Required

* [Zsh](http://www.zsh.org/) 4.3.10 or greater
* [Tmux](http://tmux.sourceforge.net/)
* [Git](http://git-scm.com/)

### Optional

#### iTerm2

* Open Preferences
* In General tab, check `Load preferences from a user-defined folder or URL`
* Paste `/Users/smckinney/.dotfiles/iterm2` into the text field
* Import Solarized Dark and Solarized Light itermcolors

#### Zsh
* My [fork](https://github.com/stephenmckinney/prezto) of [Prezto](https://github.com/sorin-ionescu/prezto)
* [fasd](https://github.com/clvv/fasd) gives you quick access to frequent/recent files and directories
* [GNU Coreutils](http://www.gnu.org/software/coreutils/) is required to use Solarized dircolors

#### Tmux
* [tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) for accessing the Mac OS X pasteboard in tmux sessions

#### Git
* [Hub](https://github.com/defunkt/hub) adds Github syntax sugar to Git

#### Pry
* [Pry-nav](https://github.com/nixme/pry-nav) teaches Pry about step, next, and continue to create a simple debugger
* [Awesome Print](https://github.com/michaeldv/awesome_print) pretty prints Ruby objects in full color with proper indentation

## TODO

* Test dotfiles on linux.
