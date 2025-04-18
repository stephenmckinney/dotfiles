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

# Grep'ping stuff
alias aliasgrep='alias | grep $(echo $1)'
alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'

# Git
alias g='git'
alias gbpurgedryrun='git branch --merged | grep -v "\*" | grep -v "master"'
alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'

# Heroku
alias h='heroku'

# Rails
alias r='be rails'

# Rubocop
alias ru='bundle exec rubocop'

# Vim
alias n='nvim'
alias v='n'
alias vi='n'

# Edit dotfiles
alias edots='vim ~/.dotfiles'
alias eprezto='vim ~/.zprezto'


# Mac OS X
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
# Lock the screen (when going AFK)
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

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

# npm
# Set up NPM_TOKEN if .npmrc exists
if [ -f ~/.npmrc ]; then
  export NPM_TOKEN=`sed -n -e '/_authToken/ s/.*\= *//p' ~/.npmrc`
fi

# nvm
# export NVM_DIR="$HOME/.nvm"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

# Rails
export DISABLE_SPRING=1

# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc
