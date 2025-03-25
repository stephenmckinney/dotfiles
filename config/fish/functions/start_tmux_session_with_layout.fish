function start_tmux_session_with_layout
  # Generate a unique session name with a timestamp
  set SESSION_NAME "tmux_"(date +%s)

  # Start a new session with the unique name but don't attach to it yet
  tmux new-session -d -s "$SESSION_NAME"

  # Rename window to "Editor"
  tmux rename-window Editor

  # Create the second new window named "Server" and set up the horizontal split 50/50 panes
  tmux new-window -n Server
  tmux split-window -h -p 50

  # Select the first window
  tmux select-window -t "$SESSION_NAME":1

  # Resize panes on window "Editor" when a client is attached
  tmux set-hook -t "$SESSION_NAME" client-attached 'run-shell "~/.bin/tmux_resize.sh -p 10"'

  # Attach to the session on window "Editor"
  tmux attach-session -t "$SESSION_NAME"
end
