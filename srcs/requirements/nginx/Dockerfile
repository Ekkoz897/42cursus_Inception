FROM debian:oldstable

# Update pckt manager, istall ngix
RUN apt update && apt install -y nginx openssl

# Generates a self-signed SSL certificate and a private key for NGINX using OpenSSL.
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-out /etc/ssl/certs/apereira.crt \
		-keyout /etc/ssl/private/apereira.key \
		-subj "/C=PT/ST=Lisbon/L=Beato/O=42 School/OU=apereira/CN=apereira.42.fr"

# Copy necessary files to the default site configuration
COPY ./tools/certs.sh /tmp/certs.sh
RUN chmod +x /tmp/certs.sh

COPY ./conf/default /etc/nginx/sites-available/default

# Set the entry point to execute the certs.sh script when the container starts
ENTRYPOINT ["/tmp/certs.sh"]
