FROM caddy:2.7.4-builder@sha256:33050f2d060171a04ef015097c2c431bebbef8e878f3d53db4adf2b93862e11d AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:b3a7eac3daba82e1d682a7fa3f11b6d0dbe32869cdcc835fd30748021fbe3b9f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
