# Computer Setup

```
which oc
```

If you don't have oc, run this command:

```
curl -sL shell.cloudnativetoolkit.dev | bash -
```

Open a new Terminal tab or run the following:

```
source ~/.zshrc
oc plugin list
```

make sure that you see "pipeline" and "sync" in the list. If not:

### If you installed node with the installer

```
echo "export PATH=\"\${HOME}/.npm/bin:\${PATH}\"" >> ~/.zshrc
source ~/.zshrc
```

Then run `oc plugin list` again.

### If you installed node via nvm

```
nvm alias default node
```

Then run `oc plugin list` again.
