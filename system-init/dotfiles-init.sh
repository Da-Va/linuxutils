#!/bin/sh

if [ $# -le 0 ]; then
  echo "usage: $0 DOTFILES_DIR";
  exit 1;
fi

# stow --target="$HOME" "$1" 2> /dev/null
if ! stow --target="$HOME" "$1" 2> /dev/null; then
  echo "Backing up pre-existing dot files.";
  # mkdir -p "$HOME"/.dotfiles-backup;

  stow --target="$HOME" "$1" 2>&1 \
    | grep -e "\*" \
    | awk \{'print $(NF)'\} \
    | xargs -I{} mv "$HOME"/{} "$HOME"/{}.bkp;

  stow --target="$HOME" "$1";
  # echo "Installed config.";
fi;
