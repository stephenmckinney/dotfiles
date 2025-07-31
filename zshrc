# Minimal zsh configuration
# A simple, maintainable setup without frameworks

# History configuration
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY          # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicates first when trimming
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_SPACE         # Don't record entries starting with space
setopt HIST_VERIFY               # Don't execute immediately on history expansion
setopt SHARE_HISTORY             # Share history between sessions

# Directory options
setopt AUTO_CD                   # cd into directory by typing name
setopt AUTO_PUSHD                # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates
setopt PUSHD_MINUS               # Exchange + and - meanings

# Completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}     # Use LS_COLORS

# Key bindings (vi mode)
bindkey -v
bindkey '^R' history-incremental-search-backward

# Reduce key timeout (for faster vi mode switching)
export KEYTIMEOUT=1

# Don't beep!
unsetopt beep

#################################################
# Aliases
#################################################

# The 'ls' family
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

# Modern CLI tools
alias cat='bat --theme=TwoDark'
alias help='tldr'
alias ping='prettyping --nolegend'

# Development aliases
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle outdated'
alias g='git'
alias h='heroku'
alias r='be rails'
alias ru='bundle exec rubocop'
alias n='nvim'
alias v='n'
alias vi='n'

# Utility aliases
alias gf='fg'            # I often screw this up.

# Mac OS X
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

#################################################
# Functions
#################################################

# List files after changing directories
function chpwd { l }

#################################################
# External tools configuration
#################################################

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--height 40% --reverse --border"

# Enable fzf key bindings if available
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide - modern replacement for fasd/autojump
eval "$(zoxide init zsh)"
alias j='z'  # Keep the same muscle memory

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # Load nvm but don't use it yet

# npm
if [ -f ~/.npmrc ]; then
  export NPM_TOKEN=`sed -n -e '/_authToken/ s/.*\= *//p' ~/.npmrc`
fi

# Rails
export DISABLE_SPRING=1

# Kubernetes
export KUBECONFIG=~/.kube/config

# Starship prompt
eval "$(starship init zsh)"

# Load local machine-specific settings
[[ -f ~/.localrc ]] && . ~/.localrc