FROM caddy:2.7.4-builder@sha256:33050f2d060171a04ef015097c2c431bebbef8e878f3d53db4adf2b93862e11d AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:df239ca80315c8271f9e87a981fb47124831f8b5a7c85970249d2dfd712479a3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
