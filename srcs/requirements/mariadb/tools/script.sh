#!/bin/bash

# Ensure no existing process is running to avoid file locking (prevents issues if the script is ran more than once)
pkill -f mysqld_safe || true
pkill -f mysqld || true

# Ensure the database directory is initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in the background to run initial setup and set up required files (without network to avoid any possible attacks)
mysqld_safe --skip-networking &
sleep 5

# Root user setup and database initialization
echo "Setting up the MariaDB root user and database..."
mysql -u root <<EOF
-- Create the root user password if it doesn't exist
-- ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASS}';

-- Create the application database
CREATE DATABASE IF NOT EXISTS ${SQL_DB};

-- Create the application user
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASS}';

-- Grant privileges
GRANT ALL PRIVILEGES ON ${SQL_DB}.* TO '${SQL_USER}'@'%';

-- Apply changes
FLUSH PRIVILEGES;
EOF

# Stop the temporary server
pkill -f mysqld_safe
pkill -f mysqld

# Start MariaDB properly with the created users but connected to the network
echo "Starting MariaDB server..."
exec mysqld --bind-address=0.0.0.0
