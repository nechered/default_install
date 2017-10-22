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
sudo apt update -y

echo "### Installing Updates."
sudo apt upgrade -y

echo "### Installing packages"
sudo apt install -y git curl scdaemon python-pip make gcc automake libtool sleuthkit pcscd hashdeep python3-pip bless zsh

echo "###Enable Smartcard"
sudo systemctl enable --now pcscd

echo "### Installing Antigen"
curl -L git.io/antigen > antigen.zsh



# Let's clean up apt
sudo apt-get autoclean -y
