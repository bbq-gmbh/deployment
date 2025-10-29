# Use the official Nginx image
FROM nginx:latest

# Install openssl
RUN apt-get update && apt-get install -y openssl

# Create a directory for the SSL certificate
RUN mkdir -p /etc/nginx/certs

# Generate a self-signed certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/nginx-selfsigned.key \
    -out /etc/nginx/certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=New York/L=New York/O=Global Security/OU=IT Department/CN=fallstudie.polandcentral.cloudapp.azure.com"

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

