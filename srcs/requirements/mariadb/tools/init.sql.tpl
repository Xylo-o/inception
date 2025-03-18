CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};

CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';

CREATE USER IF NOT EXISTS 'wp_manager'@'%' IDENTIFIED BY 'managerpassword';
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO 'wp_manager'@'%';

FLUSH PRIVILEGES;