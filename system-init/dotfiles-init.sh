#!/bin/sh

# Inspired by: https://www.atlassian.com/git/tutorials/dotfiles

REMOTE=git@github.com:Da-Va/dotfiles.git
LOCAL=$HOME/.dotfiles

git clone --bare "$REMOTE" "$LOCAL"
config() {
  /usr/bin/git --git-dir="$LOCAL"/ --work-tree="$HOME" "$@"
}
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  mkdir -p .config-backup
  config checkout 2>&1 | grep -E "\s+\." | awk \{'print $1'\} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
