#!/usr/sh

stow_install() {
  STOW_DIR=$(dirname "$1")
  PACKAGE_DIR=$(basename "$1")
  INSTALL_DIR="$2"

  # backup conflicts 
  echo "Installing package $PACKAGE_DIR:"
  echo "Backing up preexisting files:"
  stow --no --dir="$STOW_DIR" --target="$INSTALL_DIR" "$PACKAGE_DIR" 2>&1 \
    | grep "\*" \
    | awk \{'print $(NF)'\} \
    | xargs -I{} mv --verbose --no-clobber "$INSTALL_DIR"/{} "$INSTALL_DIR"/{}~stow~;

  # installing
  stow --stow --dir="$STOW_DIR" --target="$INSTALL_DIR" "$PACKAGE_DIR"
}

stow_uninstall() {
  STOW_DIR=$(dirname "$1")
  PACKAGE_DIR=$(basename "$1")
  INSTALL_DIR="$2"

  echo "Uninstalling package $PACKAGE_DIR:"
  echo "Restoring preexisting files:"
  stow --delete --verbose --dir="$STOW_DIR" --target="$INSTALL_DIR" "$PACKAGE_DIR" 2>&1 \
    | grep "UNLINK" \
    | awk \{'print $(NF)'\} \
    | xargs -I{} mv --verbose --no-clobber "$INSTALL_DIR"/{}~stow~ "$INSTALL_DIR"/{} 2>/dev/null;
}
