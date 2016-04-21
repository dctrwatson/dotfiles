# options
set -o notify

shopt -s cdspell checkwinsize extglob histappend

# ENV
export BLOCKSIZE=k
export EDITOR=vim
export PAGER="less -FirSwX"
export MANPAGER="less -FiRswX"

export GREP_COLOR='1;43'
export LESS="-iRw"

export HISTIGNORE="&:[bf]g:exit:reset:clear:ls:pwd:[ ]*"
export HISTCONTROL="ignoreboth:erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000

# PDSH
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
export PDSH_RCMD_TYPE="ssh"

# VirtualEnv
export WORKON_HOME=$HOME/Envs

export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=${HOME}/.pip/cache

# aliases
alias ls='ls -FGhp'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -ao'
alias la='ls -A'
alias l='ls -CF'

[ -r "${HOME}/.dbx_aliases" ] && source ${HOME}/.dbx_aliases

# prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null;
then
  CLEAR="\[\e[0m\]"
  RED="\[\e[01;31m\]"
  CYAN="\[\e[01;36m\]"
  BLUE="\[\e[01;34m\]"

  if [[ ${UID} == 0 ]] ; then
    PS1="${RED}\h${BLUE} \w # "
  else
    PS1="${CYAN}\u@\h${BLUE} \w \$ "
  fi
else
  CLEAR=""

  if [[ ${UID} == 0 ]] ; then
    PS1="\u@\h \w # "
  else
    PS1="\u@\h \w \$ "
  fi
fi

export PROMPT_DIRTRIM=4
export PS1=${CLEAR}${PS1}${CLEAR}

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if which go &>/dev/null ; then
    export GOROOT=$( go env GOROOT )
    export GOPATH=${HOME}/go
    export CGO_CFLAGS="-I/usr/local/include/zookeeper"
    export CGO_LDFLAGS="/usr/local/lib/libzookeeper_mt.a"
fi

export PATH=${HOME}/bin:${PATH}:${GOPATH}/bin

ARC_PATH="/usr/local/arcanist"
if [ -d "${ARC_PATH}/bin" ] ; then
    source ${ARC_PATH}/resources/shell/bash-completion
fi

if [ -x "/usr/libexec/java_home" ] ; then
    export JAVA_HOME=$( /usr/libexec/java_home )
fi
