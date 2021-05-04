# How to use Git Credential Helper to store repository credentials

You know the pain, you cloned a repo over HTTP/S, and now Git asks you for your password each time you want to push or pull.

**✅ ✅ How do I know if I completed this step? ✅ ✅**

Confirm your global settings contain `credential.helper=...` by running the following command

```shell
git config --global --list
```

> type Q to quit out of git config list command

If the `credential.helper=` is set to one of the following values, you have what you need!

- `osxkeychain` on MacOS
- `manager-core` on Windows

## MacOS

Chances are you already have the `git credential-osxkeychain` command installed.

Tell Git to use the KeyChain to store your credentials:

```shell
git config --global credential.helper osxkeychain
```

If the above command does not work, install Git using brew: `brew install git`, then try the command again.

Next time you clone a repo via HTTP/S, you’ll be prompted to grant access to KeyChain.
Any future authentication will be done transparently by Git reading the KeyChain record.

## Windows

Chances are you already have the `git credential-manager-core` command installed.

Tell Git to use the credential-manager-core to store your credentials:

```shell
git config --global credential.helper manager-core
```

If the above command does not work, follow the installation instructions at <https://github.com/microsoft/Git-Credential-Manager-Core> and try the command again.

Next time you clone a repo via HTTP/S, you’ll be prompted to grant access to KeyChain.
Any future authentication will be done transparently by Git reading the KeyChain record.
