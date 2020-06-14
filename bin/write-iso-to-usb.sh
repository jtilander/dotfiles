#!/bin/bash
# Writes an ISO file to a disk on MAC.
[ -z "$1" ] && echo "Must give source ISO" && exit 1
[ -z "$2" ] && echo "Must give dest disk" && exit 1

TEMPFILE=/tmp/convert.$$.dmg

hdiutil convert "$1" -format UDRW -o $TEMPFILE

trap "rm -f $TEMPFILE" EXIT

sudo dd if=$TEMPFILE of=$2 bs=1m

exit 0
