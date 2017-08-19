#!/bin/bash

set -eu

source ../../common-functions.sh

COM_GREETINGS_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-2-jlink/02_JMod/mods/com.greetings"
ORG_ASTRO_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-2-jlink/02_JMod/mods/org.astro"
                                                    
echo ""
echo "${info} *** Compiling modules in $ORG_ASTRO_FOLDER *** ${normal}"
javac -d $ORG_ASTRO_FOLDER \
      src/org.astro/module-info.java \
      src/org.astro/org/astro/World.java

echo ""
echo "${info} *** Displaying the contents (modules) of the '$ORG_ASTRO_FOLDER' folder *** ${normal}"
runTree "$ORG_ASTRO_FOLDER"

echo ""
echo "${info} *** Compiling modules in $COM_GREETINGS_FOLDER *** ${normal}"
javac --module-path /home/witek/workspace/jdk9-jigsaw/session-2-jlink/02_JMod/mods \
      -d $COM_GREETINGS_FOLDER \
      src/com.greetings/module-info.java \
      src/com.greetings/com/greetings/Main.java

echo ""
echo "${info} *** Displaying the contents (modules) of the '$COM_GREETINGS_FOLDER' folder *** ${normal}"
runTree "$COM_GREETINGS_FOLDER"
