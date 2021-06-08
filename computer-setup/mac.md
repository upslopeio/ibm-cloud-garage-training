# Mac Setup Guide

## Webex

If you haven't already, [Download Webex Meetings](https://www.webex.com/downloads.html)

## ZSH

If you have a modern mac, [zsh should already be your default shell](https://www.theverge.com/2019/6/4/18651872/apple-macos-catalina-zsh-bash-shell-replacement-features).

1.  Open a new Terminal window (or tab)
1.  Run the following command:

         echo $SHELL

You have ZSH if you see the following output: `/bin/zsh`

> If you see something else, like `/bin/bash`, then you need to install zsh.

## (Optional) oh-my-zsh

1.  Visit [https://ohmyz.sh/](https://ohmyz.sh/)
1.  Follow instructions. At the time of writing, it's:

         sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Automatic Install Script

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/upslopeio/ibm-cloud-garage-training/main/computer-setup/setup-mac-linux.sh)"
```

### Automatic Setup complete

If you ran the automatic setup and there were no errors, your setup is complete.

If you saw errors, you can run through the following steps to manually verify each tool is installed.

## Homebrew

1.  Visit https://brew.sh/
1.  Click the "Copy" link and run the command. At the time of this writing, it's:

         /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Configure Git

```bash
brew install git
git config --global core.ignorecase false
```

**Set your name**

```bash
git config --global --list
```

If you don't see your name and email, then run these commands:

```bash
git config --global user.name "<your actual name>"
git config --global user.email "<your actual email>"
```

## Install Helm

```bash
brew install helm
```

## NodeJS with NVM

1. Visit https://github.com/nvm-sh/nvm
1. Follow the instructions

At the time this article was written, the command is:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.zshrc
nvm install node
nvm alias default node
```

## Install Visual Studio Code

If you don't have Visual Studio Code, you can install it with Homebrew:

```bash
brew install --cask visual-studio-code
```

> If those instructions don't work, you can follow [these instructions](https://code.visualstudio.com/docs/setup/mac)

**Configure Visual Studio Code**

Install the [Live Share extension](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare):

```bash
code --install-extension ms-vsliveshare.vsliveshare
```

[Turn on Autosave](https://code.visualstudio.com/docs/editor/codebasics#_save-auto-save)

![](../img/vscode-autosave.png)

Install the YAML extension.

```bash
code --install-extension redhat.vscode-yaml
```

## Docker Desktop

You can install [docker desktop](https://www.docker.com/products/docker-desktop) via brew:

```bash
brew install --cask docker
```

## Slack App

It's helpful to have the [Slack Mac App](https://slack.com/downloads/mac).

## IBM Cloud CLI

Click the link below and follow the instructions:

[Install the IBM Cloud CLI](./ibmcloud.md)

## Finish your first Assignment

- [Assignments Repo](../git/assignments.md)
