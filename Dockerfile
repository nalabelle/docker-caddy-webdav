FROM caddy:2.7.4-builder@sha256:633ab377cf4c11d70beb0de3943040d404c6b468a1cc4b3fc1029988b15b8b71 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.7.4@sha256:b3a7eac3daba82e1d682a7fa3f11b6d0dbe32869cdcc835fd30748021fbe3b9f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
