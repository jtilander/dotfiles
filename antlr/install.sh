#!/bin/sh

VERSION=4.7.1
ANTLRDIR=${HOME}/.antlr

[ ! -d $ANTLRDIR ] && mkdir $ANTLRDIR

curl -SsL -o $ANTLRDIR/antlr.jar http://www.antlr.org/download/antlr-${VERSION}-complete.jar

