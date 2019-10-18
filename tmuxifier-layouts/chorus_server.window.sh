new_window "servers"

# Split window into 4 panes.
run_cmd "cd ~/code/content-api"
split_h
run_cmd "cd ~/code/tower"
split_h
run_cmd "cd ~/code/anthem"
split_h
run_cmd "cd ~/code/sbn"
balance_windows_horizontal

# Set active pane.
select_pane 1
