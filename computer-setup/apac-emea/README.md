# Computer Setup

Follow the instructions on this page, in order from top to bottom.

## Windows

Complete [Windows setup](./windows.md) instructions and then continue at the "Automatic Install Script" section on the Ubuntu side.

## Mac and Linux

Follow the instructions below.

## Automatic Install Script

This script is self-recovering, so the solution to almost any error will be to run the script again.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/upslopeio/ibm-cloud-garage-training/main/computer-setup/setup-mac-linux.sh)"
```

> Note: If the above setup script reports any `command not found` errors, run the script again. It is safe to run this script multiple times. It will eventually fix any `command not found` errors.

Post the results in the Slack channel thread for the instructor to inspect.

## Get an IBM Cloud API Key

1. Accept your invitation to the "DTETECH" account (in your email)
   ![](../img/invitation.png)
1. Log into https://cloud.ibm.com with your IBM email address
1. ‼️ Make sure that "DTETECH" is selected from the account menu (see below)
1. Click on Manage > Access (IAM)
1. Under "My IBM Cloud API keys" click "View all"
1. Click "Create an IBM Cloud API key"
1. Enter a name and create the key
1. Download the key to your computer (if you don't, you'll have to create another one)

![](../img/apikey-menu.png)

![](../img/apikey-iam.png)

![](../img/apikey-list.png)

![](../img/apikey-name.png)

![](../img/apikey-copy.png)

## Login to `ibmcloud` cli

In order to test that your account works, login using your API key.

Replace `YOUR_API_KEY` with your actual API key and then run this command:

```bash
ibmcloud login --apikey <your-api-key> -r us-south
```

Run `ibmcloud ks clusters` to see the list of clusters you can access.

> NOTE: if you are following these instructions before class starts, the cluster list might be empty, and that's OK.

You should see your cohort's cluster in the list.

If you don't, it could be because:

1. It's before class started, and we haven't created it yet
1. You created your API key in the wrong account (your personal account, as opposed to DTETECH)
1. You have not been granted access to the cluster - contact your instructor

## Access the OpenShift Cluster

In order to login to the cluster from the command line, you must first log in on the website.

1. Log into https://cloud.ibm.com with your IBM email address
1. Make sure that "DTETECH" is selected from the account menu
1. Under "Resource Summary" click "Clusters"
1. Click your cohort's cluster
1. Click "OpenShift Web Console"
1. You should see the OpenShift web console

![](../img/ibmcloud-account.png)

![](../img/ibmcloud-clusters.png)

![](../img/ibmcloud-openshift-console.png)

![](../img/openshift-web-console.png)

## Configure ICC - fast cluster switcher

1. The automatic setup script download `icc` and saved it in `~/.local/bin`, make sure it is there, if not, run the script again.
1. Run `source ~/.zshrc` to update the path of the current terminal.
1. Run `icc --add-account` - if icc is not found, run the script again and start over at step 1.
1. name the account `garage`
1. Paste in the API key you generated above
1. Run `icc --generate`

When you run `icc` you should see at least one cluster listed (the cluster for your cohort).

When you run `icc <cluster name>` you should not see an error message.

## Visual Studio Code auto save

[Turn on auto save](https://code.visualstudio.com/docs/editor/codebasics#_save-auto-save)

![](../img/vscode-autosave.png)

## WebEx

If you haven't already, [Download Webex Meetings](https://www.webex.com/downloads.html)

# Tools

Congratulations! You now have the following tools setup and ready to use:

1. [Brew](https://brew.sh/)
1. [Cloud native toolkit](https://cloudnativetoolkit.dev/setup/fast-start/) (includes `icc`)
1. [Docker Desktop](https://docs.docker.com/get-docker/)
1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
1. [IBMCloud Plugin: container-service](https://cloud.ibm.com/docs/containers?topic=containers-cs_cli_install)
1. [IBMCloud](https://github.com/IBM-Cloud/ibm-cloud-cli-release/releases/)
1. [icc](../icc)
1. [jq](https://stedolan.github.io/jq/download/)
1. [Kubernetes Tools](https://kubernetes.io/docs/tasks/tools/)
1. [Kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)
1. [Node LTS](https://nodejs.org/en/download/)
1. [nvm](https://github.com/nvm-sh/nvm#installing-and-updating)
1. [Tekton](https://github.com/tektoncd/cli)
1. [Visual Studio Code](https://code.visualstudio.com/download)
1. [WebEx](https://www.webex.com/downloads.html)
1. [yq](https://github.com/mikefarah/yq)
