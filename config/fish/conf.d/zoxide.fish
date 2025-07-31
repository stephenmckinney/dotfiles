# Initialize zoxide
if status is-interactive
    zoxide init fish | source
    alias j='z'  # Keep the same muscle memory as fasd
end