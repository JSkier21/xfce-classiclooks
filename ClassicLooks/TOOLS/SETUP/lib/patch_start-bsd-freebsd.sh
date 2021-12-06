#!/bin/bash

echo
if [ -f '/usr/local/share/themes/ClassicLooks/classiclooks_mark' -o -f '/usr/share/themes/ClassicLooks/classiclooks_mark' ]
then
  echo "FAIL"
  echo "----"
  echo "Cannot run setup: the 'ClassicLooks' theme appers to be installed for all users in themes folder(s) '/usr/local/share/themes' and/or '/usr/share/themes'."
  echo
  echo "If you beleive (some of) the dependencies are not properly installed, then you can uninstall 'ClassicLooks' from your system as follows:"
  echo " - SYSTEM-WIDE MANUAL INSTALLATION IS NOT SUPPORTED ON FREEBSD: if you have manually copied the 'ClassicLooks' theme folders from the 'classiclooks-n.n.n.zip' archive into your system-wide themes folder(s) '/usr/local/share/themes' and/or '/usr/share/themes' then you must manually delete all the 'ClassicLooks' folders from your system-wide themes folder(s)"
  echo " - if you installed 'ClassicLooks' by using your package manager then you can uninstall it by using your package manager"
  echo
  echo "After you have removed the system-wide installation of 'ClassicLooks' you can then re-install it as follows:"
  echo " - you can install 'ClassicLooks' system-wide (a.k.a for \"all users\") ONLY BY USING YOUR PACKAGE MANAGER (e.g. from your distribution's repository), or"
  echo " - you can install 'ClassicLooks' for your own user by extracting AT LEAST the 'ClassicLooks' base theme folder from the 'classiclooks-n.n.n.zip' archive into your own user's themes folder '$themes_dir_user', and then run setup for your own user from '$themes_dir_user/ClassicLooks/TOOLS/SETUP/'"
  source ./lib/abort-common.sh
elif [ "$(pwd | grep $themes_dir_user/'ClassicLooks')" ]
then
  user="u"
  source ./lib/su-bsd-freebsd.sh
else
  source ./lib/abort-bsd-freebsd.sh
fi

test "$(exec_input "Setup will install the 'ClassicLooks'-specific system patches for YOUR OWN USER ('`whoami`'). Continue (y/N)?" y n)" != "y" && source ./lib/abort-common.sh #in
echo
