# Use the official Nginx image
FROM nginx:latest

# Install gettext for envsubst
RUN apt-get update && apt-get install -y gettext-base openssl

# Create a directory for the SSL certificate
RUN mkdir -p /etc/nginx/certs

# Copy the Nginx configuration template
COPY nginx.conf /etc/nginx/templates/nginx.conf.template

# Copy the www directory
COPY www /usr/share/nginx/html

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

