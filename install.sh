#!/bin/sh

cd "$(dirname "$0")" || exit 1
. setup/utils.sh

case "$1" in
  uninstall)
    stow_uninstall dotfiles "$HOME"
    stow_uninstall bin "$HOME"
    ;;
  install | '')
    stow_install dotfiles "$HOME"
    stow_install bin "$HOME"
    ;;
  *)
    echo "Unknown command "$1""
    ;;
esac
