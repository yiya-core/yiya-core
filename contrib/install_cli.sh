 #!/usr/bin/env bash

 # Execute this file to install the yiya cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Yiya-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Yiya-Qt.app/Contents/MacOS/yiyad /usr/local/bin/yiyad
 sudo ln -s ${LOCATION}/Yiya-Qt.app/Contents/MacOS/yiya-cli /usr/local/bin/yiya-cli
