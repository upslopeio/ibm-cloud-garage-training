# OpenShift

## Login

1. Find the cluster in IBM cloud
    1. Need to make sure you are in DTEV2
1. Click "OpenShift Web Console"
    1. If there's an error - refresh the page, try again
1. Click on your name
1. Click "Copy Login Command"
1. Click "Display Token"
1. Copy the entire `oc login...` command and paste it into your terminal

**✅ ✅  How do I know if I completed this step? ✅ ✅**

1. Open a new Terminal window or tab
1. Run the following command:

```
oc project
```

It's successful if the output looks like:

```
Using project...
```

Otherwise your login failed.

## Changing Projects

### At the command line

Run the following command, replacing `<project-name>` with the project you'd like to switch to.

```
oc project <project-name>
```

### In the UI

Choose your project from the project filter in the upper left.

## Common Questions

**Which project am I on?**

```
oc project
```
