#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#################################################
# Customize to your needs...
#
# The following concerns are handled thru Prezto and other dotfiles not here:
#   * PATH for Homebrew (~/.zshenv)
#   * rbenv init (~/.zprezto/module/ruby/)
#   * PATH for Homebrew'd Python's `install-scripts` (~/.zprezto/module/python/)
#
#################################################

# Don't beep!
unsetopt beep

# The 'ls' family overrides.
alias l='ls -lh'         # List human readable sizes.
alias ll='ls -1A'        # List in one column.
alias lr='l -R'          # List recursively.
alias la='l -A'          # List hidden files.
alias lp='la | "$PAGER"' # List through pager.
alias lx='l -XB'         # List sorted by extension.
alias lk='l -Sr'         # List sorted by size, largest last.
alias lt='l -tr'         # List sorted by date, most recent last.
alias lc='lt -c'         # List sorted by date, most recent last, show change time.
alias lu='lt -u'         # List sorted by date, most recent last, show access time.
alias sl='ls'            # I often screw this up.

# List files after changing directories
function chpwd { l }

# fasd
alias j='fasd_cd -d'         # cd AKA jump to directory
alias jj='fasd_cd -d -i'     # cd with interactive selection
alias v='fasd -f -e vim'     # open file in vim
alias vv='fasd -f -i -e vim' # open file in vim with interactive selection
alias f='fasd -f'            # file
alias ff='fasd -sif'         # interactive file selection
alias d='fasd -d'            # directory
alias dd='fasd -sid'         # interactive directory selection

# meta alias
alias aliasgrep='alias | grep $(echo $1)'

# Most used commands according to history-stat
# Bundler
alias b='bundle'
alias bi='bundle install'
alias bo='bundle outdated'
# Git
alias g='git'
# Rails - other alias `ror*`
alias r='rails'
# Vim
alias vi='vim'

# Edit dotfiles
alias edots='vim ~/.dotfiles'
alias eprezto='vim ~/.zprezto'

# Memcached
alias memcachedstart='memcached -p 11211 &'

# MySQL
#alias mysqlstart='mysqld_safe &'
#alias mysqlstop='mysqladmin -u root shutdown'

# Postgresql
alias postgresstart=' open -a Postgres'
#alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start &'
#alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# ps | grep
alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'

# Mac OS X
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'

# MondoDB
alias mongodbstart=' mongo: mongod --dbpath=/usr/local/var/mongodb -vv'
#alias mongodbstart='mongod run --config /usr/local/etc/mongod.conf'

# Misc.
alias gf='fg'            # I often screw this up.

# Put Bundler binstubs at the front of $PATH
PATH=.bundle/binstubs:$PATH

# Use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

