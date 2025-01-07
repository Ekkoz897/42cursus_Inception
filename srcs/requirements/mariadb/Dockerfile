FROM debian:oldstable

RUN apt-get update -y && \
    apt-get install -y mariadb-server && \
    apt-get clean

# Copy initialization script to the container and make it executable
COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

# Set the working directory for MariaDB data files
WORKDIR /var/lib/mysql

# Expose port 3306 for MariaDB connections
EXPOSE 3306

# Set the entry point to execute the initialization script when the container starts
ENTRYPOINT ["bash", "/tmp/script.sh"]
