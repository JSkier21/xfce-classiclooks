#!/bin/bash

echo "Installing/updating dependencies..."
echo

#install gtk2 murrine engine
sudo apt-get -y install gtk2-engines-murrine

# install qt5 style plugins (qt5+)
sudo apt-get -y install qt5-style-plugins

# install Nemo FM
echo
if [ "$(exec_input "Install/update optional 'Nemo' file manager (y/N)?" y n)" == "y" ]
then
  sudo apt-get -y install nemo
fi
