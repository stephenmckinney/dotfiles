if status is-interactive
  fish_vi_key_bindings

  # Set vim-like cursors
  # Set the normal and visual mode cursors to a block
  set -g fish_cursor_default block
  # Set the insert mode cursor to a line
  set -g fish_cursor_insert line
  # Set the replace mode cursor to an underscore
  set -g fish_cursor_replace_one underscore

  # set vim-like keybindings
  bind --user --mode insert \ck accept-autosuggestion
  bind --user --mode insert \cl forward-bigword
  bind --user --mode insert \ch backward-bigword
end
