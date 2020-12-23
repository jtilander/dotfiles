#!/bin/bash -e

if [ "$(uname -s)" == "Darwin" ]; then
    prefix="$HOME/Library/Application Support/Code/User"
else
    prefix="$HOME/.config/Code/User"
fi

function symlink_preference() {
    name=$1
    original="$prefix/$name"
    new="$HOME/.dotfiles/vscode/$name"
    
    mkdir -p "$prefix"
    
    if [ -f "$original" ]; then
        mv "$original" "${original}.backup"
    fi
    if [ ! -h "$original" ]; then
        ln -s "$new" "$original"
    fi
}

printf "[\e[92mok\e[0m] Linking Visual Studio Code preferences...\n"
symlink_preference 'settings.json'
symlink_preference 'keybindings.json'
