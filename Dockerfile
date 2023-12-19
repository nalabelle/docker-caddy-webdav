FROM caddy:2.7.6-builder@sha256:4525c85dd82a7b2f91959adf52617e51e9d0b1181a29f1e4b058ad695262ad3f AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:e523a9bc9e19fb96a082b4d83ebae2ce6267f56f2b7b4ac462135ebc51f68e58

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
