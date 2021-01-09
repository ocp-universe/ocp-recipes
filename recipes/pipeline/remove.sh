#!/bin/sh

# Generic remove scripts, executes all resources in the right order

BASEDIR=$(dirname $0)

echo "Remove resources from '${BASEDIR}'..."
oc delete -k 02_post
oc delete -k 01_work
oc delete -k 00_pre
echo "... resources from '${BASEDIR}' removed."