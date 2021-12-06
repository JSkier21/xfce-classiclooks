#!/bin/bash

if [ "$user" == "u" ]
then
  echo "The 'ClassicLooks'-specific system patches have been removed for your own user ('`whoami`')."
  echo
  if [ "$(exec_input "Note: to completely remove the 'ClassicLooks' installation for your own user you must also delete all ClassicLooks folders from your own user's themes folder '$themes_dir_user'. Delete now (y/N)?" y n)" == "y" ] #in
  then
    echo
    echo "Removing 'ClassicLooks' theme folders for your own user ('`whoami`')..."
    del_themes_dir="$themes_dir_user"
#   rm -f -R $themes_dir_user/'ClassicLooks'*
  else
    del_themes_dir=""
  fi
elif [ "$user" == "s" ]
then
  echo "The system-wide 'ClassicLooks'-specific patches have been removed."
  echo
  if [ "$(exec_input "Note: to completely remove the 'ClassicLooks' system-wide installation you must also delete all ClassicLooks folders from the system-wide themes folder '$themes_dir_system'. Delete now (y/N)?" y n)" == "y" ]
  then
    echo
    echo "Removing system-wide 'ClassicLooks' theme folders..."
    del_themes_dir="$themes_dir_system"
#   $sudo "rm -f -R $themes_dir_system/'ClassicLooks'*"
  else
    del_themes_dir=""
  fi
else
  echo "ERROR: 1@unpatch_done-common.sh"
fi

for d in "$del_themes_dir"/*
do
  if [ -d "$d" -a "$(echo $d | grep ClassicLooks)" ]
  then
    for f in "$d"/*;
    do
      if [ "$(echo $f | grep classiclooks_mark)" ]
      then
        echo "Removing $d";
        cd "$HOME"
        $sudo "rm -r '$d'"
        break
      fi
    done
  fi
done

echo
echo "Setup completed, press <ENTER> to close this window."
read -s
echo
exit
