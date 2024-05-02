FROM caddy:2.7.6-builder@sha256:433a5f4f1c73a070fbb0115907672391c921abd81be18200cc37eb323b099e1b AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:3719c38b66b16b41aa30a32ef753cb371fe25aeaf8ac623b75132727f0665eab

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
