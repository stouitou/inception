#!/bin/bash

mkdir -p /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

wp core download --allow-root

wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_ADMIN} --dbpass=${MYSQL_ADMIN_PASSWORD} --dbhost=$MYSQL_HOST --allow-root

chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

wp core install --url=${DOMAIN_NAME} --title="${WP_TITLE}" --admin_user=${WP_ADMIN} --admin_password="${WP_ADMIN_PASSWORD}" --admin_email=${EMAIL_ADDRESS} --allow-root

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

# Create socket file directory if not exists
mkdir -p /run/php/
chmod 777 /run/php

php-fpm7.4 -F