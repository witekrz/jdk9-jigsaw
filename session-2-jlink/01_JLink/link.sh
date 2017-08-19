#!/bin/bash

set -eu

source ../../common-functions.sh

echo ""
echo "${info} *** Removing any existing executable directories *** ${normal}"
rm -rf executable

echo ""
echo "${info} *** Create an executable version of the com.greetings module *** ${normal}"


jlink --module-path "${JAVA_HOME}"/jmods:mlib \
          --add-modules com.greetings \
          --output executable


# Check out documentation on jlink to survive at this stage

echo ""
echo "${info} *** Displaying the contents (modules) of the 'executable' folder *** ${normal}"
runTree executable

# ****************************************************************************************************************************
# The value to `--module-path` is a PATH of directories containing the packaged modules.
# Replace the path separator ':' with ';' on Microsoft Windows.
# ****************************************************************************************************************************
