#!/bin/bash
o patch -n openshift-gitops argocd openshift-gitops -p "$(cat rollout-extension-ui-patch.yaml)" --type merge
o -n openshift-gitops rollout restart deployment argo-rollouts cluster gitops-plugin openshift-gitops-applicationset-controller openshift-gitops-dex-server openshift-gitops-redis openshift-gitops-server openshift-gitops-repo-server
o -n openshift-gitops rollout restart statefulset openshift-gitops-application-controller

