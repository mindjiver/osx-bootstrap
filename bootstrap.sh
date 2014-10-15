#!/usr/bin/env bash

echo "######################################"
echo "#    Welcome to MacOS X bootstrap    #"
echo "######################################"
echo ""

have_brew=$(which brew > /dev/null)
if [ $? -gt 0 ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Brew already installed, updating it"
    brew update
fi

have_brew_cask=$(brew cask > /dev/null)
if [ $? -gt 0 ]; then
    brew tap phinze/cask
    brew install brew-cask
else
    echo "Brew cask already installed, skipping installation"
fi

cask_applications="adium
                   amethyst
                   caffeine
                   bankid
                   firefox
                   dropbox
                   gitx
                   github
                   gpgtools
                   openemu
                   sourcetree
                   the-unarchiver
                   vlc
                   airfoil
                   emacs
                   google-chrome
                   google-drive
                   google-earth
                   google-hangouts
                   googleappenginelauncher
                   hipchat
                   hyperdock
                   omnigraffle
                   iterm2
                   scummvm
                   spectacle
                   sparrow
                   utorrent
                   xquartz
                   kindle
                   send-to-kindle
                   spotify
                   skype
                   vagrant
                   cyberduck
                   flux
                   mactex
                   skype
                   steam
                   virtualbox
                   openemu
                   pycharm
                   rubymine
                   sqwiggle
                   totalspaces
                   tunnelblick
                   unetbootin"

for application in $(echo $cask_applications | tr " " "\n" | sort | tr "\n" " "); do
    already_installed=$(brew cask list $application 2>&1 > /dev/null)
    if [ $? -gt 0 ]; then
        brew cask install $application
    else
        echo "$application already installed"
    fi
done

brew_tools="ansible
            asciidoc
            aspell
            autoconf
            automake
            bash
            bazaar
            leiningen
            cmake
            ctags
            coreutils
            docbook
            elixir
            emacs
            erlang
            freetype
            gawk
            gdbm
            gettext
            git
            git-extras
            glib
            go
            gnu-sed
            gnupg
            graphviz
            groovy
            htop-osx
            irssi
            libevent
            libffi
            libgit2
            libpng
            libssh2
            libtool
            libyaml
            mercurial
            midnight-commander
            nmap
            oniguruma
            openssl
            pcre
            pkg-config
            pstree
            python
            python3
            pyenv-virtualenv
            rbenv
            readline
            ruby
            ruby-build
            rust
            s-lang
            ssh-copy-id
            sdl
            sqlite
            the_silver_searcher
            tig
            tmux
            unixodbc
            wget
            xz
            zsh
            zsh-syntax-highlighting
            cowsay"

for tool in $(echo $brew_tools | tr " " "\n" | sort | tr "\n" " "); do
    already_installed=$(brew list $tool 2>&1 > /dev/null)
    if [ $? -gt 0 ]; then
        brew install $tool
    fi
done

echo "Upgrading brew applications"
brew upgrade

cowsay "Your machine is now ready for action!"
