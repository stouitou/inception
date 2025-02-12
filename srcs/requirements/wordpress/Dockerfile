FROM debian:bullseye

LABEL maintainer="stouitou stouitou@student.42.fr"

RUN apt update && apt upgrade -y

# Install PHP
# fpm = FastCGI Process Manager
# mysql = allow to communicate with mySQL databases
# curl = tool for transferring network protocols (HTTP, HTTPS, FTP)
RUN apt install -y php-fpm php-mysql curl

# Install WordPress
RUN apt install -y wget unzip
RUN wget https://wordpress.org/latest.zip
RUN mkdir -p /var/www/html
RUN unzip latest -d /var/www/html && \
	mv /var/www/html/wordpress/* /var/www/html/ && \
	rm -rf /var/www/html/wordpress && \
	rm -f latest

# # Install wp-cli
# RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
# 	chmod +x wp-cli.phar && \
# 	mv wp-cli.phar /usr/local/bin/wp

# RUN wp core download --allow-root

# WORKDIR	/var/www/html
# Config WordPress
COPY ./conf/wp-config.php /var/www/html/wp-config.php
# RUN wp config create --dbname=wordpress_db --dbuser=wp-nimda --dbpass=1234 --dbhost=mariadb --allow-root
# Change group appartenance
RUN chown -R www-data:www-data /var/www/html && \
chmod -R 755 /var/www/html

# Execute CLI to configure WordPress
# RUN ls -lah /var/www/html/
# RUN cat /var/www/html/wp-config.php
# RUN wp core install --url='https://localhost' --title='My WordPress Site' --admin_user='admin' --admin_password='password' --admin_email='stouitou@student.42.fr' --allow-root
# COPY ./tools/wait_mdb.sh /usr/local/bin/wait_mdb.sh
# RUN chmod +x /usr/local/bin/wait_mdb.sh && \
# 	/usr/local/bin/wait_mdb.sh

# WORKDIR /
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

# Create socket file directory if not exists
RUN mkdir -p /run/php/
RUN chmod 777 /run/php

CMD ["php-fpm7.4", "-F"]
