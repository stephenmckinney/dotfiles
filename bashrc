#!/bin/bash
# Minimal bash config for Claude Code

# Language
export LANG="en_US.UTF-8"

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man:$MANPATH"
export INFOPATH="/opt/homebrew/share/info:$INFOPATH"

# Ruby/Rails
export DISABLE_SPRING=1
export MINITEST_REPORTER="ProgressReporter"

# NPM Token
[ -f ~/.npmrc ] && export NPM_TOKEN=$(sed -n '/_authToken/ s/.*= *//p' ~/.npmrc)

# Editor/Pager
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export LESS="-g -i -M -R -S -w -X -z-4"

# NVM
export NVM_DIR="$HOME/.nvm"
if [ -f "$NVM_DIR/alias/default" ]; then
  DEFAULT_ALIAS=$(cat "$NVM_DIR/alias/default")
  if [ "$DEFAULT_ALIAS" = "node" ]; then
    LATEST=$(ls -1 "$NVM_DIR/versions/node" | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -1)
    export PATH="$NVM_DIR/versions/node/$LATEST/bin:$PATH"
  else
    export PATH="$NVM_DIR/versions/node/$DEFAULT_ALIAS/bin:$PATH"
  fi
fi

# rbenv
eval "$(rbenv init - bash 2>/dev/null)" 2>/dev/null || true

