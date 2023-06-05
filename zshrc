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
# The following are configured NOT in .zshrc:
#   * Homebrew - /usr/local/bin added to PATH in .zprofile
#   * fasd - initialized in .zprezto/modules/fasd/init.zsh
#
#################################################

# Don't beep!
unsetopt beep

# The 'ls' family overrides.
export LS_COLORS="$(vivid generate nightfox-terafox)"
alias ls='gls --color'
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
alias j='fasd_cd -d'         # cd AKA jump to directory
# alias a='fasd -a'            # any
# alias jj='fasd_cd -d -i'     # cd with interactive selection
# alias v='fasd -f -e vim'     # open file in vim
# alias vv='fasd -f -i -e vim' # open file in vim with interactive selection
# alias f='fasd -f'            # file
# alias ff='fasd -sif'         # interactive file selection
# alias d='fasd -d'            # directory
# alias dd='fasd -sid'         # interactive directory selection

# meta alias
alias aliasgrep='alias | grep $(echo $1)'

#################################################
#
# Most used commands according to history-stat
#
#################################################

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

# Heroku
alias h='heroku'

# Kubernetes
alias k='kubectl'
# alias h='helm'

# Rails
alias r='bin/rails'

# Rubocop
alias ru='bundle exec rubocop'

# Vim
alias v='vim .'
alias vi='vim'

# Edit dotfiles
alias edots='vim ~/.dotfiles'
alias eprezto='vim ~/.zprezto'

# Memcached
# alias memcachedstart='memcached -p 11211 &'

# MySQL
# alias mysqlstart='mysqld_safe &'
# alias mysqlstop='mysqladmin -u root shutdown'

# Postgresql
# alias postgresstart=' open -a Postgres'
# alias postgresstart='postgres -D /usr/local/var/postgres &'
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

#################################################
#
# Enable/configure other utils
#
#################################################

# fzf
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color 16,hl:$cyan,hl+:$blue,fg+:$base2
    --color pointer:$orange,marker:$magenta
    --color prompt:$cyan,info:$yellow,spinner:$yellow
  "
}
_gen_fzf_default_opts
# Use `fd` for find, to respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
# Enable fzf auto-completion
# * assumes /usr/local/opt/fzf/install was used to install
# * CTRL-T will trigger context-aware fuzzy completion, instead of **<TAB>
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# Kubernetes
export KUBECONFIG=~/.kube/config

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

# Rails
export DISABLE_SPRING=1
# Put Bundler binstubs at the front of $PATH
# PATH=./bin:$PATH

# Slack CLI
alias slack-meeting='slack status edit --text "In meetings" --emoji :virtual-meeting: && slack presence active && slack snooze start'
alias slack-lunch='slack status edit --text "lunch [back at $(date -v +30M +"%l:%M %p")]" --emoji :taco: && slack presence away && slack snooze end'
alias slack-focus='slack status edit --text "Heads down, Slack delayed" --emoji :heads-down: && slack presence active && slack snooze start'
alias slack-back='slack status clear && slack presence active && slack snooze end'
# alias slack-PERSON='slack chat send "hey <https://docs.google.com/TKTK|FILENAME>" @PERSON'

# Tmuxifier
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmuxifier-layouts"
eval "$(tmuxifier init -)"
alias mux='tmuxifier load-session'

# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
