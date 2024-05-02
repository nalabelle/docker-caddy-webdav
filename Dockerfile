FROM caddy:2.7.6-builder@sha256:465ccdb757e5a2b6d79750e8332217bc942c84ae7ed732ebcf913d6607474ccd AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.6@sha256:88c1261ae2c61b4fef3ce4ef2c3dbb4247f8081ef02d05ab41bd33bbd8bfa3d4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
