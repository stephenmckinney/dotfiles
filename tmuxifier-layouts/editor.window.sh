# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/editor"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "editor"

# Split window into 3 panes.
split_v 20
split_h 40

# Run commands
run_cmd "vim ." 1

# Paste text
send_keys "rorc" 2

# Set active pane.
select_pane 1
