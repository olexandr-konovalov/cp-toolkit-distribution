#!/usr/bin/env bash

# URLs and archives 
# (assuming that for each system URLs of all archives have the same prefix)
MINION_URL=http://blogs.cs.st-andrews.ac.uk/constraintmodelling/files/2015/06/ 
MINION_linux=minion-1.8-linux.tar_1.gz
MINION_mac=minion-1.8-mac.tar_.gz
MINION_win=minion-1.8-windows.tar_.gz

SAVILEROW_URL=https://savilerow.cs.st-andrews.ac.uk/
SAVILEROW_linux=savilerow-1.6.5-linux.tgz
SAVILEROW_mac=savilerow-1.6.5-mac.tgz
SAVILEROW_win=savilerow-1.6.5-windows.zip

CONJURE_URL=https://github.com/conjure-cp/conjure/releases/download/v2.0.0/
CONJURE_linux=conjure-v2.0.0-linux.zip
CONJURE_mac=conjure-v2.0.0-macos.zip
CONJURE_win=conjure-v2.0.0-windows.zip

# Prefix of the directory name for the CP toolkit
# (will be continued with -linux, -mac or -win) 
DISTRO_NAME=cp-toolkit

mkdir -p wrap
cd wrap

for ARCH in linux mac win
do
  mkdir -p ${DISTRO_NAME}-${ARCH}
  cd ${DISTRO_NAME}-${ARCH}
  
  ARCHIVE=MINION_$ARCH;
  wget ${MINION_URL}${!ARCHIVE}
  gzip -dc ${!ARCHIVE} | tar xpv
  rm ${!ARCHIVE}

  ARCHIVE=SAVILEROW_$ARCH;
  wget ${SAVILEROW_URL}${!ARCHIVE}
  if [ $ARCH = win ]
  then
    unzip ${!ARCHIVE}
  else  
    gzip -dc ${!ARCHIVE} | tar xpv
  fi  
  rm ${!ARCHIVE}
  
  ARCHIVE=CONJURE_$ARCH;
  wget ${CONJURE_URL}${!ARCHIVE}
  unzip ${!ARCHIVE}
  rm ${!ARCHIVE}
  
  cd ..
  
done
