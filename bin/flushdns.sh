#!/bin/sh

if [ "$(uname -s)" = "Darwin" ]; then
    sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
else
	echo "> don't know how to do that"
fi
