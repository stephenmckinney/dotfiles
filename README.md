# my dotfiles

Configures ack, gem, git, irb, pry, rails, rspec, rvm, vim, zsh...for use at home and on the road. 

## Install

    brew install git ack ctags hub coreutils
    brew install https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb
    git clone git://github.com/poorlilrichboy/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install

To install Vim plugins, open vim and run `:NeoBundleInstall`.

## Stay Updated

To update Zsh: TBD by OMZ 2.0

To update Vim plugins, open vim and run `:NeoBundleUpdate`

## Dependencies

### Hard
* [Vim](http://www.vim.org/) or [MacVim](https://github.com/b4winckler/macvim) 7.3 or greater
* [Git](http://git-scm.com/) for Zsh and Vim
* [Ack](http://betterthangrep.com/) for Zsh and Vim
* [Ctags](http://ctags.sourceforge.net/) for Vim

### Soft
* [Hub](https://github.com/defunkt/hub) is only necessary for Git syntax sugar
* [GNU Coreutils](http://www.gnu.org/software/coreutils/) are only necessary for Solarized dircolors

## Includes

### Zsh

* Includes [sorin-ionescu](https://github.com/sorin-ionescu)'s fork of [oh my zsh](https://github.com/sorin-ionescu/oh-my-zsh)
* Includes [Solarized dircolors](https://github.com/seebi/dircolors-solarized)
* OMZ theme expects terminal to use [Solarized](http://ethanschoonover.com/solarized) color scheme

### Vim

* Includes [NeoBundle](https://github.com/Shougo/neobundle.vim) to manage the many
other Vim plugins (see [plugin.vim](https://github.com/poorlilrichboy/dotfiles/blob/master/vim/plugin.vim))
* Includes my [snipmate-snippets](https://github.com/poorlilrichboy/snipmate-snippets)

## TODO
* Add vim cheatsheet.
* Test dotfiles on linux, especially vimrc.
* Add [fasd](https://github.com/clvv/fasd) zsh plugin.
