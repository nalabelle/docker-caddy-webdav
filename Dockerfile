FROM caddy:2.7.6-builder@sha256:9431b9be7b427f276ba717cc590fafedf6018b04f970c04fa13649e8aed42dd3 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:90276aa213f7833cdf256df77c0eabfd5b3a438e245d17766381c423b522401f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
