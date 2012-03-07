[[ $0 != -* ]] && source /etc/profile

# options
set -o notify
set -o vi

shopt -s cdspell
shopt -s checkwinsize
shopt -s dirspell
shopt -s extglob
shopt -s histappend

# ENV
BLOCKSIZE=k; export BLOCKSIZE
EDITOR=vi; export EDITOR
PAGER="less -FirSwX"; export PAGER
MANPAGER="less -FiRswX"; export MANPAGER

# VirtualEnv
export WORKON_HOME=$HOME/Envs
source /usr/local/bin/virtualenvwrapper.sh

# completion
source /usr/local/share/git-core/contrib/completion/git-completion.bash
complete -cf sudo

# simple spellchecker, uses /usr/share/dict/words
# https://github.com/pbrisbin/dotfiles/blob/master/.bashrc
spellcheck() {
  [[ -f /usr/share/dict/words ]] || return 1

  for word; do
    if grep -Fqx "$word" /usr/share/dict/words; then
      echo -e "\e[1;32m$word\e[0m" # green
    else
      echo -e "\e[1;31m$word\e[0m" # red
    fi
  done
}

alias ssh="TERM=rxvt-unicode ssh"
