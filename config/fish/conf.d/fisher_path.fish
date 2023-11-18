# Set custom fisher plugin path

# only run if fisher_path is not set
set --query _fisher_path_initialized && exit
set --global _fisher_path_initialized

# set custom fisher path
set fisher_path $__fish_config_dir/plugins

# if fisher_path is not custom, exit
if test -z "$fisher_path" || test "$fisher_path" = "$__fish_config_dir"
    exit
end

# set completions and functions path
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

# load all plugins
for file in $fisher_path/conf.d/*.fish
    if ! test -f (string replace --regex "^.*/" $__fish_config_dir/conf.d/ -- $file)
        and test -f $file && test -r $file
        source $file
    end
end
