FROM caddy:2.7.5-builder@sha256:b94d3fcd6716230d3255c418016c002f5c95a4ae9bc1aa5304738538abada624 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.5@sha256:8ad203c3e138030bb889c2bec51de287a978e9b0c85fb0f884f359ecd4067c4b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
