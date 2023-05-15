#!/bin/bash

# source directory (current directory)
src_dir=$(pwd)

# destination directory (home directory)
dest_dir=$HOME

# dry run flag
dry_run=false

# remote shell flag
remote_shell=false

# allowlist of files for remote shell
remote_shell_allowlist=("base_aliases" "editrc" "inputrc" "irbrc")

# denylist of files to always skip
denylist=("Brewfile" "Brewfile.lock.json" "Rakefile" "README.md" "install.sh" "iterm2")

# check for --dry-run and --remote-shell arguments
for arg in "$@"
do
    case $arg in
        --dry-run)
        dry_run=true
        shift
        ;;
        --remote-shell)
        remote_shell=true
        shift
        ;;
    esac
done

# check if source and destination directories exist
if [[ ! -d $src_dir ]]; then
    echo "Source directory $src_dir does not exist. Please check the path."
    exit 1
fi

if [[ ! -d $dest_dir ]]; then
    echo "Destination directory $dest_dir does not exist. Please check the path."
    exit 1
fi

echo -e "\nSymlinks"
# iterate over each file in the source directory
for src_file in "$src_dir"/*; do
  # extract just the base filename
  base_file=$(basename "$src_file")

  # if file is in the denylist, skip it
  if [[ " ${denylist[@]} " =~ " ${base_file} " ]]; then
    continue
  fi

  # if remote shell option is set, skip files not in the allowlist
  if $remote_shell && ! [[ " ${remote_shell_allowlist[@]} " =~ " ${base_file} " ]]; then
    continue
  fi

  # if the current file is the "config" directory, handle it specially
  if [[ $base_file == "config" && -d $src_file ]]; then
    # mkdir if it doesn't exist
    if [ ! -d "$dest_dir/.$base_file" ]; then
      echo "mkdir -p \"$dest_dir/.$base_file\""
      if ! $dry_run; then
        mkdir -p "$dest_dir/.$base_file"
      fi
    fi
    for config_file in "$src_file"/*; do
      config_base_file=$(basename "$config_file")
      if [[ ! -e "$dest_dir/.$base_file/$config_base_file" ]]; then
        echo "ln -s \"$config_file\" \"$dest_dir/.$base_file/$config_base_file\""
        if ! $dry_run; then
          ln -s "$config_file" "$dest_dir/.$base_file/$config_base_file"
        fi
      else
        echo "Symbolic link $dest_dir/.$base_file/$config_base_file already exists. Skipping."
      fi
    done
    continue  # skip the usual handling for this file/directory
  fi

  # check if symbolic link already exists, if not, create it
  if [[ ! -e "$dest_dir/.$base_file" ]]; then
    echo "ln -s \"$src_file\" \"$dest_dir/.$base_file\""
    if ! $dry_run; then
      ln -s "$src_file" "$dest_dir/.$base_file"
    fi
  else
    echo "Symbolic link $dest_dir/.$base_file already exists. Skipping."
  fi
done

# TMUXIFIER - update git submodule
echo -e "\nTmuxifier"
# Check if ./tmuxifier directory exists and is a git submodule
if [[ -d "$(pwd)/tmuxifier" && -e "$(pwd)/tmuxifier/.git" ]]; then

  # Pull the latest changes from the master branch
  echo "cd $(pwd)/tmuxifer"
  echo "git pull origin master"
  if ! $dry_run; then
    cd "$(pwd)/tmuxifier"
    git pull origin master
  fi
else
  echo "Directory $(pwd)/tmuxifier does not exist or is not a git repository."
fi

# PREZTO - clone git repo and set default user shell to Zsh
echo -e "\nPrezto"
# Check if ~/.zprezto directory exists
if [[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  echo '~/.zprezto directory already exists, skipping clone.'
else
  # Clone the prezto repository and set default user shell to Zsh
  echo 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"'
  echo 'chsh -s /bin/zsh'
  if ! $dry_run; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    chsh -s /bin/zsh
  fi
fi
