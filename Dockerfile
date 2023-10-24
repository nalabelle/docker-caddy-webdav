FROM caddy:2.7.5-builder@sha256:ec3e3631cf04dcdd40c8071ad0b96cf1c3e9cfd8d054c43f8467bf0e9fb5972f AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.5@sha256:325f81ca0328db0737503a53f43717fce79ea0c574e83f8e586c8d350cadf34b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
