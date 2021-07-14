
# certainly-certed

A simple Caddy Docker container that manages certificates for a given domain using the DNS challenge with DigitalOcean. You can mount these certificates into other containers through a shared volume.

## Usage

```yaml
version: '3.8'


services:

  certainly-certed:
    image: rogierkn/certainly-certed:latest
    environment:
      DOMAIN: example.com
      TLS_EMAIL: you@example.com
      DIGITALOCEAN_TOKEN: an_api_token_of_DO
    volumes:
      - certs:/data/caddy/certificates/acme-v02.api.letsencrypt.org-directory/

volumes:
  certs: 
```

After starting the container the certificates will be available in the `certs` volume with your domain name as the folder name.

## License
[MIT](https://choosealicense.com/licenses/mit/)
