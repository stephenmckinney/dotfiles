function nvm
    set -l nvm_dir $HOME/.nvm
    set -l nvm_script "$nvm_dir/nvm.sh"
    
    if test -s "$nvm_script"
        # Use bash to run nvm commands
        bash -c "source '$nvm_script' && nvm $argv"
    else
        echo "nvm not found at $nvm_script"
        return 1
    end
end
