FROM caddy:2.7.4-builder@sha256:d52b90be1556639ca9fa380ea9554106c31907c91e76658a8c926c7fa623d8de AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:df239ca80315c8271f9e87a981fb47124831f8b5a7c85970249d2dfd712479a3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
