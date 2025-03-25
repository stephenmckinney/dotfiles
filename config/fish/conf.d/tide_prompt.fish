if status is-interactive
  set -g tide_left_prompt_items vi_mode pwd git
  set -g tide_right_prompt_items status cmd_duration context jobs direnv node ruby go toolbox aws
end
