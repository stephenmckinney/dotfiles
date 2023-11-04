# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/editor"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "editor"

# Split window into 2 panes.
split_vl 6 

# Set active pane.
select_pane 1
