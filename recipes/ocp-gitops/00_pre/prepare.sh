#!/bin/sh

# Prepare the installation

# OpenShift GitOps
# uses
# - pipeline
# - sealedsecret
# - argocd

echo "Preparing..."
../pipeline/install.sh
../sealedsecret/install.sh
../argocd/install.sh
echo "...done."
