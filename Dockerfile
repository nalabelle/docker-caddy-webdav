FROM caddy:2.7.4-builder@sha256:55a6f944702266c39e7e1a14f1a2a4b083048f26aa9ee69c315628330b77db6c AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:df239ca80315c8271f9e87a981fb47124831f8b5a7c85970249d2dfd712479a3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
