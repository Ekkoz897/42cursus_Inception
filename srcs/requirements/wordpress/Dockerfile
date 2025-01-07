FROM debian:oldstable

# Update package manager and install required packages
RUN apt-get update && apt-get install -y \
	curl php-fpm php-mysql php-mbstring php-xml \
    php-gd php-curl php-zip php-xmlrpc php-soap \
	php-intl php-cli php-ldap php-imap \
    php-gmp php-bcmath php-imagick php-redis

# Configure PHP-FPM (processes scripts through port 9000)
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

# Create directory for PHP-FPM runtime
WORKDIR /var/www/html

# Install wp-cli for WordPress management (to be able to manage wp with the terminal and configure it upon initialization)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


RUN mkdir -p /run/php

# Copy  script for runtime configuration
COPY tools/script.sh /etc/wordpress.sh
RUN chmod +x /etc/wordpress.sh

# Expose port for PHP-FPM
EXPOSE 9000

# Set entrypoint to the custom script
ENTRYPOINT [ "bash", "/etc/wordpress.sh" ]
