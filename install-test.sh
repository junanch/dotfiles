#!/usr/bin/env sh

# set current path const
ROOT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
CONFIG_DIR="$ROOT_DIR/config"
SCRIPT_DIR="$ROOT_DIR/script"

# import tools function
source "$ROOT_DIR/command/tools.sh"

# oh-my-zsh
install_test() {
  log_section_start "Installing test"

  FROM_FILES=~/.iprintf-vim/config/.vim*
  TARGET_DIR=~

  log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"
  symlink_files "$FROM_FILES" "$TARGET_DIR"
}


if [ "$(type -t "install_$1")" == function ]; then
  install_$1
else
  echo "$1 is no defined function"
fi
