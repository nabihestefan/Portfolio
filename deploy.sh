#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying Portfolio Updates to GitHub...\033[0m\n"
# check message
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

# Build the project.
hugo -t hugo-resume

#commit to Portfolio repo
git add -A
git commit -m "$msg"
git push origin main --recurse-submodules=on-demand

printf "\033[0;32mPushed to Portfolio\033[0m\n"
