if status is-interactive
  fish_vi_key_bindings

  source ~/.config/fish/conf.d/path.fish
  source ~/.config/fish/conf.d/set_env.fish
  source ~/.config/fish/conf.d/abbr.fish

  source ~/.config/fish/functions/ls_on_cd.fish
end
