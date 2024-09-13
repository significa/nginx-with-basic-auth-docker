#!/bin/sh

set -eu

mkdir -p /usr/share/nginx/app-version
echo -n "$APP_VERSION" > /usr/share/nginx/app-version/app-version.txt

NGINX_CONF_PATH="/etc/nginx/conf.d/default.conf"

if [ "$ENABLE_HEALTH_ROUTE" = "true" ]; then
    echo "Enabling /healthz route"
    sed -i 's/# include \/etc\/nginx\/healthz.conf;/include \/etc\/nginx\/healthz.conf;/' $NGINX_CONF_PATH
fi

if [ "$ENABLE_VERSION_ROUTE" = "true" ]; then
    echo "Enabling /healthz/version route"
    sed -i 's/# include \/etc\/nginx\/app_version.conf;/include \/etc\/nginx\/app_version.conf;/' $NGINX_CONF_PATH
fi

cat $NGINX_CONF_PATH
