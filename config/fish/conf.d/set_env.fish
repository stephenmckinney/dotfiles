# TODO from zsh
# * node
# * npm for work?
# * nvm
# * fzf
# * bundler binstubs

# Disable fish greeting
set -g fish_greeting

# Set language
set -gx LANG "en_US.UTF-8"

# Set preferred editor, etc.
set -gx BROWSER "open -a Safari"
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER "less"

# Set the default Less options.
# -g or --hilite-search
# -i or --ignore-case
# -M or --LONG-PROMPT - Verbose prompt at bottom.
# -R or --RAW-CONTROL-CHARS - Causes "raw" control characters to be displayed.
# -S or --chop-long-lines
# -w or --hilite-unread - Temporarily  highlights the first "new" line after a forward movement of a full page.
# -X or --no-init - Dsables mouse-wheel scrolling. Disables sending the termcap init/deinit strings to the terminal.
# -[z]n or --window=n - For example, if the screen is 24 lines, -z-4 sets the scrolling window to 20 lines.
set -gx LESS "-g -i -M -R -S -w -X -z-4"

# Setup Homebrew (output from `brew shellenv`, but without set PATH)
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Setup tmuxifier
eval (tmuxifier init - fish)
set -gx TMUXIFIER_LAYOUT_PATH "$HOME/.tmuxifier-layouts"

# Setup fasd
fasd_setup

# Disable spring in Rails
set -gx DISABLE_SPRING 1
