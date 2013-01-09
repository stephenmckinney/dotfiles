# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/server"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "server"

# Split window into 2 panes.
split_h 50

# Paste text
send_keys "foreman start" 1
send_keys "script/server --perform_caching" 2

# Set active pane.
select_pane 2
