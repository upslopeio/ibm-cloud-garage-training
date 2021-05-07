# CI with Tekton

## Prerequisites

1. Running `CI=true npm test` passes all tests
1. The code is checked into a Gogs repository

## Setup

Use the following instructions to set up a new continuous integrations pipeline using Tekton.

1. In the repo folder run `oc pipeline --tekton`. This will create a new pipeline and add the application to the gitops repository `qa` environment.
   - Select the Pipeline to use in the PipelineRun: select the most appropriate pipeline for your project
     - React = ibm-nodejs
   - Go = ibm-general
   - Image scan = n
   - Lint dockerfile = n
1. If successful, the pipeline run URL is printed out. (CMD+click on the URL to open in your default browser and see if the pipeline passes or fails.

   If the pipeline fails, use the troubleshooting tables below to fix the failure.

## Finding your pipeline

1. Select developer view
   ![](./developer-view.png)
1. Select pipelines
   ![](./developer-pipelines.png)
1. Filter projects by name
   ![](./developer-projects.png)

## Pipeline failures

You'll see the most errors the first time you are setting up the application.

**test stage**

| Error Message        | Solution                                                                |
| -------------------- | ----------------------------------------------------------------------- |
| The test stage fails | Run the following command locally and fix any errors `CI=true npm test` |

**build stage**

| Error Message                                                                                       | Solution                                                                                                                                                    |
| --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The build stage fails                                                                               | Run the following command locally and fix any errors `docker build -t <application-name> .` Replace `<application-name>` with the correct application name. |
| `error reading info about "/source/Dockerfile": stat /source/Dockerfile: no such file or directory` | [Containerize the application](../react/docker.md)                                                                                                          |

**deploy stage**

| Error Message                                                       | Solution                                                                                                                                                                                                                                                     |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `cp: can't create directory '/<directory-name>': Permission denied` | [Add helm charts](../helm) <br> render locally with `helm template <release-name> ./chart/base` where `<release-name>` is the name of your application in all lower case.                                                                                    |
| `error: deployment "react-intro" exceeded its progress deadline`    | This means the pods never came up. If you login to the project from terminal and run `oc get pods`, look for the pod that is failing (it will not be named using the pipeline run). You should see they are not running. Then describe / log them to see why |
| `error: object has been deleted`                                    | The namespace or Argo project has the same as your repository. Delete the namespace or Argo project and recreate it with a new unique name.                                                                                                                  |

**dockerfile-lint stage**

| Error Message               | Solution                                                                                   |
| --------------------------- | ------------------------------------------------------------------------------------------ |
| dockerfile-lint stage faile | Set `lint-dockerfile` to `false` in the pipeline parameters ![](./pipeline-parameters.png) |

**img-scan stage**

| Error Message            | Solution                                                                              |
| ------------------------ | ------------------------------------------------------------------------------------- |
| The img-scan stage fails | Set `scan-image` to `false` in the pipeline parameters ![](./pipeline-parameters.png) |

**health stage**

| Error Message                  | Solution                                                                                                 |
| ------------------------------ | -------------------------------------------------------------------------------------------------------- |
| contains `https://` in the URL | Add a `health-protocol` with a value of `http` in the pipeline parameters ![](./pipeline-parameters.png) |

**tag-release stage**

| Error Message          | Solution                                                                                                                                                                                                               |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The tag already exists | delete the tag on origin by running `git push --delete origin <tag-name>` where `[tag-name>` is replaced with the conflicting tag value. Then delete the tag locally, if it exists, by running `git tag -d <tag-name>` |

**helm-release stage**

| Error Message                                                  | Solution                                                                                                 |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| `It looks like your Artifactory installation is not complete.` | Instructor should follow setup instructions at <https://cloudnativetoolkit.dev/admin/artifactory-setup/> |

## Other failures

| Error Message                                               | Solution                                                                                                                                                                                                                                 |
| ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Pod with a status of ErrImagePull or ImagePullBackOff.      | `oc describe pod <pod-name>` to verify status - Add an [ImagePullSecret](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) for the private registry.                                                |
| Container does not run, crashes, or other application error | Diagnose pod issues by looking at the logs: <br> `oc get pod`<br> `oc describe pod <pod-name>`<br> `oc logs <pod-name>`<br> `oc logs <pod-name> -f` <- streams the logs<br> <br> Or run locally: `docker build ...` then `docker run...` |
