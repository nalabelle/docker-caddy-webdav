FROM caddy:2.6.4-builder@sha256:47722ffc694507be1e2f34ca172e292fb5e226ea68d87871300b9d65f543fcce AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:36ba71b44afa613ecf0aadce8e4b9e3f56e0c4b0a78c8edf4e8c2485f21b35ef

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
