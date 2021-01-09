#!/bin/sh

# Generic install scripts, executes all resources in the right order

# Execute the given script if exists
exec_if_exist() {

    test -x $SRC_RECIPE/$1 && $SRC_RECIPE/$1
}

# Apply the resource files if exist, using kustomize or normal k8s
apply_resources() {

    p=$SRC_RECIPE/$1
   
    if [ -n "$(find $p -maxdepth 1 -name '*.yaml' -print -quit)" ]
    then

        if [ -x $p"/kustomization.yaml" ]
        then
            echo "applying with kustomize resources from: $p"
            echo "---------------------------------------"
            oc apply -k $p 
            echo "---------------------------------------"
            echo ""
        else
            echo "applying resources from: $p"
            echo "---------------------------------------"
            oc apply -f $p
            echo "---------------------------------------"
            echo ""
        fi
    fi
}

SRC_RECIPE=$1

if [ -z $SRC_RECIPE ]
then 
    echo "usage: install.sh <recipe root dir>"
    exit -1;
fi

BASEDIR=$(basename $SRC_RECIPE)

echo "Source Recipe: ${SRC_RECIPE}"

echo "Install resources from '${BASEDIR}'..."
exec_if_exist 00_pre/prepare.sh 
apply_resources 00_pre/

exec_if_exist 01_pre/work.sh 
apply_resources 01_work/

exec_if_exist 02_post/post.sh 
apply_resources 02_post/
echo "... resources from '${BASEDIR}' installed."
echo ""