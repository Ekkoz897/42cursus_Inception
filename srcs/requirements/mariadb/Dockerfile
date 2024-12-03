# Step 1: Use Debian Buster as the base image
FROM debian:buster

# Step 2: Update package manager and install MariaDB server
RUN apt-get install mariadb-server -y

# Step 3: Configure MariaDB to accept connections from any network
COPY ./conf/mysql.cnf /etc/mysql/mariadb.conf.d/mysql.cnf
COPY ./tools/mariadb.sh /usr/local/bin/

# Step 4: Set execute permissions on the script
RUN chmod +x /usr/local/bin/mariadb.sh

# Step 5: Start MariaDB server and run the database initialization script
ENTRYPOINT ["/usr/local/bin/mariadb.sh"]
CMD ["mysqld_safe"]
