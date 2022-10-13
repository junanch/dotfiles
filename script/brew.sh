#!/usr/bin/env sh

echo ""
echo "#######################################"
echo "# Installing various programs from brew"
echo "#######################################"
echo ""

brew -v >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install mas
