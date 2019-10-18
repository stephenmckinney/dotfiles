#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Notes on ZSH Startup Files
# There are five startup files that zsh will read commands from:
#
# $ZDOTDIR/.zshenv
# $ZDOTDIR/.zprofile
# $ZDOTDIR/.zshrc
# $ZDOTDIR/.zlogin
# $ZDOTDIR/.zlogout
# If ZDOTDIR is not set, then the value of HOME is used; this is the usual case.
#
# `.zshenv' is sourced on all invocations of the shell, unless the -f option is set. It should contain commands to set the command search path, plus other important environment variables. `.zshenv' should not contain commands that produce output or assume the shell is attached to a tty.
#
# `.zshrc' is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.
#
# `.zlogin' is sourced in login shells. It should contain commands that should be executed only in login shells. `.zlogout' is sourced when login shells exit.
#
# `.zprofile' is similar to `.zlogin', except that it is sourced before `.zshrc'. `.zprofile' is meant as an alternative to `.zlogin' for ksh fans; the two are not intended to be used together, although this could certainly be done if desired. `.zlogin' is not the place for alias definitions, options, environment variable settings, etc.; as a general rule, it should not change the shell environment at all. Rather, it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#################################################
# Customize to your needs...
#
# The following concerns are handled thru Prezto and other dotfiles not here:
#   * PATH for Homebrew (~/.zprofile)
#   * rbenv init (~/.zprezto/module/ruby/)
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

# New utilities Aug 31, 2018
alias cat='bat --theme=TwoDark'
alias help='tldr'
alias ping='prettyping --nolegend'
alias noise='play -c 2 -n synth brownnoise' # brew install sox

# fasd
alias a='fasd -a'            # any
alias j='fasd_cd -d'         # cd AKA jump to directory
alias jj='fasd_cd -d -i'     # cd with interactive selection
# alias v='fasd -f -e vim'     # open file in vim
# alias vv='fasd -f -i -e vim' # open file in vim with interactive selection
alias f='fasd -f'            # file
alias ff='fasd -sif'         # interactive file selection
alias d='fasd -d'            # directory
alias dd='fasd -sid'         # interactive directory selection

# meta alias
alias aliasgrep='alias | grep $(echo $1)'

# Most used commands according to history-stat

# Bundler
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle outdated'

# Docker
alias dc='docker-compose'
alias dcn='NODE_ENV=localdev docker-compose'
alias dcr='docker-compose run --rm app'
alias dcnr='NODE_ENV=localdev docker-compose run --rm app'
alias docker-rm-all-not-just-this-dir-including-images='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q) --force; docker rmi $(docker images -a -q) --force; docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)'
alias docker-rm-all-not-just-this-dir='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)'
alias docker-install-ssh-exec='bash <(curl -s https://raw.githubusercontent.com/voxmedia/docker_base_images/master/bin/start-docker-ssh-exec)'

# Foreman
# alias f='bundle exec foreman start'

# Git
alias g='git'
alias gbpurgedryrun='git branch --merged | grep -v "\*" | grep -v "master"'
alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'

# Kubernetes
alias k='kubectl'
alias h='helm'

# Rails - other alias `ror*`
alias r='bin/rails'
alias spring='nocorrect spring'

# Rubocop
alias ru='bundle exec rubocop'

# Vim
alias v='vim'
alias vi='vim'

# Edit dotfiles
alias edots='vim ~/.dotfiles'
alias eprezto='vim ~/.zprezto'

# Memcached
alias memcachedstart='memcached -p 11211 &'

# MySQL
# alias mysqlstart='mysqld_safe &'
# alias mysqlstop='mysqladmin -u root shutdown'

# Postgresql
# alias postgresstart=' open -a Postgres'
alias postgresstart='postgres -D /usr/local/var/postgres &'
# alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start &'
# alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# ps | grep
alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'

# Mac OS X
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
# Lock the screen (when going AFK)
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# MondoDB
# alias mongodbstart=' mongo: mongod --dbpath=/usr/local/var/mongodb -vv'
# alias mongodbstart='mongod run --config /usr/local/etc/mongod.conf'

# Misc.
alias gf='fg'            # I often screw this up.

# Tmuxifier
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmuxifier-layouts"
eval "$(tmuxifier init -)"
alias mux='tmuxifier load-session'

# Kubernetes
export KUBECONFIG=~/.kube/config

# Git + Hub
# FIXME: Disabled due to broken git zsh completion
# eval "$(hub alias -s)"

# Put Bundler binstubs at the front of $PATH
# PATH=./bin:$PATH

# Use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
