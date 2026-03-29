#!/bin/bash

echo "Removing Qt font fix..."
echo
echo "Removing QT_QPA_PLATFORMTHEME..."
echo

# remove qt5.7 font fix
$sudo "rm -f $qt5_conf_dir/90-classiclooks_qt5fontfix.conf"

# remove QT_QPA_PLATFORMTHEME from all supported shells' initialization files
for sf in "${shell_init_files[@]}"
do
  f=$(echo $sf | cut -d':' -f 2)
  #echo $f
  test -f $f && $sudo "$defn_delines; exec_delines '#classiclooks' $f"
done
