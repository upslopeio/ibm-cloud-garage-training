# Openshift

- [Cheatsheet](./cheatsheet.md)

## ICC

If you run `icc <cluster-name>` to log into a cluster and you see the following:

```
Logging into ibmcloud: us-south/Default
Logging into OpenShift cluster <cluster-name> with server url https://cXXXX.us-south.containers.cloud.ibm.com:30350
Error from server (InternalError): Internal error occurred: unexpected response: 500
```

It is because you have not yet visited that cluster's OpenShift web console in the browser.

## ibmcloud plugins

There are two plugins that must be installed for ibmcloud, verify they are installed by running the following command:

```shell
ibmcloud plugin list
```

which should print something like the following (versions may be higher):

```shell
Listing installed plug-ins...

Plugin Name                            Version   Status             Private endpoints supported
container-registry                     0.1.518   Update Available   true
container-service/kubernetes-service   1.0.258                      false
```

| Missing Plugin                       | Install command                              |     |
| ------------------------------------ | -------------------------------------------- | --- |
| container-registry                   | `ibmcloud plugin install container-registry` |     |
| container-service/kubernetes-service | `ibmcloud plugin install container-service`  |     |

## oc sync <project-name> failures

The successful output from this command is:

```shell
Setting up namespace <project-name>
Setting up namespace: <project-name>
Checking for existing project: <project-name>
Creating project: <project-name>
Copying ConfigMaps
Copying Secrets
Setting current project to <project-name>
```

If you do not see all the above output, the command failed. (the code ignores all errors!)

| Error Message                          | Solution                                                                                                                                             |
| -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| None but some output lines are missing | Run `ibmcloud ks api`, if that fails with `FAILED 'ks' is not a registered command.` then run `ibmcloud plugin install container-service` to fix it. |

## oc pipeline --tekton failures

| Error Message                                                                            | Solution                                                                                                                                                                                                                |
| ---------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Error creating pipeline: "Not a git repository"                                          | cd into the application repository folder                                                                                                                                                                               |
| Error creating pipeline: It appears the kubernetes environment has not been initialized. | Go to OpenShift → Click on Your Name → Click "Copy Login Command" → Click Display Token → copy `oc login --token=...` → Paste command in the terminal and hit enter.                                                    |
| Error identifying git host                                                               | run `oc delete project project[user-number]-dev` where `[user-number]` is replaced with your assigned user number. <br> Wait a minute or two.<br>run `oc sync project[user-number]-dev` then run `oc pipeline --tekton` |
| Pipeline is not triggered when pushing to master branch                                  | pipeline webhook wasn't created. Run `oc project project[user-number]-dev` where `[user-number]` is replaced with your assigned user number.<br>cd into the application repository folder<br>Run `oc sync`              |
| Every time I git push, my pipeline runs twice                                            | Go to gogs, click Settings → Webhook and then delete one of the webhooks                                                                                                                                                |
