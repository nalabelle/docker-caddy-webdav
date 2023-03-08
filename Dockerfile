FROM caddy:2.6.4-builder@sha256:0df0b6ba0ce989fbee9e8a95f5ae64ebba1d22438b00880dcea2886d86ad1565 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:36ba71b44afa613ecf0aadce8e4b9e3f56e0c4b0a78c8edf4e8c2485f21b35ef

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
