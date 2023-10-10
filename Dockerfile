FROM caddy:2.7.4-builder@sha256:92a2e6460e5fd73518b4da978a5ceeea9c34d2f0d6b3f3e97f5854652ccd7e73 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:df239ca80315c8271f9e87a981fb47124831f8b5a7c85970249d2dfd712479a3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
