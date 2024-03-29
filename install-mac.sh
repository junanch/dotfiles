#!/usr/bin/env sh

# set current path const
ROOT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
CONFIG_DIR="$ROOT_DIR/config"
SCRIPT_DIR="$ROOT_DIR/script"
MACKUP_DIR="$ROOT_DIR/mackup"

# import tools function
source "$ROOT_DIR/command/tools.sh"

install_ssh_config() {
  log_section_start "Installing ssh config"

  FROM_FILES="$MACKUP_DIR/.ssh/*"
  TARGET_DIR=~/.ssh/

  if [ ! -d $TARGET_DIR ]; then
    mkdir $TARGET_DIR &> /dev/null
  fi

  log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"
  symlink_files "$FROM_FILES" "$TARGET_DIR"
}

install_git_config() {
  log_section_start "Installing git config"

  FROM_FILE="$MACKUP_DIR/.gitconfig"
  TARGET_FILE=~/.gitconfig

  log_section_start "Sym linking file from $FROM_FILE to $TARGET_FILE"
  symlink "$FROM_FILE" "$TARGET_FILE"
}

install_mac_config() {
  log_section_start "Installing mac config"
  bash "$SCRIPT_DIR/mac.sh" "$ROOT_DIR"
}

install_xcode_select() {
  log_section_start "Installing xcode-select"

  xcode-select --install
  sudo xcode-select --switch /Library/Developer/CommandLineTools
}

install_brew() {
  log_section_start "Installing brew command"
  bash "$SCRIPT_DIR/brew.sh" "$ROOT_DIR"
}

install_brew_config() {
  log_section_start "Installing brew config"

  if command -v brew >/dev/null 2>&1; then
    brew bundle --file="$CONFIG_DIR/Brewfile"
  else
    echo "no exists brew command"
  fi
}

install_mackup_config() {
  log_section_start "Installing mackup config"

  if command -v mackup >/dev/null 2>&1; then
    FROM_FILE="$MACKUP_DIR/.mackup.cfg"
    TARGET_FILE=~/.mackup.cfg

    log_section_start "Sym linking file from $FROM_FILE to $TARGET_FILE"
    symlink "$FROM_FILE" "$TARGET_FILE"

    mackup restore
  else
    echo "no exists mackup command"
  fi
}

install_oh_my_zsh() {
  log_section_start "Installing oh-my-zsh"

  if [ -d ~/.oh-my-zsh/ ]; then
    echo "Cleaning up ~/.oh-my-zsh/"
    rm -rf ~/.oh-my-zsh/
  fi

  RUNZSH=no

  KEEP_ZSHRC=yes

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_oh_my_zsh_config() {
  echo "Installing zsh-completions"
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

  echo "Installing zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

  echo "Installing zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

  echo "Installing zsh-you-should-use"
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use

  echo "Installing git-open"
  git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

  # 漂亮、最小和快速的ZSH提示
  # mkdir -p "$HOME/.zsh"
  # git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
  # [2022-07-31 更新] pure 支持已经使用 brew install pure 安装

  # config
  FROM_FILES="$CONFIG_DIR/oh-my-zsh/*"
  TARGET_DIR=~/.oh-my-zsh/custom/

  log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"
  symlink_files "$FROM_FILES" "$TARGET_DIR"
}

install_iterm2_zsh() {
  log_section_start "Installing iTerm2"

  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
}

install_iprintf_vim() {
  log_section_start "Installing iprintf vim"

  test -e ~/.vim -o -e ~/.vimrc -o -e ~/.vimrc.local -o -e ~/.vim.plugins \
    && tar -cf ~/vim-backup-$(date +%m%d%H%M%S).tar ~/.vim* &> /dev/null
  rm -rf ~/.vim* &> /dev/null

  git clone https://gitee.com/iprintf/vim ~/.iprintf-vim

  # vim "y" copy to system clipboard
  echo -e "\nset clipboard=unnamed" >> ~/.iprintf-vim/config/.vimrc

  FROM_FILES=~/.iprintf-vim/config/.vim*
  TARGET_DIR=~
  log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"
  symlink_files "$FROM_FILES" "$TARGET_DIR"
}

install_neovim() {
  log_section_start "Installing neovim"
  git clone https://github.com/junegunn/vim-plug ~/.junegunn-vim-plug

  FROM_FILES=~/.junegunn-vim-plug/plug.vim
  TARGET_DIR=~/.local/share/nvim/site/autoload
  log_section_start "Sym linking files from $FROM_FILES to $TARGET_DIR"
  mkdir -p $TARGET_DIR && ln -s $FROM_FILES $TARGET_DIR/plug.vim
}

install_all() {
  install_ssh_config
  install_git_config
  install_mac_config
  install_xcode_select

  install_brew
  install_brew_config
  install_mackup_config

  install_oh_my_zsh
  install_oh_my_zsh_config
  install_iterm2_zsh

  install_iprintf_vim
  install_neovim
}

if [ "$(type -t "install_$1")" == function ]; then
  install_$1
else
  echo "$1 is no defined function"
fi
