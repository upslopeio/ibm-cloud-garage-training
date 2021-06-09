```
title Continuous Integration

participant Developer
participant Code Repo
participant Tekton
participant Image Registry
participant Artifactory
participant Argo
participant K8s Dev
participant GitOps Repo

Developer->Code Repo: git push
Code Repo->Tekton: webhook
note right of Tekton: setup
Tekton->Code Repo: git pull
note right of Tekton: npm test
note right of Tekton: build
Tekton->Image Registry: docker push
note right of Tekton: deploy
Tekton->K8s Dev: helm upgrade
K8s Dev->Image Registry: docker pull
note right of K8s Dev: docker run...
note right of Tekton: health
Tekton->K8s Dev: GET /health
note right of Tekton: tag-release
Tekton->Code Repo: add tag
note right of Tekton: img-release
Tekton->Image Registry: docker push
note right of Tekton: helm-release
Tekton->Artifactory: publish helm chart
note right of Tekton: gitops
Tekton->GitOps Repo: update QA folder
```