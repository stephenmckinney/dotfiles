# Minimal zshenv - environment variables only
# This file is sourced on all shell invocations

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs
path=(
  ~/.bin
  ~/.tmuxifier/bin
  ./bin
  /usr/local/opt/python/libexec/bin
  /opt/homebrew/{bin,sbin}
  $path
)

# Browser (macOS)
if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Language
export LANG='en_US.UTF-8'

# Less options
export LESS='-g -i -M -R -S -w -X -z-4'

# Set up lesspipe if available
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi