# my dotfiles

Configures ack, bash, gem, git, irb, pry, rails, rspec, rvm, vim, zsh...for use at home and on the road. 


## Install

    git clone git://github.com/poorlilrichboy/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install


## Stay Updated

To update Vim plugins:

    cd ~/.dotfiles
    ruby vim/update_plugins.rb

## Other Repos

### Zsh

Uses [oh my zsh](https://github.com/robbyrussell/oh-my-zsh).

### Vim

#### Plugins

Uses many [Vim plugins](https://github.com/poorlilrichboy/dotfiles/blob/master/vim/update_bundles.rb).

#### Snipmate Snippets

Uses my [snipmate-snippets](https://github.com/poorlilrichboy/snipmate-snippets).

## TODO
* Move from pathogen to vundle, once 'fast' branch is merged into
  master.
* Add install of vundle and creation of vim/bundle directory to
  Rakefile and delete bash script.
* Update all zsh files to work with ohmyzsh 2.0, once that is merged
  into master.
* Add vim cheatsheet.
* Remove bash dir.
* Test .dotfiles on linux, especially vimrc.
