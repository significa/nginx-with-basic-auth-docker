# Nginx with Basic Auth Docker Image

This is a simple, small, and multi-arch Docker image of Nginx with basic authentication enabled.

**Example**

```sh
docker run \
    -e BASIC_AUTH_USERNAME=your_username \
    -e BASIC_AUTH_PASSWORD=your_password \
    -v ./your/www/dir:/usr/share/nginx/html \
    ghcr.io/significa/nginx-with-basic-auth
```

Image name/url: `ghcr.io/significa/nginx-with-basic-auth`

## Usage

This image can be configured using environment variables during runtime. You do not need to prepare
htpasswd encoded strings beforehand. Simply pass the environment variables in plaintext.


**Required Environment Variables**

* `BASIC_AUTH_USERNAME`: The username for basic authentication.
* `BASIC_AUTH_PASSWORD`: The password for basic authentication.

**Optional Environment Variables**

These environment variables are optional and are used to enable `/healthz` and `/healthz/version`.
This enables easy setup of health checks without dependency on the hosted web files and basic auth.
They default to enabled (`true`) but can be set to `false` to disable them.
The version route consumes the `APP_VERSION` env var (that can also be set via a build argument).

* `ENABLE_HEALTH_ROUTE`: Enables the `/healthz` route.
* `ENABLE_VERSION_ROUTE`: Enables the `/version/version` route.
