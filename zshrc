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
#   * PATH for Homebrew'd Python's `install-scripts` (~/prezto/module/python)
#   * PATH for RVM (~/prezto/module/ruby)
#   * Loading RVM into a shell session for Pow, etc. (~/.zshenv)
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

# Git
alias g='git'

# Rails
alias r='rails'

# Use vim
alias vi='vim'
alias v='vim'

# Edit dotfiles
alias edots='vim ~/.dotfiles'
alias eomz='vim ~/.oh-my-zsh'

# Memcached
alias memcachedstart='memcached -p 11211 &'

# MySQL
alias mysqlstart='mysqld_safe &'
alias mysqlstop='mysqladmin -u root shutdown'

# Postgresql
alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start &'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# MondoDB
alias mongodbstart='mongod run --config /usr/local/etc/mongod.conf'

# Misc.
alias gf='fg'            # I often screw this up.

# Use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

