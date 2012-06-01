#
# Executes commands at login post-zshrc.
#
# This file is sourced by login shells after zshrc, and thus, it should contain
# commands that need to execute at login. It is usually used for messages such as
# [fortune][2], [msgs][3], or for the creation of files.
#
# This is not the file to define aliases, functions, shell options, and key
# bindings. It should not change the shell environment.
#
# Authors:
#   Steve McKinney <stevemckinney@gmail.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  dump_file="$HOME/.zcompdump"
  if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
    zcompile "$dump_file"
  fi

  # Set environment variables for launchd processes.
  if [[ "$OSTYPE" == darwin* ]]; then
    for env_var in PATH MANPATH; do
      launchctl setenv "$env_var" "${(P)env_var}"
    done
  fi
} &!

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  fortune -a
  print
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
