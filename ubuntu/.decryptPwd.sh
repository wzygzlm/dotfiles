#!/bin/sh
PASSWD="$(gpg2 --quiet --for-your-eyes-only --no-tty --decrypt ~/.mail-$1-passwd.gpg)"
echo "set imap_pass = ${PASSWD}"
