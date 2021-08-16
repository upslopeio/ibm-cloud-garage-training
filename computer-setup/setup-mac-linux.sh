#!/usr/bin/env bash

set -e

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

EXISTING_EMAIL=$(git config --global user.email)
read -rp "Please Enter your email address for git (${EXISTING_EMAIL}): " GIT_EMAIL
GIT_EMAIL=${GIT_EMAIL:-${EXISTING_EMAIL}}

EXISTING_USER_NAME=$(git config --global user.name)
EXISTING_USER_NAME=${EXISTING_USER_NAME:-${USER}}
read -rp "Please Enter your user name for git (${EXISTING_USER_NAME}): " GIT_USER_NAME
GIT_USER_NAME=${GIT_USER_NAME:-${EXISTING_USER_NAME}}

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_EMAIL}"
git config --global core.ignorecase false
git config --global init.defaultBranch main

if [ -z "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
  echo zsh not found
  echo Run the following to install zsh, and run this script again.
  echo 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
  exit 1
fi

if command -v brew &>/dev/null; then
  echo Found homebrew
else
  echo Installing homebrew
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v docker &>/dev/null; then
    echo Found docker
else
  echo Installing docker
  sh -c "$(brew install --cask docker)"
fi

if command -v kustomize &>/dev/null; then
    echo Found kustomize
else
  echo Installing kustomize
  sh -c "$(brew install kustomize)"
fi

if command -v git &>/dev/null; then
  echo Found git
else
  echo Installing git
  sh -c "$(brew install git)"
fi

if command -v yq &>/dev/null; then
  echo Found yq
else
  echo Installing yq
  sh -c "$(brew install yq)"
fi

if command -v jq &>/dev/null; then
  echo Found jq
  sh -c "$(chmod u+x "$(command -v jq)")"
else
  echo Installing jq
  sh -c "$(brew install jq)"
fi

if command -v oc &>/dev/null; then
  echo Found openshift-cli
else
  echo Installing openshift-cli
  sh -c "$(brew install openshift-cli)"
fi

if command -v tkn &>/dev/null; then
  echo Found tektoncd-cli
else
  echo Installing tektoncd-cli
  sh -c "$(brew install tektoncd-cli)"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  CODE_APP="/Applications/Visual Studio Code.app"

  if [[ -e $CODE_APP ]]; then
    echo Found Visual Studio Code
  else
    echo Installing Visual Studio Code
    sh -c "$(brew install --cask visual-studio-code)"
  fi
fi

CODE_CLI="/usr/local/bin/code"

if [ -f "${CODE_CLI}" ]; then
  echo Found Visual Studio Code CLI
else
  echo Installing Visual Studio Code CLI
  ln -s "$CODE_APP/Contents/Resources/app/bin/code" $CODE_CLI
fi

if [[ $(code --list-extensions) == *ms-vsliveshare.vsliveshare* ]]; then
  echo Found Visual Studio Code Liveshare extension
else
  echo Installing Visual Studio Code Liveshare extension
  sh -c "$(code --install-extension ms-vsliveshare.vsliveshare)"
fi

if [[ $(code --list-extensions) == *redhat.vscode-yaml* ]]; then
  echo Found Visual Studio Code redhat.vscode-yaml extension
else
  echo Installing Visual Studio Code redhat.vscode-yaml extension
  sh -c "$(code --install-extension redhat.vscode-yaml)"
fi

if command -v ibmcloud &>/dev/null; then
  echo Found ibmcloud
  ibmcloud update
else
  echo Installing ibmcloud
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sh -c "$(curl -fsSL https://clis.cloud.ibm.com/install/osx | sh)"
  else
    sh -c "$(curl -fsSL https://clis.cloud.ibm.com/install/linux | sh)"
  fi
fi

if [[ $(ibmcloud plugin list) == *container-service* ]]; then
  echo Found container-service plugin
  ibmcloud plugin update container-service -f
else
  echo Installing container-service plugin
  ibmcloud plugin install container-service -f
fi

if [ -f "$NVM_DIR/nvm.sh" ]; then
    echo found nvm
else
  echo Installing nvm
  sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh)"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts
echo Setting node default to lts
nvm alias default 'lts/*'

if command -v igc &>/dev/null; then
  echo Found igc
else
  echo Installing igc
  npm install -g --silent @ibmgaragecloud/cloud-native-toolkit-cli
fi

ICC_CLI="${HOME}/.local/bin/icc"
ICC_URL="https://raw.githubusercontent.com/upslopeio/ibm-cloud-garage-training/main/computer-setup/icc"

if [ -f "${ICC_CLI}" ]; then
  echo Found icc
else
  echo Installing icc
  mkdir -p ~/.local/bin
  curl -sSL -o "${ICC_CLI}" "${ICC_URL}"
  chmod u+x "${ICC_CLI}"
fi

curl -sSL -o ~/bin/icc https://raw.githubusercontent.com/upslopeio/ibm-cloud-garage-training/main/computer-setup/icc

if grep -qE '^export ICC_HOME=.*\$HOME/.local' ~/.zshrc; then
  echo Found HOME in PATH
else
  echo Adding HOME/bin to path
  echo 'export ICC_HOME="$HOME/.local"' >> ~/.zshrc
fi

if grep -qE '^export PATH=.*\$HOME/.local/bin' ~/.zshrc; then
  echo Found HOME in PATH
else
  echo Adding HOME/bin to path
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

if grep -qE '^export NVM_DIR="\$HOME/.nvm"' ~/.zshrc; then
  echo Found NVM_DIR
else
  echo Adding NVM_DIR
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
fi

if grep -qE '^\[ -s "\$NVM_DIR/nvm.sh" \] \&\& \\. "\$NVM_DIR/nvm.sh"' ~/.zshrc; then
  echo Found NVM loaded in ~/.zshrc
else
  echo Adding NVM load to ~/.zshrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
fi

if [ ! -d ~/.npm-packages/bin ]; then
  mkdir -p ~/.npm-packages/bin
fi

set +e

echo
echo Collecting results....
echo

SLACK_VERSION="Unknown"

if [[ "$OSTYPE" == "darwin"* ]]; then
  git config --global credential.helper osxkeychain
  SLACK_VERSION=$(defaults read /Applications/Slack.app/Contents/Info.plist CFBundleShortVersionString)
fi

CODE_VERSION="Unknown"

if [[ "$OSTYPE" == "darwin"* ]]; then
  CODE_VERSION=$(code --version 2>&1)
fi

BREW_VERSION=$(brew --version 2>&1)
BREW_DOCTOR=$(brew doctor 2>&1)
DOCKER_VERSION=$(docker version 2>&1)
GIT_VERSION=$(git --version 2>&1)
GIT_CONFIG=$(git config --global --list 2>&1)
IBM_CLOUD_VERSION=$(ibmcloud --version 2>&1)
IBM_CLOUD_PLUGINS=$(ibmcloud plugin list 2>&1)
IGC_VERSION=$(igc --version 2>&1)
JQ_VERSION=$(jq --version 2>&1)
KUBECTL_VERSION=$(kubectl version 2>&1)
KUSTOMIZE_VERSION=$(kustomize version 2>&1)
NODE_VERSION=$(node --version 2>&1)
NPM_DOCTOR=$(npm doctor 2>&1)
NPM_VERSION=$(npm --version 2>&1)
NVM_VERSION=$(nvm --version 2>&1)
OC_VERSION=$(oc version 2>&1)
OC_PLUGINS=$(oc plugin list 2>&1)
YQ_VERSION=$(yq --version 2>&1)

# The following commands return "cannot execute binary file" for some reason
#"$(tkn verion)"
TKN_VERSION=$(which tkn 2>&1)

echo ===== RESULTS: post the following to the slack channel =====
echo

printf '**********\n%-20s: %s \n\n' "OS" "${OSTYPE:-ERROR}"
printf '**********\n%-20s: %s \n\n' "brew" "${BREW_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "brew doctor" "${BREW_DOCTOR:-ERROR}"
printf '**********\n%-20s: %s \n\n' "code" "${CODE_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "docker" "${DOCKER_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "git" "${GIT_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "git config" "${GIT_CONFIG:-ERROR}"
printf '**********\n%-20s: %s \n\n' "HOME" "${HOME:-ERROR}"
printf '**********\n%-20s: %s \n\n' "ibmcloud" "${IBM_CLOUD_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "ibmcloud plugins" "${IBM_CLOUD_PLUGINS:-ERROR}"
printf '**********\n%-20s: %s \n\n' "icc" "$(which icc)"
printf '**********\n%-20s: %s \n\n' "igc" "${IGC_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "jq" "${JQ_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "kubectl" "${KUBECTL_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "kustomize" "${KUSTOMIZE_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "node" "${NODE_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "npm" "${NPM_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "npm doctor" "${NPM_DOCTOR:-ERROR}"
printf '**********\n%-20s: %s \n\n' "nvm" "${NVM_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "nvm dir" "${NVM_DIR:-ERROR}"
printf '**********\n%-20s: %s \n\n' "nvm bin" "${NVM_BIN:-ERROR}"
printf '**********\n%-20s: %s \n\n' "oc" "${OC_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "oc plugin list" "${OC_PLUGINS:-ERROR}"
printf '**********\n%-20s: %s \n\n' "path" "${PATH:-ERROR}"
printf '**********\n%-20s: %s \n\n' "shell" "${SHELL:-ERROR}"
printf '**********\n%-20s: %s \n\n' "slack" "${SLACK_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "user" "${USER:-ERROR}"
printf '**********\n%-20s: %s \n\n' "tkn" "${TKN_VERSION:-ERROR}"
printf '**********\n%-20s: %s \n\n' "yq" "${YQ_VERSION:-ERROR}"

echo ===== RESULTS END =====

echo
echo

echo Run the following to apply the changes to the current terminal:
echo 'source ~/.zshrc'

echo
echo

echo "If the output above contains ANY error (other than 'error: You must be logged in to the server'...), run 'source ~/.zshrc' and run this script again."
echo If errors persist, post them to the slack channel

echo

echo If there are no errors, post the above RESULTS to the slack channel.
echo
echo

echo "Next, run the following commands and post the output to the slack channel"
echo 'tkn version'
