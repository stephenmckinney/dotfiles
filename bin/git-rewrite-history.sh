#!/usr/bin/env sh

# Email Address Changer Script for Git Repository
# Usage:
#   Copy script to directory of git project.
#   Then run the script to update the author and committer information in the git history.
#     Example: ./script.sh <old_email> <new_email> <new_name>


# Ensure the script is run with three arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <old_email> <new_email> <new_name>"
    exit 1
fi

# Assign arguments to variables
old_email=$1
new_email=$2
new_name=$3

# Run git filter-branch to update the email and name
git filter-branch --env-filter '

# Get current author and committer information
author_name="$GIT_AUTHOR_NAME"
author_email="$GIT_AUTHOR_EMAIL"
committer_name="$GIT_COMMITTER_NAME"
committer_email="$GIT_COMMITTER_EMAIL"

# Update committer info if the email matches the old email
if [ "$GIT_COMMITTER_EMAIL" = "'$old_email'" ]
then
    committer_name="'$new_name'"
    committer_email="'$new_email'"
fi

# Update author info if the email matches the old email
if [ "$GIT_AUTHOR_EMAIL" = "'$old_email'" ]
then
    author_name="'$new_name'"
    author_email="'$new_email'"
fi

# Export updated info
export GIT_AUTHOR_NAME="$author_name"
export GIT_AUTHOR_EMAIL="$author_email"
export GIT_COMMITTER_NAME="$committer_name"
export GIT_COMMITTER_EMAIL="$committer_email"
'
