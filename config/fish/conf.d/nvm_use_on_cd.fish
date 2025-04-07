function nvm_use_on_cd --on-variable PWD
  if test -f ".nvmrc"
    nvm use
  end
end

# Invoke once to set up the event listener
nvm_use_on_cd >/dev/null 2>/dev/null
