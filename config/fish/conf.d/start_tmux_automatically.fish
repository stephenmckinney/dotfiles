function start_tmux_automatically --on-event fish_prompt
  if status is-interactive
    # Check if we're not already in a tmux session
    if not set -q TMUX
      # Start your tmux session function
      start_tmux_session_with_layout
    end
  end
end
