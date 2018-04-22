#!/bin/sh

if [ ! -d $HOME/.ssh ]; then
	mkdir -p $HOME/.ssh
fi

if [ ! -f $HOME/.ssh/config ]; then
	ln -s $HOME/.dotfiles/ssh/config $HOME/.ssh/config
fi

if [ ! -f $HOME/.ssh/authorized_keys ]; then
	ln -s $HOME/.dotfiles/ssh/authorized_keys $HOME/.ssh/authorized_keys
	chmod 0644 $HOME/.ssh/authorized_keys
fi
