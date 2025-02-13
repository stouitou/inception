#!/bin/bash

mkdir -p /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

wp core download --allow-root

# # attendre
# curl -sSL https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh -o /usr/local/bin/wait-for-it.sh
# chmod +x /usr/local/bin/wait-for-it.sh

# /usr/local/bin/wait-for-it.sh mariadb:3306 -- wp config create --dbname=wordpress_db --dbuser=wp_user --dbpass=1234 --dbhost=mariadb --allow-root

wp config create --dbname=wordpress_db --dbuser=wp_user --dbpass=1234 --dbhost=mariadb --allow-root

chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

wp core install --url='stouitou.42.fr' --title='My WordPress Site' --admin_user='admin' --admin_password='password' --admin_email='stouitou@student.42.fr' --allow-root

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

# Create socket file directory if not exists
mkdir -p /run/php/
chmod 777 /run/php

php-fpm7.4 -F