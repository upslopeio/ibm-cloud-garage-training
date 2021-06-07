# Cheatsheet

## Login

1. Find the cluster in IBM cloud
   1. Need to make sure you are in DTEV2
1. Click "OpenShift Web Console"
   1. If there's an error - refresh the page, try again
1. Click on your name
1. Click "Copy Login Command"

   ![](../img/openshift-copy-login-command.png)

1. Click "Display Token"
1. Copy the entire `oc login...` command and paste it into your terminal

**✅ ✅ How do I know if I completed this step? ✅ ✅**

1. Open a new Terminal window or tab
1. Run the following command:

```shell
oc project
```

It's successful if the output looks like:

```shell
Using project...
```

Otherwise, your login failed.

## Changing Projects

### At the command line

Run the following command, replacing `<project-name>` with the project you'd like to switch to.

```shell
oc project <project-name>
```

### In the UI

Choose your project from the project filter in the upper left.

## Common Questions

**Which project am I on?**

```shell
oc project
```

**Which plugins are installed?**

```shell
oc plugin list
```

Plugins are installed globally using npm. If no plugins are listed, it may because you switched node versions using `nvm` or because the global npm packages are not in your PATH.

Run the following command to find the installation location for global packages:

```shell
npm root -g
```

## More information

For detailed information, see [Getting started with the OpenShift CLI](https://docs.openshift.com/container-platform/4.7/cli_reference/openshift_cli/getting-started-cli.html)

## Debugging Steps

1. `get`
1. `describe`
1. `logs`
1. `port-forward`

List things:

```bash
oc get <type>
```

See the actual YAML

```bash
oc get <type> <name> -o yaml
```

Describe also shows you more details about the current state:

```bash
oc describe <type> <name>
```

Logs

```bash
oc logs <pod name>
oc logs <pod name> -f
oc logs <pod name> -c <container>
```

Port-forward:

```bash
oc port-forward pod/react-intro-6b7787654f-zw25x 8080:8080
oc port-forward service/react-intro 8080:80
```
