#!/bin/bash

# Replace placeholders in the NGINX configuration file with actual environment variables
sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/sites-available/default
sed -i "s|my_key|${SSL_KEY_PATH}|g" /etc/nginx/sites-available/default
sed -i "s|my_cert|${SSL_CERT_PATH}|g" /etc/nginx/sites-available/default

# Start NGINX in the foreground to keep the container running
nginx -g "daemon off;"
