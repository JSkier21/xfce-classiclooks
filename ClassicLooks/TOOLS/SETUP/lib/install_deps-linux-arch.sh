#!/bin/bash

echo "Installing/updating dependencies..."
echo

echo "CAUTION"
echo "-------"
echo "Setup must install/update packages on your system."
echo "If you ever used 'pacman -Sy' (instead of 'pacman -S' or 'pacman -Syu') since your last system-wide update then you MUST update your system ('pacman -Syu') before proceeding with this installation, or else you may severely compromise your system."
echo
[ "$(exec_input "Continue (y/N)?" y n)" != "y" ] && source ../lib/abort-common.sh

#install gtk2 murrine engine
sudo pacman -S --needed --noconfirm gtk-engine-murrine

# install qt5 style plugins (qt5+)
sudo pacman -S --needed --noconfirm qt5-styleplugins

# install Nemo FM
echo
if [ "$(exec_input "Install/update optional 'Nemo' file manager (y/N)?" y n)" == "y" ]
then
  sudo pacman -S --needed --noconfirm nemo
fi

# install extra icons and fonts 
echo
if [ "$(exec_input "Install/update optional 'Noto' fonts and 'elementary Xfce' icon set (y/N)?" y n)" == "y" ]
then
  sudo pacman -S --needed --noconfirm noto-fonts elementary-xfce-icons
fi
