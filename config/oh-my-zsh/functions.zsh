# find shorthand
function f() {
  find . -name "$1"
}

cd(){
  [[ -t 1 && $((RANDOM%20)) -eq 0 ]] && echo " -> 🐶 \"woof\""; builtin cd "$@";
}

# quickly look up a folder
function grep-folder() {
  ll | grep $1
}

# Find a port blocker
function find-port-blocker() {
  if ! [ $# -eq 1 ]; then
    echo "Please define the port you want to check \n $ find-port-blocker 8000"
    return 1
  fi

  lsof -i tcp:$1
}

# Change Mac address to get around public wifi limitations
function hack-the-space() {
  NEW_MAC_ADDRESS=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  echo $NEW_MAC_ADDRESS
  sudo ifconfig en0 ether "$NEW_MAC_ADDRESS"
  echo "New MAC Address set"
}

# overwrite mv command to also work with one argument
function mv() {
  if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then
    command mv "$@"
    return
  fi

  newfilename="$1"
  vared newfilename
  command mv -v -- "$1" "$newfilename"
}

# create files in sub folders
function touchp() {
  mkdir -p "$(dirname "$1")/" && touch "$1"
}

# git handling
function git-clone() {
  git clone $1
  cd $(basename ${1%.*})
  if test -f "./package.json"; then
    echo "..."
    echo "Found package.json... installing dependencies"
    echo "..."
    npm install
  fi
}

function git-diff() {
  if [ "$#" -ne 2 ]; then
    command diff "$@"
    return
  fi

  git diff --no-index $1 $2;
}

function npm-diff() {
  command npm-diff $1 $2 $3 | delta --width $(tput cols) | less
}

function cur-wifi-pasd() {
 current_wifi=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/AIrport -I | \awk '/ SSID/ {print substr($0, index($0, $2))}'`
 security find-generic-password -a "$current_wifi" -g | tAIl -0
}

function backupp() {
  brew bundle dump --describe --force --file="~/Dropbox/dotfiles/config/Brewfile" && osascript -e 'display notification "backup to ~/Dropbox/dotfiles/config/Brewfile" with title "Brewfile"'
  ls /Applications | sort > ~/Dropbox/dotfiles/config/Applications && osascript -e 'display notification "backup ~/Dropbox/dotfiles/config/Applications" with title "Applications"'
  mackup -f backup && osascript -e 'display notification "mackup backup" with title "Mackup"'
}

function tsw() {
  tmux split-window -h -p 60
  tmux split-window -v -p 20
}
