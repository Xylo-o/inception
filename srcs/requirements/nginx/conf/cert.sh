#!/bin/sh
# This script generates a self-signed certificate for NGINX.

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/cert_key.key \
    -out /etc/ssl/certs/certificate.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

chmod 644 /etc/ssl/certs/certificate.crt
chmod 600 /etc/ssl/private/cert_key.key

echo -e "\033[0;32mSelf-signed certificate generated\033[0m"