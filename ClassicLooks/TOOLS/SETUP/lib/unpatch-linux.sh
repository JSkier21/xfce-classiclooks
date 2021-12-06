#!/bin/bash

source ./lib/setenv-linux.sh
echo
if [ "$(pwd | grep $themes_dir_user/'ClassicLooks')" ]
then
  user="u"
  user_text="YOUR OWN USER ('`whoami`')"
elif [ "$(pwd | grep $themes_dir_system/'ClassicLooks')" ]
then
  user="s"
  user_text="the whole system (SYSTEM-WIDE)"
else
  source ./lib/abort-linux.sh
fi

test "$(exec_input "Setup will remove the 'ClassicLooks'-specific system patches for $user_text, if any. Continue (y/N)?" y n)" != "y" && source ./lib/abort-common.sh #in
echo

# remove qt fix
source ./lib/su-linux.sh
source ./lib/remove_qtfix-common.sh

# remove ClassicLooks folders
source ./lib/unpatch_done-common.sh "$1"
