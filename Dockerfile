FROM caddy:2.7.4-builder@sha256:92a2e6460e5fd73518b4da978a5ceeea9c34d2f0d6b3f3e97f5854652ccd7e73 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:505de4e957da923672a8c79f16581e9b717a2479a8d5ddb909ab2d1b351f2ba4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
