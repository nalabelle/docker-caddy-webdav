FROM caddy:2.7.5-builder@sha256:801ec8f85e0f5ec8569a071d8e9a1e307c7f58d12e2fe3c245e6f3f25353ebda AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.5@sha256:8ad203c3e138030bb889c2bec51de287a978e9b0c85fb0f884f359ecd4067c4b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
