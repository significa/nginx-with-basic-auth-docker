FROM nginx:1-alpine

RUN apk update && \
    apk add --no-cache apache2-utils && \
    rm /var/cache/apk/*

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./healthz.conf ./app_version.conf /etc/nginx/
COPY ./40-basic-auth-htpasswd.sh ./50-setup-health-and-version.sh /docker-entrypoint.d/

ARG APP_VERSION=unknown
ENV APP_VERSION=$APP_VERSION
ENV ENABLE_HEALTH_ROUTE=true
ENV ENABLE_VERSION_ROUTE=true
