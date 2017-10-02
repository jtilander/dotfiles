#!/usr/bin/env bash
set -e

[ ! -d ~/.vim ] && mkdir ~/.vim
[ ! -d ~/.vim/autoload ] && mkdir -p ~/.vim/autoload
[ ! -d ~/.vim/pack/kitchen ] && mkdir -p ~/.vim/pack/kitchen
[ ! -d ~/.vim/pack/kitchen/start ] && mkdir -p ~/.vim/pack/kitchen/start
[ ! -d ~/.vim/pack/kitchen/opt ] && mkdir -p ~/.vim/pack/kitchen/opt

## Install vim plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -SsfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.vim/colors/molokai.vim ]; then
	curl -SsLo ~/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
fi


# Install the plugins listed.
vim -c "PlugInstall" -c "qall"  > /dev/null 2>&1

