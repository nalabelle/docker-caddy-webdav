FROM caddy:2.6.4-builder@sha256:daa80d7b1fddf55c852777a58e5c504bb0e51f24123cbec227b4344bf05f370d AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
