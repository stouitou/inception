CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS "${MYSQL_ADMIN}"@'%' IDENTIFIED BY "${MYSQL_ADMIN_PASSWORD}";
CREATE USER IF NOT EXISTS "${MYSQL_USER}"@'%' IDENTIFIED BY "${MYSQL_USER_PASSWORD}";
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO "${MYSQL_ADMIN}"@'%';
FLUSH PRIVILEGES;
