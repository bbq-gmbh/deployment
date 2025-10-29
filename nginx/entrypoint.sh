#!/bin/sh

export DOLLAR='$' # Nginx config requires dollar signs to be escaped

envsubst < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/default.conf

# Generate SSL certificate with the correct hostname if it doesn't exist
if [ ! -f /etc/nginx/certs/nginx-selfsigned.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/certs/nginx-selfsigned.key \
        -out /etc/nginx/certs/nginx-selfsigned.crt \
        -subj "/C=US/ST=New York/L=New York/O=Global Security/OU=IT Department/CN=${HOST}"
fi

nginx -g 'daemon off;'
