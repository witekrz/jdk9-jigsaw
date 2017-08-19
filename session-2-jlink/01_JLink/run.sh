#!/bin/bash

set -eu

source ../../common-functions.sh

echo
echo "${info} *** Running 'com.greetings.Main' from the module 'com.greetings' using the java in the 'executable' folder *** ${normal}"
echo "${info} *** The 'executable' folder is a distributable folder and we should be able to run it independent on another machine but for the same platform *** ${normal}"
echo "${info} *** Using the command-line action 'executable/bin/java [xxxxxxxxxxx] com.greetings.Main' *** ${normal}"
echo "${info} *** Please note that the distributable is platform specific *** ${normal}"
echo
executable/bin/java --module com.greetings com.greetings.Main

echo
echo "${info} *** Running 'com.greetings.Main' from the via the main jar file in a separate 'xxxx' folder using the java launcher in the 'executable' folder *** ${normal}"
echo
executable/bin/java -jar mlib/com.greetings.jar  com.greetings.Main

# * Hint: check out the packaging.sh on how and where it does this
