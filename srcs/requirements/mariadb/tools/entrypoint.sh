#!/bin/sh
set -e

envsubst < /docker-entrypoint-initdb.d/init.sql.tpl > /docker-entrypoint-initdb.d/init.sql

# Check if database is initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Initialize database if needed
if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initializing database..."

    # Start MariaDB in background
    mysqld --user=mysql &
    pid="$!"

    # Wait for MariaDB to start
    until mysqladmin ping -h localhost --silent; do
        echo "Waiting for database to be ready..."
        sleep 1
    done

    # Run initialization SQL
    echo "Running initialization SQL..."
    mysql < /docker-entrypoint-initdb.d/init.sql

    # Stop the temporary server
    if ! kill -s TERM "$pid"; then
        echo >&2 "MySQL initialization process failed."
        exit 1
    fi

    # Wait for server to stop
    wait "$pid"
    echo "Database initialized successfully!"
fi

# Start MariaDB in foreground
echo "Starting MariaDB server..."
exec mysqld --user=mysql