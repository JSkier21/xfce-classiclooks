#!/bin/bash

test -z "$BASH_VERSION" && echo && echo "Shell 'bash' not found, you must install 'bash' to use this script." && read -s && exit
cd "$(dirname "${BASH_SOURCE[0]}")"

source ./lib/select_os-common.sh "The 'ClassicLooks'-specific system patches will be installed on your system."

if [ "$os" == "debian" ]
then
  source ./lib/patch-linux-debian.sh
elif [ "$os" == "ubuntu" ]
then
  source ./lib/patch-linux-ubuntu.sh
elif [ "$os" == "arch" ]
then
  source ./lib/patch-linux-arch.sh
elif [ "$os" == "fedora" ]
then
  source ./lib/patch-linux-fedora.sh
elif [ "$os" == "freebsd" ]
then
  source ./lib/patch-bsd-freebsd.sh
else
  echo "ERROR: 1@patch.sh"
  read -s
fi
