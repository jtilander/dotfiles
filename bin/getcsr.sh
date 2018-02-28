#!/bin/sh

TARGET_HOST=$1
TARGET_PORT=$2

if [ -z $TARGET_HOST ]; then
	echo "Usage: getcsr.sh <hostname> <port>"
	exit 1
fi

echo -n | openssl s_client -connect ${TARGET_HOST}:${TARGET_PORT} -showcerts 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'

exit 0
