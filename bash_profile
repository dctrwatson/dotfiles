# options
set -o notify

shopt -s cdspell checkwinsize extglob histappend
if [ "${BASH_VERSINFO}" -ge "4" ] ; then
    shopt -s dirspell globstar
fi

# ENV
export PATH="${HOME}/bin:/usr/local/sbin:${PATH}"

ANDROD_SDK_BASE="${HOME}/android-sdk-macosx"
if [ -d "${ANDROID_SDK_BASE}" ] ; then
    export PATH="${ANDROID_SDK_BASE}/platform-tools:${ANDROID_SDK_BASE}/tools:${PATH}"
fi

export BLOCKSIZE="k"
export EDITOR="vim"
export PAGER="less -FirSwX"
export MANPAGER="less -FiRswX"

export GREP_COLOR="1;43"
export LESS="-iRw"

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export HISTIGNORE="&:[bf]g:exit:reset:clear:ls:pwd:[ ]*"
export HISTCONTROL="ignoreboth:erasedups"
export HISTSIZE=10000
export HISTFILESIZE=10000

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# PDSH
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
export PDSH_RCMD_TYPE="ssh"

# VirtualEnv
export WORKON_HOME="${HOME}/Envs"

export PIP_REQUIRE_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE="${HOME}/.pip/cache"

# aliases
ls_alias="ls -FGhp"
if ${ls_alias} -d --color &>/dev/null ; then
    alias ls="${ls_alias} --color=auto"
else
    alias ls="${ls_alias}"
fi
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias ll="ls -ao"
alias la="ls -A"
alias l="ls -CF"

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
  [ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"
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

if which go &>/dev/null ; then
    export GOROOT="$( go env GOROOT )"
    export GOPATH="${HOME}/go"
    export PATH="${PATH}:${GOPATH}/bin"
    #export CGO_CFLAGS="-I/usr/local/include/zookeeper"
    #export CGO_LDFLAGS="/usr/local/lib/libzookeeper_mt.a"
fi

if which brew &>/dev/null ; then
    if [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ] ; then
        source "$(brew --prefix)/share/bash-completion/bash_completion"
    fi
    if [ -f "$(brew --prefix)/bin/virtualenvwrapper.sh" ] ; then
        source "$(brew --prefix)/bin/virtualenvwrapper.sh"
    fi
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

ARC_PATH="/usr/local/arcanist"
if [ -d "${ARC_PATH}/bin" ] ; then
    source ${ARC_PATH}/resources/shell/bash-completion
fi

if [ -x "/usr/libexec/java_home" ] ; then
    export JAVA_HOME=$( /usr/libexec/java_home )
fi

if [ -x "/usr/bin/keychain" ] ; then
    eval $( /usr/bin/keychain --eval $HOME/.ssh/id_rsa )
fi
