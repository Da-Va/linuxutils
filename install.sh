#!/bin/sh

STOW_DIR="$(dirname "$0")"

install_to_home() {
  if ! stow --dir="$STOW_DIR" --target="$HOME" "$1" 2> /dev/null; then
    echo "Backing up pre-existing files.";

    stow --dir="$STOW_DIR" --target="$HOME" "$1" 2>&1 \
      | grep -e "\*" \
      | awk \{'print $(NF)'\} \
      | xargs -I{} mv "$HOME"/{} "$HOME"/{}.bkp;

    stow --dir="$STOW_DIR" --target="$HOME" "$1";
  fi;
}

install_to_home dotfiles
install_to_home bin
