#!/bin/sh

# Copy script to directory of git project.
# In Vim:
# Execute :%s/\<steve@foo.com\>/old_email/g
# Execute :%s/\<steve@bar.com\>/new_email/g

git filter-branch --env-filter '

an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "steve@foo.com" ]
then
    cn="Steve McKinney"
    cm="steve@bar.com"
fi
if [ "$GIT_AUTHOR_EMAIL" = "steve@foo.com" ]
then
    an="Steve McKinney"
    am="steve@bar.com"
fi

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
