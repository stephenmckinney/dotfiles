# my dotfiles

Configures ack, bash, gem, git, irb, pry, rails, rspec, rvm, vim, zsh...for use at home and on the road. 


## Install

    git clone git://github.com/poorlilrichboy/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install


## Stay Updated

To compile [MacVim](https://github.com/b4winckler/macvim) from master branch with RVM Ruby support:

    cd ~/.dotfiles
    ruby vim/update_macvim.rb

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
