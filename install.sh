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
sudo apt install -y git curl scdaemon python-pip make gcc automake libtool sleuthkit pcscd hashdeep python3-pip bless terminator zsh

echo "### Adding extra repositories"
sudo add-apt-repository ppa:system76/pop

echo "###Enable Smartcard"
sudo systemctl enable --now pcscd

echo "¤¤¤Antigen"
curl -L git.io/antigen > antigen.zsh
cd ~/
mkdir .antigen
cp antigen.zsh .antigen/
touch .zshrc
cat >> .zshrc << EOF
source ~/.antingen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme candy

# Tell Antigen that you're done.
antigen apply

# GPG-card for SSH
GPG_TTY=$(tty); export GPG_TTY;
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi
gpg-connect-agent /bye
EOF

echo "###Repo time"
mkdir repos
cd repos
git clone https://github.com/secrary/SSMA.git
git clone https://github.com/VirusTotal/yara.git

# Let's clean up apt
sudo apt-get autoclean -y
sudo apt-get autoremove -y

#setting zsh
echo "###Changing to ZSH and then we are done"
chsh -s $(which zsh)
