#!/bin/bash

source ./lib/setenv-common.sh

echo
echo $1
echo
os="$(exec_input "Type the name of your OS distribution (or compatible), or quit the installer if none of the options is applicable (debian, ubuntu, arch, fedora, freebsd, QUIT):" debian ubuntu arch fedora freebsd QUIT)"
if [ "$os" == "quit" -o "$os" == "__DEFAULT__" ]
then
  echo
  echo "You have chosen to quit setup."
  echo "If you did not find your OS as a setup option, then you should follow the instructions in file 'ClassicLooks/TOOLS/SETUP/INSTALL' inside the theme archive."
  source ./lib/abort-common.sh
fi
echo
echo "CAUTION"
echo "======="
echo "Choosing a wrong OS distribution will have unpredictable outcome!"
echo "If you don't have a compatible distribution, then exit setup now and follow the installation instructions in file 'ClassicLooks/TOOLS/SETUP/INSTALL' inside the theme archive."
echo
test "$(exec_input "You chose the $(echo $os | tr '[:lower:]' '[:upper:]') distribution. Continue (y/N)?" y n)" != "y" && source ./lib/abort-common.sh
