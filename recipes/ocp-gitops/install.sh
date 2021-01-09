#!/bin/sh

# Generic install scripts, executes all resources in the right order

#../../install.sh $(dirname "${BASH_SOURCE[0]}")
../../install.sh $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )