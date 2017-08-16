#!/usr/bin/env bash

wget http://blogs.cs.st-andrews.ac.uk/constraintmodelling/files/2015/06/minion-1.8-mac.tar_.gz
gzip -dc minion-1.8-mac.tar_.gz | tar xpv
rm minion-1.8-mac.tar_.gz

wget https://savilerow.cs.st-andrews.ac.uk/savilerow-1.6.5-mac.tgz
gzip -dc savilerow-1.6.5-mac.tgz | tar xpv
rm savilerow-1.6.5-mac.tgz

wget https://github.com/conjure-cp/conjure/releases/download/v2.0.0/conjure-v2.0.0-macos.zip
unzip conjure-v2.0.0-macos.zip
rm conjure-v2.0.0-macos.zip

cd savilerow-1.6.5-mac/bin
rm minion
ln -s ${CP_TOOLKIT_PATH}/minion-1.8/bin/minion minion
cd ../..

# TODO: so far works only for the current session!
export CP_TOOLKIT_PATH=`pwd`
export PATH=${CP_TOOLKIT_PATH}/savilerow-1.6.5-mac:${PATH}

cd /usr/local/bin/
ln -s ${CP_TOOLKIT_PATH}/minion-1.8/bin/minion minion
ln -s ${CP_TOOLKIT_PATH}/savilerow-1.6.5-mac/savilerow
ln -s ${CP_TOOLKIT_PATH}/conjure-v2.0.0-macos/conjure conjure

