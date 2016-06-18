#!/usr/bin/env bash

set -x

# Original: https://github.com/mathiasbynens/dotfiles/blob/47268d92afbec69e3a7243a144a126bbd25bcf2c/brew.sh

brew update

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions

brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells ; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/bash
fi

brew install libtiff --with-xz
brew install sqlite --with-dbstat --with-functions --with-json1 --with-session

brew install go
brew install python --with-berkeley-db4

brew install curl --with-nghttp2 --with-openssl
brew install vim --with-override-system-vi
brew install webp --with-giflib --with-libtiff
brew install wget --with-iri --with-pcre

brew install iperf
brew install git --with-brewed-curl --with-brewed-openssl --with-brewed-svn --with-pcre
brew install git-lfs
brew install imagemagick --with-fontconfig --with-little-cms2 --with-webp
brew install mtr
brew install nmap
brew install pianobar
brew install pigz
brew install poppler --with-little-cms2
brew install pv
brew install pyenv-virtualenvwrapper
brew install speedtest_cli
brew install the_silver_searcher

# Remove outdated versions from the cellar.
brew cleanup
