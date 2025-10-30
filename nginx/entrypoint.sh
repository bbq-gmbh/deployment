#!/bin/sh

export DOLLAR='$' # Nginx config requires dollar signs to be escaped

envsubst < /etc/nginx/templates/nginx.conf.template > /etc/nginx/conf.d/default.conf

# Generate SSL certificate with the correct hostname if it doesn't exist
if [ ! -f /etc/nginx/certs/nginx-selfsigned.crt ]; then
    # If SEED is set, create a temporary seed file and pass it to OpenSSL via -rand
    seedfile=""
    rand_opt=""
    if [ -n "${SEED}" ]; then
        # prefer mktemp when available
        if command -v mktemp >/dev/null 2>&1; then
            seedfile=$(mktemp)
        else
            seedfile="/tmp/nginx-seed-$$"
        fi
        printf '%s' "${SEED}" > "${seedfile}"
        rand_opt="-rand ${seedfile}"
    fi

    openssl req -x509 -nodes -days 365 ${rand_opt} -newkey rsa:2048 \
        -keyout /etc/nginx/certs/nginx-selfsigned.key \
        -out /etc/nginx/certs/nginx-selfsigned.crt \
        -subj "/C=US/ST=New York/L=New York/O=Global Security/OU=IT Department/CN=${HOST}"

    # Remove temporary seedfile if we created one
    if [ -n "${seedfile}" ] && [ -f "${seedfile}" ]; then
        rm -f "${seedfile}"
    fi
fi

nginx -g 'daemon off;'
