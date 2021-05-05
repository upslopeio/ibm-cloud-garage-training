# CD with ArgoCD

Use the following instructions to set up a new continuous delivery controller using ArgoCD.

1. Update GitOps repository

   1. Run `oc console` to open the web console.
   1. Click the "9 box" menu, then select "Git Ops", then copy the http link
   1. In the terminal, CD to your $HOME directory `cd ~`
   1. Type `git clone `, paste in the gitops http url, hit enter.
   1. `git checkout -b project[user-number]-[environment]` or `git checkout -b squad[squad-number]-[repo-name]-[environment]`
   1. Run `code .` and find the application you want to deploy under `/qa`, and copy that entire folder to the new `[environment]` folder (i.e. production)
   1. Git add, commit, and push to your branch.
   1. Create a new pull request and immediately merge it.

1. Add ArgoCD controller
   1. Run `oc console` to open the web console.
   1. On the OpenShift console page, Click the "9 box" menu, then select "ArgoCD"
      ![](./argo-menu.png)
   1. Accept the security warnings (easiest in Chrome)
   1. Login via openshift
   1. Allow selected permissions
   1. Click "new app"
   1. Fill in the form
      - application name: Thus must be unique to the entire cluster. use `project[user-number]-[repo-name]-[environment]` or `squad[squad-number]-[repo-name]-[environment]`
      - project = default
      - repository = url to gitops repository ("9 box" menu, click "Git Ops")
      - Project = path to your project environment folder. Usually `[environment]/project[user-number]/[repo-name]`
      - cluster = select the one available option
      - namespace = the target namespace. Usually `project[user-number]-[environment]`
1. If successful, you will see something like the following when you open the ArgoCD controller:
   ![](./argo-success.png)

## Troubleshooting

**Deploy step fails with message 'error: object has been deleted'**

This happens when you've named your Argo project the same as your repo name.

Delete the Argo project and recreate it with a new name. See the following links for more info:

## Resources:

- https://github.com/argoproj/argo-cd/issues/2650
- https://argoproj.github.io/argo-cd/faq/#why-is-my-app-out-of-sync-even-after-syncing
