# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/server"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "server"

# Paste text
send_keys "foreman start"

