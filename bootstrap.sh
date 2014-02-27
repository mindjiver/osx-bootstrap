#!/usr/bin/env bash

set -e

echo "######################################"
echo "#    Welcome to MacOS X bootstrap    #"
echo "######################################"

has_clang=$(which clang > /dev/null)
if [ $? -gt 0 ]; then
    open "https://developer.apple.com/downloads/index.action?name=for%20Xcode"
    read -p "Press enter after installing Apple command line developer tools" _
else
    echo "Apple command line developer tools installed, skipping manual download"
fi

have_brew=$(which brew > /dev/null)
if [ $? -gt 0 ]; then
    echo "Start off by downloading and install homebrew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
    echo "Brew already installed, skipping installation"
fi

have_brew_cask=$(brew cask > /dev/null)
if [ $? -gt 0 ]; then
    brew tap phinze/cask
    brew install brew-cask
else
    echo "Brew cask already installed, skipping installation"
fi

cask_applications="adium dropbox gitx github gpgtools openemu sourcetree \
                   the-unarchiver vlc airfoil emacs google-chrome iterm2 \
                   scummvm spectacle utorrent xquartz bankid firefox \
                   google-drive kindle send-to-kindle spotify vagrant \
                   cyberduck flux google-earth mactex skype steam virtualbox"

for application in $cask_applications; do
    brew cask install $application
done

brew_tools="ack asciidoc aspell autoconf automake bash bazaar leiningen cmake \
            ctags docbook elixir emacs erlang freetype gdbm gettext git \
            git-extras glib go graphviz groovy htop-osx irssi libevent \
            libffi libgit2 libpng libssh2 libtool libyaml mercurial \
            midnight-commander nmap oniguruma openssl pcre pkg-config pstree \
            python python3 rbenv readline ruby ruby-build rust s-lang sdl \
            sdl sqlite tig tmux unixodbc wget xz zsh zsh-syntax-highlighting \
            cowsay"

for tool in $brew_tools; do
    brew install $tool
done

cowsay "Your machine is now ready for action!"
