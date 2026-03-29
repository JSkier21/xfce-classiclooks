#!/bin/bash

test -z "$BASH_VERSION" && echo && echo "Shell 'bash' not found, you must install 'bash' to use this script." && read -s && exit
cd "$(dirname "${BASH_SOURCE[0]}")"

source ./lib/select_os-common.sh "The 'ClassicLooks'-specific system patches will be removed from your system."

if [ "$os" == "debian" ]
then
  source ./lib/unpatch-linux.sh "$1"
elif [ "$os" == "ubuntu" ]
then
  source ./lib/unpatch-linux.sh "$1"
elif [ "$os" == "arch" ]
then
  source ./lib/unpatch-linux.sh "$1"
elif [ "$os" == "fedora" ]
then
  source ./lib/unpatch-linux.sh "$1"
elif [ "$os" == "freebsd" ]
then
  source ./lib/unpatch-bsd-freebsd.sh "$1"
else
  echo "ERROR: 1@unpatch.sh"
  read -s
fi
