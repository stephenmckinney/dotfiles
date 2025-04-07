function ls_on_cd --on-variable PWD
  ls
end

# invoke at least once to set up the event listener
ls_on_cd >/dev/null 2>/dev/null
