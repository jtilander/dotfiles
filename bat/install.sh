#!/bin/bash
CFG=$HOME/.config/bat/config

if [ -L "$CFG" ]; then
	exit 0
fi

mkdir -p $(dirname "$CFG")
rm -f "$CFG"

ln -s "$(realpath $(dirname $0)/config)" "$CFG"

exit 0
