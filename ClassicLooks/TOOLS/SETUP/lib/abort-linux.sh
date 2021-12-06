#!/bin/bash

echo "FAIL"
echo "----"
echo "Cannot run setup from this location."
echo "You can run setup only from an existing installation, i.e. from '$themes_dir_user/ClassicLooks/TOOLS/SETUP' if you installed 'ClassicLooks' for your own user ('`whoami`'), and/or from '$themes_dir_system/ClassicLooks/TOOLS/SETUP' if you installed 'ClassicLooks' for the whole system (system-wide)."
source ./lib/abort-common.sh
