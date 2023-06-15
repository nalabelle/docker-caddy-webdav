FROM caddy:2.6.4-builder@sha256:3c5afb202531c150573de29c3594f9eec05e326a215162b95523a27364e98d13 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:d4ca216d8dc515a49bc20fa22a449283ade6c8fc132eb6fa412ff351664d4917

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
