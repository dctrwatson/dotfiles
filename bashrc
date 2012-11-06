[[ $0 != -* ]] && source /etc/profile

source $HOME/.bashrc-universal

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
