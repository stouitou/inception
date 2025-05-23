CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

CREATE USER IF NOT EXISTS "${MYSQL_ADMIN}"@'%' IDENTIFIED BY "${MYSQL_ADMIN_PASSWORD}";
GRANT ALL PRIVILEGES ON *.* TO "${MYSQL_ADMIN}"@'%';

FLUSH PRIVILEGES;
