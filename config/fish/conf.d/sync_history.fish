function sync_fish_history --on-event fish_postexec
  history --save
  history --merge
end
