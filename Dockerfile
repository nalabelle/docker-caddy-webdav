FROM caddy:2.7.4-builder@sha256:346be6df74d1e007897980c590c56d1e8cfadf8e4a2d470208768982a6382fd5 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:df239ca80315c8271f9e87a981fb47124831f8b5a7c85970249d2dfd712479a3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
