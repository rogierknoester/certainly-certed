#!/bin/sh
set -e

# Replace {DOMAIN} with DOMAIN

sed "s/{DOMAIN}/$DOMAIN/g" caddy-template.json > caddy.json


echo "Linking \"/data/caddy/certificates/acme-v02.api.letsencrypt.org-directory/$DOMAIN\" to /srv/app/certs" >> /var/log/certainly_certed
ln -s "/data/caddy/certificates/acme-v02.api.letsencrypt.org-directory/$DOMAIN" /srv/app/certs

if [ -f /run/secrets/digitalocean_token ]
then
export DIGITALOCEAN_TOKEN=$(cat /run/secrets/digitalocean_token)
echo "Loaded digitalocean_token from secret" >> /var/log/certainly_certed
fi

echo "Starting caddy" >> /var/log/certainly_certed
caddy run --config /srv/app/caddy.json
