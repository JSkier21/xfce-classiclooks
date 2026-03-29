#!/bin/bash

echo
if [ -f $themes_dir_user/'ClassicLooks'/classiclooks_mark -a -f $themes_dir_system/'ClassicLooks'/classiclooks_mark ]
then
  echo "WARNING"
  echo "-------"
  test "$(exec_input "The 'ClassicLooks' theme files apper to be installed both for your own user ('`whoami`') in themes folder '$themes_dir_user', and for the whole system (system-wide) in themes folder '$themes_dir_system'. In order to prevent undesired interferences, it is advisable to keep only one of your existing installations. Exit setup (Y/n)?" y n)" != "n" && source ./lib/abort-common.sh
  echo
fi

if [ "$(pwd | grep $themes_dir_user/'ClassicLooks')" ]
then
  user="u"
  user_text="YOUR OWN USER ('`whoami`')"
  source ./lib/su-linux.sh
elif [ "$(pwd | grep $themes_dir_system/'ClassicLooks')" ]
then
  user="s"
  user_text="the whole system (SYSTEM-WIDE)"
  source ./lib/su-linux.sh
else
  source ./lib/abort-linux.sh
fi

test "$(exec_input "Setup will install the 'ClassicLooks'-specific system patches for $user_text. Continue (y/N)?" y n)" != "y" && source ./lib/abort-common.sh #in
echo
