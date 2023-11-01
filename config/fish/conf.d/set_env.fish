# TODO
# * node
# * npm?
# * nvm
# * rails?
# * fzf

# Set language
set -gx LANG "en_US.UTF-8"

# Set preferred editor, etc.
set -gx BROWSER "open -a Safari"
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "less"

# Setup Homebrew (output from `brew shellenv`)
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
! set -q PATH; and set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Setup tmuxifier layouts
set -gx TMUXIFIER_LAYOUT_PATH "$HOME/.tmuxifier-layouts"

# Init tmuxifier
eval (tmuxifier init - fish)

# Init rbenv
rbenv init - fish | source

# Setup fasd
fasd_setup

# Exports
#################################################
#
# Enable/configure other utils
#
#################################################

# # fzf
# _gen_fzf_default_opts
# # Use `fd` for find, to respect .gitignore
# export FZF_DEFAULT_COMMAND='fd --type f'
# # Enable fzf auto-completion
# # * assumes /usr/local/opt/fzf/install was used to install
# # * CTRL-T will trigger context-aware fuzzy completion, instead of **<TAB>
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
#
# # npm
# # Set up NPM_TOKEN if .npmrc exists
# if [ -f ~/.npmrc ]; then
# export NPM_TOKEN=`sed -n -e '/_authToken/ s/.*\= *//p' ~/.npmrc`
# fi
#
# # nvm
# # export NVM_DIR="$HOME/.nvm"
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# # Rails
# export DISABLE_SPRING=1
# # Put Bundler binstubs at the front of $PATH
# # PATH=./bin:$PATH
#
# #
# # Less
# #
#
# # Set the default Less options.
# # Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# # Remove -X to enable it.
# # Options:
# # -g or --hilite-search
# # -i or --ignore-case
# # -M or --LONG-PROMPT - Verbose prompt at bottom.
# # -R or --RAW-CONTROL-CHARS - Causes "raw" control characters to be displayed.
# # -S or --chop-long-lines
# # -w or --hilite-unread - Temporarily  highlights the first "new" line after a forward movement of a full page.
# # -X or --no-init - Disables sending the termcap initialization and deinitialization strings to the terminal.
# # -[z]n or --window=n - For example, if the screen is 24 lines, -z-4 sets the scrolling window to 20 lines.
# if [[ -z "$LESS" ]]; then
# export LESS='-g -i -M -R -S -w -X -z-4'
# fi
#
# # Set the Less input preprocessor.
# # Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
# if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
# export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
# fi
