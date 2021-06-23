# Branch-Based Tekton Pipelines

By default the pipeline created by `oc pipeline --tekton` (which comes from `igc`) only runs a single branch.

If you are on the `main` branch when you run `oc pipeline --tekton` it will only run when you push to `main`.

If you are on the `foo` branch when you run `oc pipeline --tekton` it will only run when you push to `foo`.

In order to have pipelines run for different branches, follow these instructions:

## Create the pipeline

### Create the git branch

Assuming your new branch is named `homepage` your commands would look like this:

```
git checkout -b homepage
git push -u origin homepage
```

### Create a new project

```
oc sync react-intro-35-homepage
```

### Create a new Tekton pipeline

```
oc pipeline --tekton --pipeline ibm-nodejs -p scan-image=false -p lint-dockerfile=false
```

Now, whenever you push to the `homepage` branch, it will trigger a new pipeline run.

> NOTE: there is no argo configuration added to this Tekton pipeline, so there's no QA environment. Just the app that's created by Tekton in the same namespace.

### Optionally configure Argo

If for some reason you needed to test something out in Argo (for example, you are testing changes to the configs that affect how Argo works) you can also create a new Argo App that's tied to your branch-based folder in the gitops repo.

Consider using the command line for this:

https://argoproj.github.io/argo-cd/user-guide/commands/argocd_app_create/

## Cleanup the pipeline

When you merge your code, you need to delete the pipeline.

### Delete the project

First, switch to another project.

```
oc project react-intro-35-dev
```

Then delete the branch-based project:

```
oc delete project react-intro-35-homepage
```

### Delete the webhook

1. Login to gogs
1. Go to Settings > Webhooks
1. Delete the webhook specific to your branch

### Optionally delete argo app

If you installed an Argo app, delete it.
