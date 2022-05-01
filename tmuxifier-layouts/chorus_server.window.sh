new_window "servers"

# Split window into 4 panes.
run_cmd "cd ~/code/work/content-api"
split_h
run_cmd "cd ~/code/work/tower"
split_h
run_cmd "cd ~/code/work/anthem"
split_h
run_cmd "cd ~/code/work/sbn"
balance_windows_horizontal

# Set active pane.
select_pane 1
