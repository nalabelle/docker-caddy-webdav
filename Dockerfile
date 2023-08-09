FROM caddy:2.7.2-builder@sha256:7abb7723020bab7b367d33786efcfca5d4a4f884ec306308d4a5513f14cdc20c AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.2@sha256:5eb52d854b03fed68136a58636afb03f641d152abd2749e4ad9839fbad50c3c2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
