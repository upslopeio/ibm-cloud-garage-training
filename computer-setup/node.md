# Install Node

## Prerequisites

1. If you are a Windows user, make sure you've [installed WSL](windows.md) and that you follow these steps from within WSL (ubuntu)
1. Make sure you have [set zsh](./zsh.md) as your default shell
1. Make sure you have [homebrew](./homebrew.md)

## Using NVM (preferred)

Node versions change quickly, and if you are serious about JS development you'll need a way to run multiple versions on your machine.

The easiest way to do that is to install NVM (Node Version Manager)

1. Visit https://github.com/nvm-sh/nvm
1. Follow the instructions

At the time this article was written, the command is:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.zshrc
nvm install node
nvm alias default node
```

## Using Brew

If you (for some very specific reason) do not want to install node via NVM, you may also install it via Homebrew:

```
brew install node
```

**✅ ✅ How do I know if I installed Node correctly? ✅ ✅**

When you run the following command, you should see a version number:

```
node -v
```
