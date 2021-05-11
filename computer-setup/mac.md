# Mac Setup Guide

Try the [Automated setup script](./setup-workstation.sh).

## Webex

Download [Webex Meetings](https://www.webex.com/downloads.html) if you haven't already.

## ZSH

If you have a modern mac, [zsh should already be your default shell](https://www.theverge.com/2019/6/4/18651872/apple-macos-catalina-zsh-bash-shell-replacement-features).

1. Open a new Terminal window (or tab)
1. Run the following command:

```
echo $SHELL
```

You have ZSH if you see the following output:

```
/bin/zsh
```

If you see something else, like `/bin/bash`, then you need to install zsh.

## Homebrew

1. Visit https://brew.sh/
1. Click the "Copy" link
1. Open a new Terminal window (or tab)
1. Paste the command and hit the ENTER key

## NodeJS

Install [NodeJS](./node.md)

## IBM Cloud CLI

Install [the IBM Cloud CLI](./ibmcloud.md)

## Visual Studio Code

Install [Visual Studio Code](./visual-studio-code.md)

## Docker Desktop

https://www.docker.com/products/docker-desktop

You can install docker via brew:

```
brew install --cask docker
```
