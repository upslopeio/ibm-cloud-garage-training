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

**✅ ✅ How do I know if I completed this step? ✅ ✅**

Confirm your settings are correct by running the following command:

```shell
git config --global --list
```

> type Q to quit out of git config list command

If all the information is correct, you have what you need!

For more information, see [this Atlassian article](https://support.atlassian.com/bitbucket-cloud/docs/configure-your-dvcs-username-for-commits/).
