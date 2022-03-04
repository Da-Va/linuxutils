#!/bin/sh

LINUX_UTILS_DIR="$(dirname "$0")"
PKG_MAN="sudo apt install -y "

install_pkg() {
  $PKG_MAN "$@"
}

STOW_DIR=$LINUX_UTILS_DIR
stow_to_home() {
  if ! stow -R --dir="$STOW_DIR" --target="$HOME" "$1" 2> /dev/null; then
    echo "Backing up pre-existing files.";

    stow --dir="$STOW_DIR" --target="$HOME" "$1" 2>&1 \
      | grep -e "\*" \
      | awk \{'print $(NF)'\} \
      | xargs -I{} mv "$HOME"/{} "$HOME"/{}.bkp;

    stow -R --dir="$STOW_DIR" --target="$HOME" "$1";
  fi;
}

stow --version > /dev/null || install_pkg stow

stow_to_home dotfiles
stow_to_home bin
