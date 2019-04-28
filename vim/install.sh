#!/usr/bin/env bash
set -e

[ ! -d ~/.vim ] && mkdir ~/.vim
[ ! -d ~/.vim/plugged ] && mkdir ~/.vim/plugged

# Install vim plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -SsfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install the plugins listed.
sh vim -c "PlugInstall" -c "qall"  > /dev/null 2>&1

# Now since go-vim is installed, let's install the dependencies
# vim -c "GoInstallBinaries" -c "qall"  > /dev/null 2>&1

