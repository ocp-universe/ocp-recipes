# Extends OpenShift GitOps ArgoCD with IBM Vault Plugin
# https://github.com/IBM/argocd-vault-plugin
# OpenShift GitOps 4.6/.7
FROM registry.redhat.io/openshift-gitops-1/argocd-rhel8@sha256:1da88dd045197f3a64c9508e290fd64f23dc0648bc304f6416e952d9404bee57

# Switch to root for the ability to perform install
USER root

# Install the AVP plugin (as root so we can copy to /usr/local/bin)
RUN curl -L -o argocd-vault-plugin https://github.com/IBM/argocd-vault-plugin/releases/download/v1.0.0/argocd-vault-plugin_1.0.0_linux_amd64
RUN chmod +x argocd-vault-plugin
RUN mv argocd-vault-plugin /usr/local/bin

# Switch back to non-root user
USER argocd