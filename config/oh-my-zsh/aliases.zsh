# sexy list handling
alias ll='exa -la --git'

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# colored cat command
alias cat='bat'

# public ip address
alias ip="echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;"

# launch applications
alias chrome='open -a "/Applications/Google Chrome.app" --args --force-renderer-accessibility'
alias chromeDebug='chrome --remote-debugging-port=9222'

# npm stuff
alias na='npm install --save'
alias nad='npm install --save-dev'
alias nr='npm uninstall'
alias nga='npm install --global'
alias ngr='npm uninstall --global'
alias ngu='npm uninstall --global'
alias n-reset='rm -rf node_modules  && npm install && npx node-notifier-cli -t "Done" -m "npm modules reinstalled"'

# pnpm
alias p="pnpm"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias pr="pnpm remove"
alias pga="pnpm global add"
alias pgr="pnpm global remove"
alias pgu="pnpm global update"
alias p-reset='rm -rf node_modules && rm -f pnpm-lock.yaml && pnpm install && npx node-notifier-cli -t "Done" -m "pnpm modules reinstalled"'

# Mac adress changer (free wifi hack)
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"

# brew
alias brewup='brew install mas && brew bundle dump --describe --force --file="~/Library/CloudStorage/Dropbox/dotfiles/config/Brewfile"'

# tmux
alias tswh='tmux split-window -h -p'
alias tswv='tmux split-window -v -p'

# spine
alias spine='/Applications/Spine.app/Contents/MacOS/Spine'
