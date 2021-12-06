#!/bin/bash

if [ "$user" == "u" ]
then
  shell_init_files=$shell_init_files_user
  qt5_conf_dir=$qt5_conf_dir_user
  themes_dir=$themes_dir_user
elif [ "$user" == "s" ]
then
  shell_init_files=$shell_init_files_system
  qt5_conf_dir=$qt5_conf_dir_system
  themes_dir=$themes_dir_system
else
  echo "ERROR: 1@su-common.sh"
fi
