# Extends OpenShift GitOps ArgoCD with IBM Vault Plugin
# https://github.com/IBM/argocd-vault-plugin
# OpenShift GitOps 4.6/.7
FROM argoproj/argocd:v2.0.0

# Switch to root for the ability to perform install
USER root

# Install the AVP plugin (as root so we can copy to /usr/local/bin)
RUN curl -L -o argocd-vault-plugin https://github.com/IBM/argocd-vault-plugin/releases/download/v1.0.0/argocd-vault-plugin_1.0.0_linux_amd64
RUN chmod +x argocd-vault-plugin
RUN mv argocd-vault-plugin /usr/local/bin

# Switch back to non-root user
USER argocd
