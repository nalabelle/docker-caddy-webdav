FROM caddy:2.7.6-builder@sha256:aabf71f1af81f2de3ccf8a1b6bd22ba245265a25b4bd759ee93531ebb141b34f AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:bcf45332e3ebd42456f5fe63be2175ebfee971d85c2cd1bd837dd0beb422fa1c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
