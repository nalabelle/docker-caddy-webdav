FROM caddy:2.7.5-builder@sha256:5b9c67db8969d2d07fbbea52156ed4a9d59c6b20452e5f230c230a686b60c426 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.5@sha256:9eb928f0a3142d0a38e6d457f7696c08c13e070d49d6499cc5b0afe644ecb281

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
