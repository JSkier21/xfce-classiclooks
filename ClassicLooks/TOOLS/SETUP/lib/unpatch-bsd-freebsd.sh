#!/bin/bash

source ./lib/setenv-bsd-freebsd.sh
echo
if [ "$(pwd | grep '/usr/local/share/themes/ClassicLooks')" -o "$(pwd | grep '/usr/share/themes/ClassicLooks')" ]
then
  echo "Cannot run setup for the whole system (system-wide)."
  echo "In order to remove the system-wide 'ClassicLooks'-specific patches you must completely uninstall 'ClassicLooks' BY USING YOUR PACKAGE MANAGER."
  source ./lib/abort-common.sh
fi

if [ ! "$(pwd | grep $themes_dir_user/'ClassicLooks')" ]
then
  source ./lib/abort-bsd-freebsd.sh
fi

user="u"

test "$(exec_input "Setup will remove the 'ClassicLooks'-specific system patches for YOUR OWN USER ('`whoami`'), if any. Continue (y/N)?" y n)" != "y" && source ./lib/abort-common.sh #in
echo

# remove qt fix
source ./lib/su-bsd-freebsd.sh
source ./lib/remove_qtfix-common.sh

# remove ClassicLooks folders
source ./lib/unpatch_done-common.sh "$1"
