#!/bin/bash

wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && cd /var/www && \
	tar -xzf wordpress-6.0-fr_FR.tar.gz && rm -f wordpress-6.0-fr_FR.tar.gz

# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress/

if [ ! -f ./wp-config.php ]; then
	# Install WordPress with wp-cli
	wp core download --allow-root

	# Create WordPress configuration file with database datas
	wp config create \
		--dbname="${MYSQL_DATABASE}" \
		--dbuser="${MYSQL_ADMIN}" \
		--dbpass="${MYSQL_ADMIN_PASSWORD}" \
		--dbhost="$MYSQL_HOST" \
		--allow-root
fi

chown -R www-data:www-data /var/www/wordpress && chmod -R 755 /var/www/wordpress

# Configure WordPress
wp core install \
	--url="${DOMAIN_NAME}" \
	--title="${WP_TITLE}" \
	--admin_user="${WP_ADMIN}" \
	--admin_password="${WP_ADMIN_PASSWORD}" \
	--admin_email=${MAINTAINER} \
	--allow-root

# Create additional user
wp user create "${WP_USER}" \
	"jlabonde@student.42.fr" \
	--user_pass="${WP_USER_PASSWORD}" \
	--role=contributor \
	--allow-root

# Allow WordPress to communicate on port 9000
sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

# Create socket file directory if not exists
mkdir -p /run/php
chmod 777 /run/php

php-fpm7.4 -F