#!/bin/sh

cd "$(dirname "$0")" || exit 1
. ../SETUP/utils.sh

case "$1" in
  install | '')
    stow_install src/scripts "$HOME"
    ;;
  uninstall)
    stow_uninstall src/scripts "$HOME"
    ;;
  *)
    echo "Unknown command $1"
    ;;
esac

