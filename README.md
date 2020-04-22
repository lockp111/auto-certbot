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

0 3 1 * * certbot renew --renew-hook "sudo nginx -s reload"
```