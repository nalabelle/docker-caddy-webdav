FROM caddy:2.7.6-builder@sha256:3b61eca4b735a1a4f4f7fb20580afd5b05d51ba2d9498a4a5c2935e04fec8fc4 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:2a0d069ea95d91641d201943a5a049e83cbfade8039670aebfb441b132189de6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
