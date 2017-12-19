#!/usr/bin/env bash
set -e

if [ "$(uname -s)" == "Darwin" ]; then
	prefix="$HOME/Library/Application Support/Sublime Text 3"
	keymap="Default (OSX).sublime-keymap"
else
	prefix="$HOME/.config/sublime-text-3"
	keymap="Default (Linux).sublime-keymap"
fi


function symlink_preference() {
	name=$1
	original="$prefix/Packages/User/$name"
	new="$HOME/.dotfiles/sublime/$name"
    if [ ! -d "$prefix/Packages/User" ]; then
        mkdir -p "$prefix/Packages/User"
    fi
	if [ -f "$original" ]; then
     	rm "$original"
	fi
	if [ ! -h "$original" ]; then
		ln -s "$new" "$original"
	fi
}

if [ ! -d "$prefix" ]; then
    mkdir -p "$prefix"
fi


if [ "$(uname -s)" != "Darwin" ]; then
    if [ ! -f "$prefix/.package_installed" ]; then
        export DEBIAN_FRONTEND=noninteractive
        sudo apt-get -y install wget apt-transport-https
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
        sudo apt-get -y update
        sudo apt-get -y install sublime-text

        touch "$prefix/.package_installed"
    fi
fi


echo 'Linking SublimeText preferences'
if [ ! -f "$prefix/Installed Packages/Package Control.sublime-package" ]; then
	if [ ! -d "$prefix/Installed Packages" ]; then
        mkdir -p "$prefix/Installed Packages"
    fi
    curl -sSL -f "https://packagecontrol.io/Package%20Control.sublime-package" > "$prefix/Installed Packages/Package Control.sublime-package"
fi
symlink_preference 'Preferences.sublime-settings'
symlink_preference 'Anaconda.sublime-settings'
symlink_preference 'Package Control.sublime-settings'
symlink_preference "$keymap"


