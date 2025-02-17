#!/bin/bash

# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html
cd /var/www/html/

# Install WordPress with wp-cli
wp core download --allow-root

# Create WordPress configuration file with database datas
wp config create --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_ADMIN}" --dbpass="${MYSQL_ADMIN_PASSWORD}" --dbhost="$MYSQL_HOST" --allow-root

chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Configure WordPress
wp core install --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email=${MAINTAINER} --allow-root

# Create additional user
wp user create "${WP_USER}" "jlabonde@student.42.fr" --role=editor --user_pass="${WP_USER_PASSWORD}" --allow-root

# Allow WordPress to communicate on port 9000
sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

# Create socket file directory if not exists
mkdir -p /run/php
chmod 777 /run/php

php-fpm7.4 -F