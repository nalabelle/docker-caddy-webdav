FROM caddy:2.7.2-builder@sha256:ed3edcff66072654c60998ef8ff764598573b8ecfad732ba7988a01d6d9b2dfe AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.2@sha256:5eb52d854b03fed68136a58636afb03f641d152abd2749e4ad9839fbad50c3c2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
