FROM caddy:2.7.4-builder@sha256:346be6df74d1e007897980c590c56d1e8cfadf8e4a2d470208768982a6382fd5 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:2332c4ebc4ae778b9697043d3fa3aaef6879dd17abc03200285af9d315353008

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
