# Openshift

- [Cheatsheet](./cheatsheet.md)

## Pipeline Failures

**build stage**

| Error Message                                                                                       | Solution                                           |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------- |
| `error reading info about "/source/Dockerfile": stat /source/Dockerfile: no such file or directory` | [Containerize the application](../react/docker.md) |

**deploy stage**

| Error Message                                                       | Solution                                                                                                                                                                                                                                                     |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `cp: can't create directory '/<directory-name>': Permission denied` | [Add helm charts](../helm)                                                                                                                                                                                                                                   |
| `error: deployment "react-intro" exceeded its progress deadline`    | This means the pods never came up. If you login to the project from terminal and run `oc get pods`, look for the pod that is failing (it will not be named using the pipeline run). You should see they are not running. Then describe / log them to see why |

**helm-release stage**

| Error Message                                                  | Solution                                                                                                 |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `It looks like your Artifactory installation is not complete.` | Instructor should follow setup instructions at <https://cloudnativetoolkit.dev/admin/artifactory-setup/> |
