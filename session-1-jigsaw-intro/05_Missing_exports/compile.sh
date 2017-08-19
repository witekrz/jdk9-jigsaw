#!/bin/bash

set -eu

source ../../common-functions.sh

COM_GREETINGS_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/05_Missing_exports/com.greetings"
ORG_ASTRO_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/05_Missing_exports/org.astro"

echo ""
echo "${info} *** Compiling modules in $ORG_ASTRO_FOLDER (with 'exports' commented out) *** ${normal}"
javac -d $ORG_ASTRO_FOLDER \
       src/org.astro/module-info.java \
       src/org.astro/org/astro/World.java

echo ""
echo "${info} *** Displaying the contents (modules) of the '$ORG_ASTRO_FOLDER' folder *** ${normal}"
runTree "$ORG_ASTRO_FOLDER"

echo ""
echo "${info} *** Compiling modules in $COM_GREETINGS_FOLDER (fails with an error due to module 'org.astro' not being visible) *** ${normal}"
javac --module-path /home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/05_Missing_exports \
      -d $COM_GREETINGS_FOLDER \
      src/com.greetings/module-info.java \
      src/com.greetings/com/greetings/Main.java

# ********************************************************************************
# Compilation does not finish due to compilation error, no artifacts are created.
# Execution does not proceed further, script exists at this point.
# ********************************************************************************

echo ""
echo "${info} *** Displaying the contents (modules) of the '$COM_GREETINGS_FOLDER' folder *** ${normal}"
runTree "$COM_GREETINGS_FOLDER"

# See ../01_Greetings/compile.sh for explanations to above commands
