# One-time Git Configuration

The following commands will configure git with your username and email.

```shell
git config --global user.name "<your actual name>"
git config --global user.email "you@ibm.com"
```

> If you want to use your personal email address for your personal Github account, go for it.

MacOS and Windows are case-insensitive operating systems, but with git you might be working with other users on a case-sensitive operating system. To avoid problems with file names that differ only in case, run the following command to make git case-sensitive.

```shell
git config --global core.ignorecase false
```

## Credential Helper

The git credential helper will transparently provide your credentials for authentication by securely storing your credentials.

After enabling the credential helper, the next time you clone a repo via HTTP/S, you’ll be prompted to grant access to credential storage (Keychain or Core).
The, any future authentication will be done transparently by Git reading the credential record.

Chances are you already have a credential helper installed; in this section you will configure git to use it.

### MacOS

Run the following command to make sure you have the credential manager installed.

```shell
git credential-osxkeychain
```

It should print something like `usage: git credential-osxkeychain <get|store|erase>`

Tell Git to use the KeyChain to store your credentials:

```shell
git config --global credential.helper osxkeychain
```

If the above command does not work, install Git using brew: `brew install git`, then try the command again.

Next time you clone a repo via HTTP/S, you’ll be prompted to grant access to KeyChain.
Any future authentication will be done transparently by Git reading the KeyChain record.

### Windows

Run the following command to make sure you have the credential manager installed.

```shell
git credential-manager-core
```

It should print something like `usage: git credential-manager-core <get|store|erase>`

Then, tell git to use the credential-manager-core to store your credentials:

```shell
git config --global credential.helper manager-core
```

If the above command does not work, follow the installation instructions at <https://github.com/microsoft/Git-Credential-Manager-Core> and try the command again.

**✅ ✅ How do I know if I completed this step? ✅ ✅**

Confirm your settings are correct by running the following command:

```shell
git config --global --list
```

> type Q to quit out of git config list command

If all the information is correct, you have what you need!

For more information, see [this Atlassian article](https://support.atlassian.com/bitbucket-cloud/docs/configure-your-dvcs-username-for-commits/).
