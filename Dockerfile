FROM caddy:2.6.4-builder@sha256:df58a91c48ac82525fbb46e4ef4c605def5699f824917a0e17a54e6bb7647d63 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:d4ca216d8dc515a49bc20fa22a449283ade6c8fc132eb6fa412ff351664d4917

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
