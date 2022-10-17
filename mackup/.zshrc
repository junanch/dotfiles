export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

################################################################################
# oh-my-zsh
plugins=(
  git
  z
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
  git-open
  tmux
  yarn
)

source $ZSH/oh-my-zsh.sh

# zsh-completions 包是用以增强zsh的补全功能, mac系统可不安装。
# 启用 zsh-completions
autoload -U compinit && compinit

HIST_STAMPS="yyyy-mm-dd"
################################################################################


################################################################################
# iterm shell - https://www.iterm2.com/documentation-shell-integration.html
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# set variables for iTerm2 status bar
iterm2_print_user_vars() {
  iterm2_set_user_var pwd $(pwd)
  iterm2_set_user_var nodeVersion $(node -v)
}
################################################################################


################################################################################
# set brew zsh evn, load zsh prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
# zsh prompt - pure
# prompt pure

# zsh prompt - spaceship
prompt spaceship
SPACESHIP_VI_MODE_SHOW=fals
################################################################################


################################################################################
# ruby
export RUBYPATH="$(brew --prefix ruby)"
export LDFLAGS="-L${RUBYPATH}/lib"
export CPPFLAGS="-I${RUBYPATH}/include"
export PKG_CONFIG_PATH="${RUBYPATH}/lib/pkgconfig"
export PATH="${RUBYPATH}/bin:$PATH"
################################################################################


################################################################################
# gpg
export GPG_TTY=$(tty)
################################################################################


################################################################################
# go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix go)/libexec"
export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"
################################################################################


################################################################################
# vim mode
set -o vi
set backspace=2
################################################################################


################################################################################
# 1Password setting SSH_AUTH_SOCK
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
################################################################################


################################################################################
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
################################################################################
