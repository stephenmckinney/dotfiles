function start_tmux_automatically --on-event fish_prompt
  if status is-interactive
    # Prevent execution if already in a tmux session
    if not set -q TMUX
      # Prevent tmux from starting if running inside Cursor terminal
      if not set -q CURSOR_TRACE_ID
        start_tmux_session_with_layout
      end
    end
  end
end
