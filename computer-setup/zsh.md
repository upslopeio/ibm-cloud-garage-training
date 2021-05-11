# Computer Setup > ZSH

ZSH (zshell) is the new default shell for Mac, and many of the commands in the course work better with zshell.

**✅ ✅ How do I know if I completed this step? ✅ ✅**

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

## Mac

```
brew install zsh
```

If you see `cannot find brew` it means you have to [install homebrew](./homebrew.md).

## Windows

From the WSL Terminal

```
sudo apt-get update -y
sudo apt-get install build-essential zsh -y 
```
