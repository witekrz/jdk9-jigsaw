#!/bin/bash

set -eu

source ../../common-functions.sh

COM_GREETINGS_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/04_Packaging/com.greetings"
ORG_ASTRO_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/04_Packaging/org.astro"

echo ""
echo "${info} *** Compiling modules in '$ORG_ASTRO_FOLDER' *** ${normal}"
javac -d $ORG_ASTRO_FOLDER \
        src/org.astro/module-info.java \
        src/org.astro/org/astro/World.java

echo ""
echo "${info} *** Displaying the contents (modules) of the '$ORG_ASTRO_FOLDER' folder *** ${normal}"
runTree "$ORG_ASTRO_FOLDER"

echo ""
echo "${info} *** Compiling modules in '$COM_GREETINGS_FOLDER' *** ${normal}"
javac --module-path /home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/04_Packaging \
      -d $COM_GREETINGS_FOLDER \
      src/com.greetings/module-info.java \
      src/com.greetings/com/greetings/Main.java

echo ""
echo "${info} *** Displaying the contents (modules) of the '$COM_GREETINGS_FOLDER' folder *** ${normal}"
runTree "$COM_GREETINGS_FOLDER"

# See ../01_Greetings/compile.sh for explanations to above commands
