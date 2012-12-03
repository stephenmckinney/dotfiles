#
# Defines environment variables.
#
# Authors:
#   Steve McKinney <stevemckinney@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# Options:
# -F or --quit-if-one-screen
# -g or --hilite-search
# -i or --ignore-case
# -M or --LONG-PROMPT - Verbose prompt at bottom.
# -R or --RAW-CONTROL-CHARS - Causes "raw" control characters to be displayed.
# -S or --chop-long-lines
# -w or --hilite-unread - Temporarily  highlights the first "new" line after a forward movement of a full page.
# -X or --no-init - Disables sending the termcap initialization and deinitialization strings to the terminal.
# -[z]n or --window=n - For example, if the screen is 24 lines, -z-4 sets the scrolling window to 20 lines.
export LESS='-F -g -i -M -R -S -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that info searches for manuals.
infopath=(
  /usr/local/share/info
  /usr/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
  manpath+=($(<$path_file))
done
unset path_file

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/local/mysql/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done
unset path_file

#
# Temporary Files
#

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
