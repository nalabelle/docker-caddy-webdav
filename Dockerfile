FROM caddy:2.7.5-builder@sha256:5b9c67db8969d2d07fbbea52156ed4a9d59c6b20452e5f230c230a686b60c426 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.5@sha256:325f81ca0328db0737503a53f43717fce79ea0c574e83f8e586c8d350cadf34b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
