# options
set -o notify

shopt -s cdspell checkwinsize dirspell extglob histappend

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

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null;
then
  CLEAR="\[\e[0m\]"
  RED="\[\e[01;31m\]"
  GREEN="\[\e[01;32m\]"
  BLUE="\[\e[01;34m\]"

  if [[ ${UID} == 0 ]] ; then
    PS1="${RED}\H${BLUE} \w # "
  else
    PS1="${GREEN}\u@\H${BLUE} \w \$ "
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

# bash completions
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
