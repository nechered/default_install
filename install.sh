#!/bin/bash

#Default debian / ubuntu install script
#v0.1 2017-10-22
#


echo "
##########################################################
# Default Debian / Ubuntu install Script                 #
##########################################################
"

# Let's pull some updates
echo "### Pulling Updates."
apt update -y

echo "### Installing Updates."
apt upgrade -y

echo "### Installing packages"
apt install -y git curl scdaemon python-pip make gcc automake libtool sleuthkit pcscd hashdeep python3-pip bless zsh

echo "### Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
