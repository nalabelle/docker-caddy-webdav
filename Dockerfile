FROM caddy:2.7.2-builder@sha256:ed3edcff66072654c60998ef8ff764598573b8ecfad732ba7988a01d6d9b2dfe AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.2@sha256:19f88d98fda45c99e4880b262cd4e36ebfdb9c88b628058102ab6059a0bc5c39

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
