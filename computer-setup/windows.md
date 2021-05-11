# Windows Computer Setup Guide

- [Install the Cloud Native Toolkit](./computer-setup/cloudnative-toolkit.md)
- [Install ZSH](./computer-setup/zsh.md)
- [Install Homebrew](./computer-setup/homebrew.md)
- [Install VSCode with command line tools](./computer-setup/visual-studio-code.md)
- [Configure Git](./git/readme.md) with you your username / email, ignorecase, and credential helper
- [Create a local repository and push it to a remote](./gogs/readme.md)


You must install WSL2 in order to complete this course.

https://docs.microsoft.com/en-us/windows/wsl/install-win10

https://code.visualstudio.com/docs/remote/wsl

https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/

```
sudo apt-get update -y
sudo apt-get install build-essential -y
```

After installing Homebrew:

1. Add homebrew to your path in `~/.zshrc`

```
brew install gcc
```
