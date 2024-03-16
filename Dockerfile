FROM caddy:2.7.6-builder@sha256:581ba057cee6b92ffe4064cd229df482a0a5f3d21ac11247023f77b240a19e97 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:35973e76071e05f041590b1892e4f0ab9b53532c360e8d6c1b75717482077e09

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
