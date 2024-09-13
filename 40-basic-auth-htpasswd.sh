#!/bin/sh

set -eu

/usr/bin/htpasswd -bc /etc/nginx/htpasswd "$BASIC_AUTH_USERNAME" "$BASIC_AUTH_PASSWORD"
