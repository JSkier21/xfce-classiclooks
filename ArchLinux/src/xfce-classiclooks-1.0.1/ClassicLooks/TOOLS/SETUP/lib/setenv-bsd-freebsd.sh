#!/bin/bash

function exec_delines() {
  local x
# a=`whoami`
# echo $a
  x="sed -i '' '/$1/d' '$2'"
# echo $x
  eval $x
}
defn_delines=`declare -f exec_delines`

cp_no_attributes="cp "

themes_dir_system="/usr/local/share/themes"
themes_dir_user="$HOME/.themes"
qt5_conf_dir_system="/usr/local/etc/fonts/conf.d"
qt5_conf_dir_user="$HOME/.config/fontconfig/conf.d"

source ./lib/setenv-common.sh
