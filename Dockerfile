FROM caddy:2.7.6-builder@sha256:bde4e5db8670c4037861344b37357eac437a771a6d79153c138b316bb8b54d81 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:2f148ddb6662b4245ef4ced637e928eaf67a8a1941572d69627652253e779366

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
