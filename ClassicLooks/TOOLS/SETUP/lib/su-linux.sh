#!/bin/bash

# "$sudo" prefix will be used for all operations which can be performed as either current user or as root
if [ "$user" == "u" ]
then
  sudo="eval "
elif [ "$user" == "s" ]
then
  sudo="sudo bash -c "
elif [ "$(exec_input "Setup 'ClassicLooks' for your own [u]ser or for [a]ll users? (a/U)" a u)" == "a" ] # never gets here in this version
then
  user="s"
  sudo="sudo bash -c "
else
  user="u"
  sudo="eval "
fi

source ./lib/su-common.sh
