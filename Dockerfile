FROM caddy:2.7.3-builder@sha256:7a4a3476f0991b84458cf29307f0c064e6b5fdd6af0019dc36a76576dc0721f1 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.3@sha256:f9824933254e3e43e0508670ee9bdcde704621017e95119a05317383b1878f4f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
