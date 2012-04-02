#
# Sets Oh My Zsh options.
#
# Authors:
#   Steve McKinney <stevemckinney@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:editor' dot-expansion 'yes'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' module 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' function 'zargs' 'zmv'

# Set the plugins to load (browse plugins).
zstyle ':omz:load' plugin \
  'history-substring-search' \
  'osx' \
  'git' \
  'ruby' \
  'rails' \
  'python'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:prompt' theme 'poorlilrichboy'

#################################################
# A hack to get environment.zsh to use GNU
# coreutils for 'ls' and 'dircolors'
#################################################
alias 'dircolors'='gdircolors'
alias 'ls'='gls'

# This will make you shout: OH MY ZSHELL!
source "$HOME/.oh-my-zsh/init.zsh"

#################################################
# Customize to your needs...
#################################################

# The 'ls' Familiy overrides.
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

# TODO Replace d,c,w,h with fasd plugin

# List previous `chpwd`s.
alias d='dirs -v'
# Changing directory to code
c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

# Changing directory to work projects
w() { cd ~/code/web/threespot/$1; }
_w() { _files -W ~/code/web/threespot -/; }
compdef _w w

# Changing directory to home
h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

# Use vim
alias vi='vim' #use vim

# Edit dotfiles
alias edots='vim ~/.dotfiles'

# Memcached
alias memcachedstart='memcached -p 11211 &'

# MySQL
alias mysqlstart='/usr/local/Cellar/mysql/5.5.19/bin/mysqld_safe &'
alias mysqlstop='/usr/local/Cellar/mysql/5.5.19/bin/mysqladmin -u root -p shutdown'

# Postgresql
alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start &'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

