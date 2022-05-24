#!/bin/sh

cd "$(dirname "$0")" || exit 1
. SETUP/utils.sh

case "$1" in
  install | '')
    stow_install dotfiles "$HOME"
    scripts/install.sh install
    ;;
  uninstall)
    stow_uninstall dotfiles "$HOME"
    scripts/install.sh uninstall
    ;;
  *)
    echo "Unknown command $1"
    ;;
esac
