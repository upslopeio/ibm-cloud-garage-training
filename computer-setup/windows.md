# Windows Computer Setup Guide

## Webex

> Windows Side

If you haven't already, [Download Webex Meetings](https://www.webex.com/downloads.html)

## WSL 2

You must install WSL2 in order to complete this course.

https://docs.microsoft.com/en-us/windows/wsl/install-win10

**NOTE:** Be sure to remember the password you set for your ubuntu user. You'll need this often.

From PowerShell, run

```powershell
wsl --list --verbose
```

Returns the Name of the Linux you installed, thr running state, the WSL version as `2` and the `*` marking default:

```text
  NAME                   STATE           VERSION
* Ubuntu-18.04           Running         2
```

If you see something else, may need to set [wsl defaults](https://docs.microsoft.com/en-us/windows/wsl/install-win10#set-your-distribution-version-to-wsl-1-or-wsl-2) . In this case, to set the particular distro as default, use `wsl --set-default Ubuntu-18.04`.

## Ubuntu Updates

> Ubuntu Side

From the WSL Terminal, run the following:

```bash
sudo apt-get update -y
sudo apt-get install build-essential zsh -y
```

Close and open your Terminal.

1. Open a new Terminal window (or tab)
1. Run the following command:

```bash
echo $SHELL
```

You have ZSH if you see the following output: `/bin/zsh`

## (Optional) oh-my-zsh

> Ubuntu Side

1. Go to https://ohmyz.sh/
1. Follow instructions

At the time of this writing, the command was:

```bash
bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

See also https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/

## Homebrew

> Ubuntu Side

**Install Homebrew**

1.  Visit https://brew.sh/
1.  Click the "Copy" link and run the command. At the time of this writing, it's:

         /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

**Add Homebrew to Path**

Add homebrew to your path in `~/.zshrc`

```bash
echo "export PATH=\"/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:\$PATH\"" >> ~/.zshrc
source ~/.zshrc
```

**Install common packages**

```bash
brew install gcc git
```

## Configure Git

> Ubuntu Side

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

> Ubuntu Side

```bash
brew install helm
```

## NodeJS with NVM

> Ubuntu Side

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

> Windows Side

Install Visual Studio Code following these instructions:

https://code.visualstudio.com/docs/remote/wsl

## Configure Visual Studio Code

> Ubuntu Side

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

Follow instructions here to install Docker Desktop and configure for WSL2.

https://docs.docker.com/docker-for-windows/wsl/

## (Optional) Slack App

It's helpful to have the [Slack App](https://slack.com/downloads/windows).

## IBM Cloud CLI

Click the link below and follow the instructions:

[Install the IBM Cloud CLI](./ibmcloud.md)
