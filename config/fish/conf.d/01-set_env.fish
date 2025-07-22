# Set language
set -gx LANG "en_US.UTF-8"

# Setup Homebrew (output from `brew shellenv`, but without set PATH)
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Ruby/Rails env vars
set -gx DISABLE_SPRING 1 # Disable spring in Rails
set -gx MINITEST_REPORTER "ProgressReporter" # Set minitest reporter

# Configure Access to the Private work NPM modules
if test -f ~/.npmrc
  set -gx NPM_TOKEN (sed -n -e '/_authToken/ s/.*= *//p' ~/.npmrc)
end

if status --is-interactive
  # Set preferred editor, pager, etc.
  set -gx BROWSER "open -a Arc"
  set -gx EDITOR "nvim"
  set -gx VISUAL "nvim"
  set -gx PAGER "less"

  # Disable fish greeting
  set -g fish_greeting

  # Set the default Less options
  # -g or --hilite-search
  # -i or --ignore-case
  # -M or --LONG-PROMPT - Verbose prompt at bottom.
  # -R or --RAW-CONTROL-CHARS - Causes "raw" control characters to be displayed.
  # -S or --chop-long-lines
  # -w or --hilite-unread - Temporarily  highlights the first "new" line after a forward movement of a full page.
  # -X or --no-init - Dsables mouse-wheel scrolling. Disables sending the termcap init/deinit strings to the terminal.
  # -[z]n or --window=n - For example, if the screen is 24 lines, -z-4 sets the scrolling window to 20 lines.
  set -gx LESS "-g -i -M -R -S -w -X -z-4"

  # Add default Node.js version to PATH (prepend to ensure it takes precedence)
  set -gx NVM_DIR $HOME/.nvm
  fish_add_path -g $NVM_DIR/versions/node/v24.4.1/bin
end
