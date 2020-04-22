#!/bin/sh
if [ ! -n "$1" ]; then
    echo "Usage: $0 -d domain.com -d *.domain.com ..." && \
    exit
fi

sudo apt update && sudo apt -y upgrade
sudo apt install -y certbot python3-certbot-dns-cloudflare python-certbot-nginx
sudo certbot -a dns-cloudflare -i nginx --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email $@