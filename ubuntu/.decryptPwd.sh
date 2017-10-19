#!/bin/sh
PASSWD="$(gpg2 --quiet --for-your-eyes-only --no-tty --decrypt ~/.mail-ini-passwd.gpg)"
echo "set imap_pass = ${PASSWD}"
