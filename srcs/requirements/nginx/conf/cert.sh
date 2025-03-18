#!/bin/sh
# This script generates a self-signed certificate for NGINX.
# Usage: ./generate_cert.sh [DOMAIN_NAME]
# Default DOMAIN_NAME is taken from the environment variable or set to "adprzyby.42.fr"

DOMAIN_NAME=${1:-${DOMAIN_NAME:-"adprzyby.42.fr"}}
CERT_DIR=$(dirname "$0")
CRT_FILE="$CERT_DIR/certificate.crt"
KEY_FILE="$CERT_DIR/cert_key.key"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_FILE" \
    -out "$CRT_FILE" \
    -subj "/CN=$DOMAIN_NAME"

echo -e "${\033[0;32m}Self-signed certificate generated:${\033[0m}"
echo -e "${\033[0;34m}Certificate:${\033[0m} $CRT_FILE"
echo -e "${\033[0;36m}Key:${\033[0m} $KEY_FILE"