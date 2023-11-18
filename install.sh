#!/bin/bash

# Usage: ./install.sh [--dry-run] [--remote-shell]

################################################################################
# Setup global variables
################################################################################

# source directory (current directory)
src_dir=$(pwd)
# destination directory (home directory)
dest_dir=$HOME
# dry run flag
dry_run=false
# remote shell flag
remote_shell=false
# allowlist of files for remote shell
remote_shell_allowlist=("bash_aliases" "editrc" "inputrc" "irbrc")
# denylist of files to always skip
denylist=("Brewfile" "Brewfile.lock.json" "Rakefile" "README.md" "install.sh" "iterm2" "stylua.toml")

# check if source and destination directories exist
if [[ ! -d $src_dir ]]; then
	echo "Source directory $src_dir does not exist. Please check the path."
	exit 1
fi

if [[ ! -d $dest_dir ]]; then
	echo "Destination directory $dest_dir does not exist. Please check the path."
	exit 1
fi

################################################################################
# Parse command line arguments
################################################################################

# check for --dry-run and --remote-shell arguments
for arg in "$@"; do
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

if [[ "$dry_run" == "true" ]]; then
	printf "\nDry run mode enabled. No changes will be made.\n"
fi

if [[ "$remote_shell" == "true" ]]; then
	printf "\nRemote shell mode enabled. Only files in the allowlist will be symlinked.\n"
fi

################################################################################
# Functions
################################################################################

# Exectute and echo command:
#   * Execute a command, unless in dry_run mode
#   * Echo the command, always
function execute_and_echo() {
	# Check if at least one argument is provided
	if [ $# -eq 0 ]; then
		echo "Error: No command provided to execute_and_echo"
		return 1 # Exit the function with an error status
	fi

	# Combine all arguments into a single command string
	local command
	command=$(printf " %q" "$@")
	command=${command:1} # remove leading space

	# Echo the command
	echo "$command"

	# Execute the command if not in dry_run mode
	if [[ "$dry_run" != "true" ]]; then
		"$@"
	fi
}

# Create symlinks for all files in the source directory
function create_symlinks() {
	printf "\nCreating Symlinks...\n"

	# iterate over each file in the source directory
	for src_file in "$src_dir"/*; do
		# extract just the base filename
		base_file=$(basename "$src_file")

		# if file is in the denylist, skip it
		if [[ "${denylist[*]}" == *"${base_file}"* ]]; then
			continue
		fi

		# if remote shell option is set, skip files not in the allowlist
		if $remote_shell && ! [[ "${remote_shell_allowlist[*]}" == *"${base_file}"* ]]; then
			continue
		fi

		# if the current file is the "config" directory, handle it specially
		if [[ $base_file == "config" && -d $src_file ]]; then
			# mkdir if it doesn't exist
			if [ ! -d "$dest_dir/.$base_file" ]; then
				execute_and_echo mkdir -p "$dest_dir/.$base_file"
			fi
			for config_file in "$src_file"/*; do
				config_base_file=$(basename "$config_file")
				if [[ ! -e "$dest_dir/.$base_file/$config_base_file" ]]; then
					execute_and_echo ln -s "$config_file" "$dest_dir/.$base_file/$config_base_file"
				else
					echo "Symbolic link $dest_dir/.$base_file/$config_base_file already exists. Skipping."
				fi
			done
			continue # skip the usual handling for this file/directory
		fi

		# check if symbolic link already exists, if not, create it
		if [[ ! -e "$dest_dir/.$base_file" ]]; then
			execute_and_echo ln -s "$src_file" "$dest_dir/.$base_file"
		else
			echo "Symbolic link $dest_dir/.$base_file already exists. Skipping."
		fi
	done
}

function setup_fish_shell() {
	printf "\nSetting up fish shell...\n"

	if command -v fish >/dev/null 2>&1; then
		# If fish is available, set it as the default shell
		echo "Setting fish as default shell..."
		execute_and_echo chsh -s /opt/homebrew/bin/fish

		# Check if Fisher is already installed by trying to run it within a fish shell
		if fish -c 'type fisher' >/dev/null 2>&1; then
			echo "Fisher is already installed. Skipping installation."
		else
			echo "Fisher is not installed. Installing..."
			execute_and_echo fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source; and fisher install jorgebucaran/fisher"
			echo "Fisher installed successfully."
		fi
	else
		echo "Fish shell is not installed. Installing..."
		execute_and_echo brew install fish
	fi
}

################################################################################
# Main
################################################################################

create_symlinks
setup_fish_shell
