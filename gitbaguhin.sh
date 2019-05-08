#!/bin/sh
git filter-branch -f --env-filter '

OLD_EMAIL=(
    "redacted"
)
CORRECT_NAME="redacted"
CORRECT_EMAIL="redacted"

for NEW_EMAIL in ${OLD_EMAIL[@]}; do
    if [ "$GIT_COMMITTER_EMAIL" == "$NEW_EMAIL" ]; then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" == "$NEW_EMAIL" ]; then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
done
' --tag-name-filter cat -- --branches --tags
