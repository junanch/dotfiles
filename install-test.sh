#!/usr/bin/env sh

# set current path const
ROOT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
CONFIG_DIR="$ROOT_DIR/config"
SCRIPT_DIR="$ROOT_DIR/script"
MACKUP_DIR="$ROOT_DIR/mackup"

# import tools function
source "$ROOT_DIR/command/tools.sh"

install_test() {
  log_section_start "Installing test"

  FROM_FILE="$MACKUP_DIR/.gitconfig"
  TARGET_FILE=~/.gitconfig

  log_section_start "Sym linking file from $FROM_FILE to $TARGET_FILE"
  symlink "$FROM_FILE" "$TARGET_FILE"
}


if [ "$(type -t "install_$1")" == function ]; then
  install_$1
else
  echo "$1 is no defined function"
fi
