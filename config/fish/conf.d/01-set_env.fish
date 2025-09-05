# Set language
set -gx LANG "en_US.UTF-8"

# Setup Homebrew
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
# Add Homebrew's man pages to MANPATH for documentation lookup
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
# Add Homebrew's info pages to INFOPATH for GNU info documentation
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Ruby/Rails env vars
set -gx DISABLE_SPRING 1
set -gx MINITEST_REPORTER "ProgressReporter"

# Configure Access to the Private work NPM modules
# Extract NPM authentication token from .npmrc file if it exists
if test -f ~/.npmrc
  set -gx NPM_TOKEN (sed -n -e '/_authToken/ s/.*= *//p' ~/.npmrc)
end

if status --is-interactive
  # Set preferred editor, pager, etc.
  set -gx BROWSER "open -a Dia"
  set -gx EDITOR "nvim"
  set -gx VISUAL "nvim"
  set -gx PAGER "cat"
  set -gx BAT_THEME "OneHalfDark"

  # Disable fish greeting
  set -g fish_greeting

  # Set the default Less options
  # These options enhance the 'less' pager experience:
  # -g or --hilite-search: Highlight only current search match (not all matches)
  # -i or --ignore-case: Case-insensitive searches
  # -M or --LONG-PROMPT: Show detailed status line with file info and position
  # -R or --RAW-CONTROL-CHARS: Display ANSI color codes properly
  # -S or --chop-long-lines: Don't wrap long lines, allow horizontal scrolling
  # -w or --hilite-unread: Highlight first new line after page movements
  # -X or --no-init: Don't clear screen on exit, preserves output in terminal
  # -z-4 or --window=-4: Set scroll size to screen height minus 4 lines
  set -gx LESS "-g -i -M -R -S -w -X -z-4"

  # Node Version Manager (NVM) Configuration
  # Set the NVM installation directory
  set -gx NVM_DIR $HOME/.nvm
  
  # Automatically add the default Node.js version to PATH
  # This ensures node/npm are available immediately without running 'nvm use'
  if test -e $NVM_DIR/alias/default
    # Read the default Node.js version alias from NVM's config
    set -l default_alias (cat $NVM_DIR/alias/default)
    
    # Handle special case where default is set to "node" (latest version)
    if test "$default_alias" = "node"
      # Find the latest installed Node.js version
      set -l latest_version (ls -1 $NVM_DIR/versions/node | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -1)
      # Add the bin directory of the latest version to PATH
      fish_add_path -g $NVM_DIR/versions/node/$latest_version/bin
    else
      # For specific version aliases (e.g., "v20.11.0"), use that version directly
      fish_add_path -g $NVM_DIR/versions/node/$default_alias/bin
    end
  end
end
