#!/bin/bash

echo "Installing/updating dependencies..."
echo

# install gtk2 murrine engine
pkg install -y x11-themes/gtk-murrine-engine
pkg upgrade -y x11-themes/gtk-murrine-engine

# install qt5 style plugins (qt5+)
pkg install -y x11-themes/qt5-style-plugins
pkg upgrade -y x11-themes/qt5-style-plugins

# install Nemo FM
echo
if [ "$(exec_input "Install/update optional 'Nemo' file manager (y/N)?" y n)" == "y" ]
then
  pkg install -y x11-fm/nemo
  pkg upgrade -y x11-fm/nemo
fi
