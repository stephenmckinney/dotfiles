fish_add_path -g \
  /opt/homebrew/bin \
  /opt/homebrew/sbin \
  ~/.bin

# rbenv - Adds rbenv shims to path
status --is-interactive; and rbenv init - fish | source
