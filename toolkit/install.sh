#!/usr/bin/env bash

# Linux and macOS users:
# run this script in the cp-toolkit-linux or cp-toolkit-mac directory

# TODO: so far works only for the current session!
export CP_TOOLKIT_PATH=`pwd`
export PATH=${CP_TOOLKIT_PATH}/savilerow-1.6.5-mac:${PATH}

cd /usr/local/bin/
ln -s ${CP_TOOLKIT_PATH}/minion-1.8/bin/minion minion
ln -s ${CP_TOOLKIT_PATH}/savilerow-1.6.5-mac/savilerow
ln -s ${CP_TOOLKIT_PATH}/conjure-v2.0.0-macos/conjure conjure

