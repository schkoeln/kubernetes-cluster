#!/bin/bash

# Set Variables
export $(grep -v '^#' /workspaces/kubernetes-cluster/helm-deployments/values/.env | xargs)

# Substitute placeholders in all files within the directory, excluding .substituted.yaml files
find /workspaces/kubernetes-cluster/helm-deployments/values -type f -name '*.yaml' ! -name '*.substituted.yaml' -exec sh -c '
  for file do
    envsubst < "$file" > "${file%.yaml}.substituted.yaml"
  done
' sh {} +

# Check versions
/bin/bash -c 'terraform --version && helm version && kubectl version --client'