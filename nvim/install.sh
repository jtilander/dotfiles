#!/bin/bash

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -SsfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

pip --no-cache-dir --disable-pip-version-check install neovim
pip3 --no-cache-dir --disable-pip-version-check install neovim


if [ ! -d ~/.config/nvim/bundles ]; then
    curl -SsL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
    chmod a+x /tmp/installer.sh
    mkdir -p ~/.config/nvim/bundles
    /tmp/installer.sh ~/.config/nvim/bundles
fi

