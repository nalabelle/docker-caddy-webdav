FROM caddy:2.7.4-builder@sha256:10f94f40c94c6c9499c7753f9d0b85d59ae4f3cfa8e9484e267ff3d7ca231e9f AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:2332c4ebc4ae778b9697043d3fa3aaef6879dd17abc03200285af9d315353008

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
