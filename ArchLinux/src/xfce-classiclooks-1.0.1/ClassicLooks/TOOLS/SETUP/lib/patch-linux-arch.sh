#!/bin/bash

source ./lib/setenv-linux.sh
source ./lib/patch_start-linux.sh
source ./lib/install_qtfix-common.sh
sudo bash -c "source ./lib/setenv-linux.sh; source ./lib/install_deps-linux-arch.sh" # don't need to pass 'user=$user; source ./lib/su-linux.sh' for these scripts
source ./lib/patch_done-common.sh
