#!/bin/bash

set -eu

source ../../common-functions.sh

COM_GREETINGS_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/02_GreetingsWorld/org.grettings"
ORG_ASTRO_FOLDER="/home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/02_GreetingsWorld/org.astro"

echo ""
echo "${info} *** Displaying the contents (source files) of the 'src' folder *** ${normal}"
runTree src

echo ""
echo "${info} *** Compiling module in folder $ORG_ASTRO_FOLDER *** ${normal}"
javac -d $ORG_ASTRO_FOLDER \
      src/org.astro/module-info.java src/org.astro/org/astro/World.java

echo ""
echo "${info} *** Displaying the contents (modules) of the '$ORG_ASTRO_FOLDER' folder *** ${normal}"
runTree "$ORG_ASTRO_FOLDER"

echo ""
echo "${info} *** Compiling module in folder '$COM_GREETINGS_FOLDER' and linking it with module '$ORG_ASTRO_FOLDER' *** ${normal}"
javac --module-path /home/witek/workspace/jdk9-jigsaw/session-1-jigsaw-intro/02_GreetingsWorld \
      -d $COM_GREETINGS_FOLDER \
      src/com.greetings/module-info.java src/com.greetings/com/greetings/Main.java

#
# * check in the respective module folder for names of the source files, hint: should it also contain file with module information?
#
# *************************************************************************************
#
# In the above the module 'org.astro' exports the package 'org.astro' and the module 'com.greetings' imports the package 'org.astro'.
# The modules must be compiled in this order, in order for the compiler to find the dependency and fulfill it.
#
# *************************************************************************************

echo ""
echo "${info} *** Displaying the contents (modules) of the '$COM_GREETINGS_FOLDER' folder *** ${normal}"
runTree "$COM_GREETINGS_FOLDER"

# See ../01_Greetings/compile.sh for explanations to above commands
