# my dotfiles

Configures ack, gem, git, irb, iterm2, pry, rails, rspec, rbenv,
tmux, zsh with a focus on Ruby and Rails development. Solarized **ALL** the
things.

These are my personal dotfiles, but it is also a good starting point for
anyone interested in tmux + zsh + vim as a Ruby and Rails IDE on OS X. See
[vimfiles](https://github.com/stephenmckinney/vimfiles) for more.

## Install dotfiles

```shell
git clone --recursive git://github.com/stephenmckinney/dotfiles ~/.dotfiles
cd ~/.dotfiles && rake install
```

> Zsh troubles? See [Prezto](https://github.com/stephenmckinney/prezto).

## Random stuff to grab from previous computer

* copy over `~/.localrc`.
* copy over `~/.zhistory` to aid `fasd`.
* generate and add new ssh keys for git/github. remove the keys from the
  previous computer.

## Install Requirements and Dependencies on Mac OS X

### Brews

Install [Homebrew](http://mxcl.github.com/homebrew/), then:

```shell
brew update
brew install zsh \
git mercurial hub gist \
tmux \
coreutils fasd wget tree trash \
vim ctags ack the_silver_searcher
```

### Rubies & Pythons

* Rubies: `brew install rbenv ruby-build`
* Pythons: See [Homebrew and Python](https://docs.brew.sh/Homebrew-and-Python).

### Heroku Toolbelt

Install [Heroku Toolbelt](https://toolbelt.heroku.com/).

### iTerm2 Preferences

* Open Preferences.
* In **General** tab, check **Load preferences from a user-defined folder or URL**.
* Paste `/Users/smckinney/.dotfiles/iterm2` into the text field.
* Import Solarized Dark and Solarized Light itermcolors (this should be
  handled in the previous step).
* Import fonts from https://github.com/powerline/fonts

### Remap `Caps Lock` to act like `Control` and `ESC` at the same time

* Install [Karabiner](https://github.com/tekezo/Karabiner-Elements)
* Karabiner should load configuration from [karabiner.json](config/karabiner/karabiner.json).

Now when you hit `Caps Lock` alone, it will act as `ESC`, meaning you can
use it as `ESC` in Vim, but if you hold down `Caps Lock` and hit another
key (like most Emacs keybindings), it will act as if you hit `Control`
plus that other key. Bonus: `CMD` + `Caps Lock` is used in iTerm as a
Visor hotkey.


## Stay Updated

Merge updates from prezto/sorin/master and rebase changes.

## Requirements and Dependencies

These are installed by following the above.

### Required

* [Zsh](http://www.zsh.org/) 4.3.10 or greater
* [Tmux](http://tmux.sourceforge.net/)
* [Git](http://git-scm.com/)

### Optional

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

## Moar

Go dumpster diving for more dotfile goodness:

* [tpope's dotfiles](https://github.com/tpope/tpope)
* [garybernhardt dotfiles](https://github.com/garybernhardt/dotfiles)
* [sjl dotfiles](https://github.com/sjl/dotfiles)
* [skwp dotfiles](https://github.com/skwp/dotfiles)

## TODO

* Test dotfiles on linux.
