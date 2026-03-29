#!/bin/bash

source ./lib/setenv-bsd-freebsd.sh
source ./lib/patch_start-bsd-freebsd.sh
source ./lib/install_qtfix-common.sh
su -m root -c bash -c "source ./lib/setenv-bsd-freebsd.sh; source ./lib/install_deps-bsd-freebsd.sh" # don't need to pass 'user=$user; source ./lib/su-bsd-freebsd.sh' for these scripts
source ./lib/patch_done-common.sh
