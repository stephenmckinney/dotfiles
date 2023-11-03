function psgrep
  ps -e -o pid,command | grep (echo $argv[1] | sed "s/^\(.\)/[\1]/g")
end
