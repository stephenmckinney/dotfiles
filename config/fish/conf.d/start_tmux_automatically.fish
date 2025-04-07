function start_tmux_automatically --on-event fish_prompt
  if status is-interactive
    # Check if we're not already in a tmux session
    if not set -q TMUX
      # Don't start tmux if we're in VS Code
      if not set -q TERM_PROGRAM
        # Start your tmux session function
        start_tmux_session_with_layout
      end
    end
  end
end
