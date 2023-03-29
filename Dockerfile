FROM caddy:2.6.4-builder@sha256:0df0b6ba0ce989fbee9e8a95f5ae64ebba1d22438b00880dcea2886d86ad1565 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
