# Background: Kubernetes and OpenShift

K8s is a container orchestration platform.

- K8s can run your docker containers and optionally make them available to the internet

K8s is kind of "the operating system of the cloud".

OpenShift a suite of tools built on top of K8s. It provides concepts like:

- Projects
- Apps

Class has a kubernetes cluster.

# Connecting to the OpenShift Cluster

`$HOME/bin` needs to be in your path.

`oc` - OpenShift CLI. The main way we interact with the cluster. You can also interact with the cluster from the console.

- Installed to `$HOME/bin`

`icc` - bash script that automates some common cluster switching activities. Allows quick cluster switching.

- `ibmcloud-account.yaml`
- `ibmcloud.yaml`
- Sits on top of the `ibmcloud` CLI
- You can also login via "Copy Login Command" from the OpenShift Web Console

`igc` - IBM Garage CLI

- A bunch of helpful tools for things like setting up pipelines really quickly
- Is a plugin to `oc`
- Provides a `pipeline` command
- Provides a `sync` command to `oc`
- Provides a `console` command to `oc`
- Written in `node`, and installed via an NPM package
- May or may not use at a client site

`argocd` - Argo Continuous Delivery CLI (but we'll never use it)

### Others:

`kubectl` - Kubernetes CLI. We basically won't use this because `oc` delegates to `kubectl` under the hood.

- Installed to `$HOME/bin`

`ibmcloud` - IBM Cloud CLI

# Development

`git` - Version control system. Where we store snapshots / history of code AND configs.

- Both code development
- And gitops

`node` - Server-side JavaScript.

- Enables us to do client-side (React, Angular) and server-side NodeJS applications

`nvm` - Node Version Manager.

- Allows you to install multiple versions of node, and switch between them per project

`code` - command that opens Visual Studio Code

`brew` - Homebrew. Package manager. Installs other software.

React is a client-side, single-page-application

# Devops

`helm` - Helm can take templated YAML files and produce valid K8s YAML files

- For class we'll almost never use this

`docker` - Docker Desktop

- Allows you to build and run images/containers locally
- Fast feedback before running pipelines
- Trivia: can install a local K8s cluster
