eval `keychain --eval $HOME/.ssh/id_rsa`
source $HOME/.keychain/$HOSTNAME-sh
source $HOME/.keychain/$HOSTNAME-sh-gpg

alias vi=vim

BLOCKSIZE=k; export BLOCKSIZE
EDITOR=vi; export EDITOR
PAGER=less; export PAGER

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
