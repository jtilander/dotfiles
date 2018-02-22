#!/bin/sh

for b in $(git branch --list | grep -E -v '^\*' | grep -E -v 'master|test') ; do
	git branch -d $b
done
