#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying Portfolio Updates to GitHub...\033[0m\n"
# check message
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

#commit to Portfolio repo
git add -A
git commit -m "$msg"
git push origin main

printf "\033[0;32mPushed to Portfolio\033[0m\n"

# Build the project.
hugo -t hugo-resume

## Publish

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying Public Updates to GitHub...\033[0m\n"
# check message
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

#commit to Portfolio repo
git add public/.
git commit -m "$msg"
git push website main

printf "\033[0;32mPushed to Public\033[0m\n"
