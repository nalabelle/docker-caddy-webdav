FROM caddy:2.6.4-builder@sha256:4b1a3ddb2437c6ba97f165d5b767bf36fa34c162b19bc7135ac1a74a2535a61b AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
