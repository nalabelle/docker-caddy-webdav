FROM caddy:2.6.4-builder@sha256:a6ac9d3116a00f231d79ec6e0289829484ff93f061f563e3e8bcf8fd47b8838e AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
