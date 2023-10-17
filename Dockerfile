FROM caddy:2.7.4-builder@sha256:55a6f944702266c39e7e1a14f1a2a4b083048f26aa9ee69c315628330b77db6c AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:505de4e957da923672a8c79f16581e9b717a2479a8d5ddb909ab2d1b351f2ba4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
