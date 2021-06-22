# Argo - Continuous Delivery for QA

## Prerequisites

> 🛑 **Stop**: make sure your pipeline is green before setting up ArgoCD

The QA folder in the Gitops repo will already have been created for you by the Tekton pipeline.

## Setup

Use the following instructions to set up a new continuous delivery controller using ArgoCD.

### Create the project

1. Determine the name of the new project.

   - For react-intro: `react-intro-<USER ID>-prod` (for example `react-intro-35-prod`)
   - For squads: `squad-<squad-number>-prod` (for example `squad-4-prod`)

1. Create the project with `oc new-project react-intro-<USER ID>-prod` (for example `oc new-project react-intro-35-prod`)

By creating the project, you will have permissions to manually edit objects in that project (like Deployments).

## Create the production folder in the GitOps repository

1. Run `oc console` to open the web console.
1. Click the "9 box" menu, then select "Git Ops", then copy the http link.
1. Clone the gitops repo:
   ```
   cd ~
   git clone <repo url>
   cd gitops
   code .
   ```
1. Find the application you want to deploy under the `/qa` folder, and copy that entire folder to the new `<environment>` folder
   ```
   mkdir -p production
   cp -r qa/react-intro-<user-number> production/
   ```
1. Git add, commit, and push to your branch.
   ```
   git add -A
   git commit -m "added production env"
   git pull
   git push
   ```

### Add ArgoCD App

1. Run `oc console` to open the web console.
1. On the OpenShift console page, Click the "9 box" menu, then select "ArgoCD"
   ![](img/argo-menu.png)
1. Accept the security warnings (easiest in Chrome)
1. Login
   - if "Login via OpenShift" is available, do that
   - if not, run `igc credentials` to get the password
1. Click "New App"
1. Fill in the form
   - General
     - Application name:
       - `react-intro-<user-number>-prod` or
       - `squad-<squad-number>-prod`
     - Project = default
   - Sync Policy = automatic
   - Check PRUNE RESOURCES and SELF HEAL
   - Check "use a schema to validate resource manifests"

- Source
  - Repository = url to gitops repository ("9 box" menu, click "Git Ops")
  - Revision = HEAD
  - Path = path to the project environment folder you just created.
    - For react-intro `<environment>/react-intro-<user-number>/react-intro`
    - For projects `<environment>/squad-<squad-number>/<repo-name>`
- Destination
  - cluster = select the one available option
  - namespace = the target namespace. Should be the same as "Application name" above
- Click create at the top

### Add the image pull policy

Now the ArgoCD app is displayed. Shortly you will notice that the pod creation failed, and it has a status of `ImagePullBackOff`.

This is because the new namespace is trying to pull images created in another namespace.

1. Give the new environment permission to pull images from qa namespace

   ```bash
   oc policy add-role-to-group system:image-puller system:serviceaccounts:<new-project-name> -n <dev-project-name>
   ```

   For example:

   ```bash
   oc policy add-role-to-group system:image-puller system:serviceaccounts:react-intro-35-prod -n react-intro-35-dev
   ```

   If successful, you will see something like the following:

   ```
   clusterrole.rbac.authorization.k8s.io/system:image-puller added: "system:serviceaccounts:<new-project-name>"
   ```

1. Click the menu on the right side of the pod in ArgoCD then select "delete". OpenShift will immediately create a new pod and this time it will have permission to pull images from the other namespace.

1. If successful, you will see something like the following when you open the ArgoCD controller (Note: every heart is green):
   ![](img/argo-success.png)

## What just happened?

You have a new Production environment.

Your CI/CD pipeline now looks like the following sequence diagram:

![](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=dGl0bGUgQ29udGludW91cyBJbnRlZ3JhdGlvbgoKcGFydGljaXBhbnQgRGV2ZWxvcGVyAAkNQ29kZSBSZXBvAB8NVGVrdG9uADINR2l0T3BzABkSQXJnAC4OSzhzIFFBAAIRUHJvZAoKAHwJLT4AcQk6IGdpdCBwdXNoCgCBBQktPgB9Bjogd2ViaG9vawoAgQ0GLT4AfQs6IHVwZGF0ZSBRQSBmb2xkZXIKQXJnbwAVD3N5bmMAEQcAgRUGAAwHCm9wdCBVADsGUHJvZHVjAIIvBQCBFwsAVxRwcm9kIHZlcnNpb24ASyNQcm9kAHwHZW5kCg&s=default)

[Click here to view/edit the diagram](https://www.websequencediagrams.com/?lz=dGl0bGUgQ29udGludW91cyBJbnRlZ3JhdGlvbgoKcGFydGljaXBhbnQgRGV2ZWxvcGVyAAkNQ29kZSBSZXBvAB8NVGVrdG9uADINR2l0T3BzABkSQXJnAC4OSzhzIFFBAAIRUHJvZAoKAHwJLT4AcQk6IGdpdCBwdXNoCgCBBQktPgB9Bjogd2ViaG9vawoAgQ0GLT4AfQs6IHVwZGF0ZSBRQSBmb2xkZXIKQXJnbwAVD3N5bmMAEQcAgRUGAAwHCm9wdCBVADsGUHJvZHVjAIIvBQCBFwsAVxRwcm9kIHZlcnNpb24ASyNQcm9kAHwHZW5kCg&s=default)

## Promoting a new version to production

1. Make a change to the application (for example changing the text in the `App.js` component)
1. Wait for the Tekton pipeline to go green
1. Update GitOps repository
   ```
   cd ~/gitops
   git pull
   ```
1. Find the QA version of your app, and the latest app version
1. Update the version in the `<environment>/project<user-number>/<app-repo-name>/requirements.yaml` file to match QA
1. Commit and push
   ```
   git add -A
   git commit -m "bump production version"
   git push
   ```
1. Open the ArgoCD app and note the new version is running in production.

## Resources:

- https://github.com/argoproj/argo-cd/issues/2650
- https://argoproj.github.io/argo-cd/faq/#why-is-my-app-out-of-sync-even-after-syncing
