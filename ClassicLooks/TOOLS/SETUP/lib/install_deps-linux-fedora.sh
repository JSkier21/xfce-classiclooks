#!/bin/bash

echo "Installing/updating dependencies..."
echo

#install gtk2 murrine engine
sudo dnf -y install gtk-murrine-engine

# install qt5 style plugins (qt5+)
sudo dnf -y install qt5-qtstyleplugins

# install Nemo FM
echo
if [ "$(exec_input "Install/update optional 'Nemo' file manager (y/N)?" y n)" == "y" ]
then
  sudo dnf -y install nemo
fi
