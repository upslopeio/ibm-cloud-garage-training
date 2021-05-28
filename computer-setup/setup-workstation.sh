#!/usr/bin/env bash

if [[ "$OSTYPE" == "cygwin" ]]; then
  echo 'cygwin is not supported'
  exit 1
elif [[ "$OSTYPE" == "msys" ]]; then
  echo 'msys is not supported'
  exit 1
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  echo 'freebsd is not supported'
  exit 1
fi

read -p "This script will setup your workstation for the IBM Cloud Native Garage Method course with Upslope.io. Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo
echo Looking for zsh

if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
  echo Skipping zsh install
else
  echo run the following to install zsh, and run this script again.
  echo 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
  exit 1
fi

echo
echo Looking for brew

if command -v brew &>/dev/null; then
  echo Skipping homebrew install
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo
echo Looking for git

if command -v git &>/dev/null; then
  echo Skipping git install
else
  sh -c "$(brew install git)"
fi

echo
echo Looking for node

if command -v node &>/dev/null; then
  echo Skipping node install
else
  sh -c "$(brew install node)"
fi

echo
echo Looking for docker

if command -v docker &>/dev/null; then
  echo Skipping docker install
else
  sh -c "$(brew install --cask docker)"
fi

echo
echo Looking for helm

if command -v helm &>/dev/null; then
  echo Skipping helm install
else
  sh -c "$(brew install helm)"
fi

echo
echo Looking for yq

if command -v yq &>/dev/null; then
  echo Skipping yq@3 install
else
  sh -c "$(brew install yq@3)"
  echo "export PATH=\"$(brew --prefix yq@3)/bin:$PATH\"" >>~/.zshrc
fi

echo
echo Looking for jq to set permissions

if command -v jq &>/dev/null; then
  sh -c "$(chmod u+x $(command -v jq))"
else
  sh -c "$(brew install jq)"
  echo Skipping set jq permissions
fi

echo
echo Looking for Visual Studio Code

if command -v code &>/dev/null; then
  echo Skipping Visual Studio Code install
else
  sh -c "$(brew install --cask visual-studio-code)"
fi

echo
echo Looking for Visual Studio Code extension ms-vsliveshare.vsliveshare

if [[ $(code --list-extensions) == *ms-vsliveshare.vsliveshare* ]]; then
  echo Skipping Visual Studio Liveshare extension install
else
  sh -c "$(code --install-extension ms-vsliveshare.vsliveshare)"
fi

echo
echo Looking for Visual Studio Code extension redhat.vscode-yaml

if [[ $(code --list-extensions) == *redhat.vscode-yaml* ]]; then
  echo Skipping YAML extension install
else
  sh -c "$(code --install-extension redhat.vscode-yaml)"
fi

echo
echo Installing Terminal Shell
curl -sL shell.cloudnativetoolkit.dev | bash -

echo 'export PATH="$(npm bin -g):$PATH"' >> ~/.zshrc
echo
echo source ~/.zshrc

source ~/.zshrc

echo
echo
echo ===== RESULTS: post the following to the slack channel =====
echo
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo Slack version $(defaults read /Applications/Slack.app/Contents/Info.plist CFBundleShortVersionString)
else
  echo Slack version unknown
fi
echo "$(brew --version)"
echo "Code version $(code --version)"
echo "$(docker --version)"
echo "Helm version $(helm version)"
echo "$(git --version)"
echo "$(ibmcloud --version)"
echo "igc version $(igc --version)"
echo "node version $(node --version)"
echo "npm version $(npm --version)"
echo "nvm version $(nvm --version)"
echo "oc version $(oc version)"
echo ===== RESULTS END =====
echo
echo Workstation setup ended - check output above, if there are any errors post them to the slack channel, otherwise post the RESULTS to the slack channel.
