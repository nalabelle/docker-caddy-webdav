FROM caddy:2.6.4-builder@sha256:3c5afb202531c150573de29c3594f9eec05e326a215162b95523a27364e98d13 AS builder

RUN xcaddy build \
  --with github.com/mholt/caddy-webdav

FROM caddy:2.6.4@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
