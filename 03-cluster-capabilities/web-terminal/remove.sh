#!/bin/sh

# Deleting the Web Termina components
# https://docs.openshift.com/container-platform/4.7/web_console/odc-about-web-terminal.html#deleting-the-web-terminal-components-and-custom-resources

oc delete devworkspaces.workspace.devfile.io --all-namespaces --all --wait

oc delete workspaceroutings.controller.devfile.io --all-namespaces --all --wait

oc delete components.controller.devfile.io --all-namespaces --all --wait

oc delete customresourcedefinitions.apiextensions.k8s.io workspaceroutings.controller.devfile.io

oc delete customresourcedefinitions.apiextensions.k8s.io components.controller.devfile.io

oc delete customresourcedefinitions.apiextensions.k8s.io devworkspaces.workspace.devfile.io

oc delete deployment/devworkspace-webhook-server -n openshift-operators

oc delete all --selector app.kubernetes.io/part-of=devworkspace-operator,app.kubernetes.io/name=devworkspace-webhook-server

oc delete serviceaccounts devworkspace-webhook-server -n openshift-operators

oc delete configmap devworkspace-controller -n openshift-operators

oc delete clusterrole devworkspace-webhook-server

oc delete clusterrolebinding devworkspace-webhook-server

oc delete mutatingwebhookconfigurations controller.devfile.io

oc delete validatingwebhookconfigurations controller.devfile.io

echo "----------------------------------------------"
echo "Uninstall now the Operator from the dashboard."