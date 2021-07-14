ARG CADDY_VERSION=2

FROM caddy:${CADDY_VERSION}-builder-alpine AS cert-caddy_builder

RUN xcaddy build \
	--with github.com/caddy-dns/digitalocean

FROM caddy:${CADDY_VERSION} AS cert-caddy

WORKDIR /srv/app

COPY --from=cert-caddy_builder /usr/bin/caddy /usr/bin/caddy
COPY ./caddy.json /srv/app/caddy-template.json

COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

# CMD 
