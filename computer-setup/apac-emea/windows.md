# Windows Computer Setup Guide

## Slack App

Install the [Slack App](https://slack.com/downloads/windows).

## Install Visual Studio Code

Install Visual Studio Code following these instructions:

https://code.visualstudio.com/docs/remote/wsl

Install the necessary extensions:

```bash
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension redhat.vscode-yaml
```

[Setup WSL for Visual Studio](https://code.visualstudio.com/docs/remote/wsl)

Now, when you open a new Terminal from within VSCode, it should default to a WSL linux terminal.

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

## WSL Ubuntu Side

The following instructions should be executed inside WSL.

### Ubuntu Updates

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

### oh-my-zsh

1. Go to https://ohmyz.sh/
1. Follow instructions

At the time of this writing, the command was:

```bash
bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

See also https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/

### Homebrew

**Install Homebrew**

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

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

## Docker Desktop

Follow instructions here to install Docker Desktop and configure for WSL2.

https://docs.docker.com/docker-for-windows/wsl/

## Continue with the set-up steps for Mac / Linux

At this point the Windows specific setup is complete. Please continue with the set-up with the "Automatic Install Script" section.
