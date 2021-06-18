## Create project

```
oc sync [project name]
```

`oc sync` comes from `igc`

1. Creates the Kube namespace / OpenShift project
1. copies over some passwords that your pipeline needs in order to run

Where does it get the passwords from?

These come from the `tools` namespace which created when we ran a cluster setup script.

Cluster setup script comes from cloudnativetoolkit.dev

## Create pipeline

```
oc pipeline --tekton
```

`oc pipeline` comes from `igc`

1. Copies Tekton tasks from https://github.com/IBM/ibm-garage-tekton-tasks into your project
1. Created the Pipeline
1. Created a PipelineRun

## Will we always use Tekton?

Alternatives: Travis CI, Circle CI, Jenkins, Github Actions, ADO etc...

Jenkins was built before clouds existed. Not cloud native. Assumes disk usage.

Tekton was built from the ground up for K8s. Also comes "for free".

## Helm

Generates YAML files from templates.
