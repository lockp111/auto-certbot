# certbot script

## Usage

### upgrade
```sh
$ sudo apt update && sudo apt upgrade
```

### install
```sh
$ sudo apt install certbot python3-certbot-dns-cloudflare python-certbot-nginx
```

### set cf.ini
```
dns_cloudflare_email = email
dns_cloudflare_api_key = global_key
```

### run
```sh
$ sudo certbot -a dns-cloudflare -i nginx --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email -d *
```

### check renew
```sh
$ sudo certbot renew --dry-run
```

### set renew
```sh
$ sudo crontab -e

0 3 1 * * certbot renew --renew-hook "nginx -s reload"
```

### nginx config
```sh
location / {
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    if ($http_upgrade = "websocket") {
            proxy_pass http://127.0.0.1:3000;
    }
}
```
