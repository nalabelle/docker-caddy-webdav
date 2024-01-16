FROM caddy:2.7.6-builder@sha256:5075ffeca868319ab94e5a25150ed342d08cf4acd422f727359b74038b81ee53 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:2f148ddb6662b4245ef4ced637e928eaf67a8a1941572d69627652253e779366

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
