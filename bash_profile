# options
set -o notify

shopt -s autocd cdspell checkjobs checkwinsize extglob histappend histreedit histverify
if [ "${BASH_VERSINFO[0]}" -ge "4" ] ; then
    shopt -s dirspell globstar nullglob
fi

export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.poetry/bin:${HOME}/.cargo/bin:${PATH}"

ANDROID_SDK_BASE="${HOME}/android-sdk-macosx"
if [ -d "${ANDROID_SDK_BASE}" ] ; then
    export PATH="${ANDROID_SDK_BASE}/platform-tools:${ANDROID_SDK_BASE}/tools:${PATH}"
fi

export BLOCKSIZE="k"
export EDITOR="vim"
export PAGER="less -FirSwX"
export MANPAGER="less -FiRswX"

export LESS="-iRw"

hash lesspipe &>/dev/null && eval "$(SHELL=/bin/sh lesspipe)"

export HISTIGNORE="&:[bf]g:exit:reset:clear:ls:pwd:[ ]*"
export HISTCONTROL="ignoreboth:erasedups"
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT='%F %T '

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# PDSH
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
export PDSH_RCMD_TYPE="ssh"

# VirtualEnv
export WORKON_HOME="${HOME}/Envs"
[ -f "${HOME}/.local/bin/virtualenvwrapper.sh" ] && source "${HOME}/.local/bin/virtualenvwrapper.sh"

# aliases
ls_alias="ls -FGhp"
if ${ls_alias} -d --color &>/dev/null ; then
    alias ls="${ls_alias} --color=auto"
else
    alias ls="${ls_alias}"
fi
alias grep="grep --color=auto"

# prompt
if hash tput &>/dev/null && tput setaf 1 &>/dev/null ; then
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

export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
export PROMPT_DIRTRIM=4
export PS1=${CLEAR}${PS1}${CLEAR}

if [ -x /opt/homebrew/bin/brew ] ; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  if [ -f "${HOMEBREW_PREFIX}/share/bash-completion/bash_completion" ] ; then
    source "${HOMEBREW_PREFIX}/share/bash-completion/bash_completion"
  fi
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ] ; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ] ; then
    . /etc/bash_completion
  fi
fi

if hash arc &>/dev/null ; then
    source "$( cd $( dirname $( readlink $( which arc )))/.. && pwd -P )/resources/shell/bash-completion"
fi

if hash java_home &>/dev/null ; then
    export JAVA_HOME=$( /usr/libexec/java_home )
fi

if hash keychain &>/dev/null ; then
    eval "$( keychain --eval $HOME/.ssh/id_rsa )"
fi

# If in tmux, make sure env is up-to-date
if [ -n "${TMUX}" ] ; then
    tmux_env_update='eval "$(/usr/bin/tmux show-env -s)"; /usr/bin/tmux setw -u automatic-rename; printf "\033]2;\033\\"'
    # Bash >=4.4 we can pre-exec an update
    if [ "${BASH_VERSINFO[0]}" -ge "4" ] && [ "${BASH_VERSINFO[1]}" -ge "4" ] ; then
        export PS0="${tmux_env_update}; ${PS0}"
    else
        export PROMPT_COMMAND="${tmux_env_update}; ${PROMPT_COMMAND}"
    fi
fi

if hash kubectl &>/dev/null ; then
    eval "$( kubectl completion bash )"
fi

if hash minikube &>/dev/null ; then
    source <(minikube completion bash)
fi

if hash aws &>/dev/null ; then
    complete -C '~/.local/aws/bin/aws_completer' aws
fi

if hash rbenv &>/dev/null ; then
    eval "$(rbenv init - bash)"
fi

if hash orb &>/dev/null ; then
  source "${HOME}/.orbstack/shell/init.bash" 2>/dev/null || :
fi

[[ -r "${HOME}/.bash_local" ]] && source "${HOME}/.bash_local"
