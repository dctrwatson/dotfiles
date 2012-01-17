# ssh/gpg agent
eval `keychain --clear --eval $HOME/.ssh/id_rsa`
source $HOME/.keychain/$HOSTNAME-sh
source $HOME/.keychain/$HOSTNAME-sh-gpg

source $HOME/.bashrc
