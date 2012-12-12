# my dotfiles

Configures ack, gem, git, irb, iterm2, pry, rails, rspec, rvm,
tmux, zsh with a focus on Ruby and Rails development. Solarized **ALL** the
things.

These are my personal dotfiles, but it is also a good starting point for
anyone interested in tmux + zsh + vim as a Ruby and Rails IDE on OS X. See
[vimfiles](https://github.com/stephenmckinney/vimfiles) for more.

## Install

    git clone git://github.com/stephenmckinney/dotfiles ~/.dotfiles
    cd ~/.dotfiles && rake install

> Zsh troubles? See [Prezto](https://github.com/stephenmckinney/prezto).

### Install Requirements and Dependencies on Mac OS X

#### Brews

Install [Homebrew](http://mxcl.github.com/homebrew/), then:

    brew install zsh git mercurial hub coreutils fasd tmux reattach-to-user-namespace wget tree ack the_silver_searcher

#### Rubies & Pythons

Install [RVM](http://beginrescueend.com/) and [Homebrew'd Python](https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python).

#### Gems

    gem install pry pry-doc pry-nav awesome_print tmuxinator pomo


> **Preventing RSI:**
>
> Remap `Caps Lock` to act like `Control` and `ESC` at the same time!
>
> Just do this...you'll thank me later.
>
> * Download and install [KeyRemap4MacBook](http://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html)
> * Open the Keyboard preference pane. Click on **Modifier Keys** in the
> bottom right corner and **remap Caps Lock to Control**.
> (*Note: You have to do this remapping separately for each keyboard, or else it won't work on any peripherally attached keyboard.*)
> * Open the KeyRemap4MacBook Preferences and find the drop-down for
> **Change Control_L Key (Left Control)**. Expand this drop-down and
> check the box for **Control_L to Control_L (+ When you type Control_L only, send Escape)**.
>
> Now when you hit `Caps Lock` alone, it will act as `ESC`, meaning you can
> use it as `ESC` in Vim, but if you hold down `Caps Lock` and hit another
> key (like most Emacs keybindings), it will act as if you hit `Control`
> plus that other key.


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

* Open Preferences.
* In **General** tab, check **Load preferences from a user-defined folder or URL**.
* Paste `/Users/smckinney/.dotfiles/iterm2` into the text field.
* Import Solarized Dark and Solarized Light itermcolors.

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

### ri/rdoc Documentation

In order to conserve space, RVM does not automatically generate and
install each Ruby's ri / rdoc documentation.

Provided you have not cleaned up the extracted sources for all currently
installed Rubies by executing 'rvm cleanup all' then you can install the
docs for **all** currently installed Rubies by executing:

    rvm all do rvm docs generate all

See [RVM docs](https://rvm.io/rubies/docs) for further details.

## Moar

Go dumpster diving for more dotfile goodness:

* [tpope's dotfiles](https://github.com/tpope/tpope)
* [garybernhardt dotfiles](https://github.com/garybernhardt/dotfiles)
* [sjl dotfiles](https://github.com/sjl/dotfiles)
* [skwp dotfiles](https://github.com/skwp/dotfiles)

## TODO

* Test dotfiles on linux.
