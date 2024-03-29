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
function cd() { builtin cd $@ && l; }

alias gf='fg'            # I often screw this up.

# meta alias
alias aliasgrep='alias | grep $(echo $1)'

# ps | grep
alias psgrep='ps -e -o pid,command | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'

# Git
alias g='git'
