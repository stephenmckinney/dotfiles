#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Steve McKinney <steve.mckinney@gmail.com>
#

#
# Browser
#

if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

if [[ -z "$EDITOR" ]]; then
  export EDITOR='vim'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='vim'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  ~/.bin
  ~/.tmuxifier/bin
  ./bin
  /usr/local/opt/python/libexec/bin
  /opt/homebrew/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
# Options:
# -g or --hilite-search
# -i or --ignore-case
# -M or --LONG-PROMPT - Verbose prompt at bottom.
# -R or --RAW-CONTROL-CHARS - Causes "raw" control characters to be displayed.
# -S or --chop-long-lines
# -w or --hilite-unread - Temporarily  highlights the first "new" line after a forward movement of a full page.
# -X or --no-init - Disables sending the termcap initialization and deinitialization strings to the terminal.
# -[z]n or --window=n - For example, if the screen is 24 lines, -z-4 sets the scrolling window to 20 lines.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
