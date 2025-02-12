FROM debian:bullseye

LABEL maintainer="stouitou stouitou@student.42.fr"

WORKDIR /home/stouitou

# Update packages
RUN apt update && apt upgrade -y

# Install PHP
# fpm = FastCGI Process Manager
# mysql = allow to communicate with mySQL databases
# curl = tool for transferring network protocols (HTTP, HTTPS, FTP)
RUN apt install -y php-fpm php-mysql php-cgi curl

# Install WordPress
RUN apt install -y wget unzip
RUN wget https://wordpress.org/latest.zip
RUN mkdir -p /var/www/html
RUN unzip latest -d /var/www/html && \
	mv /var/www/html/wordpress/* /var/www/html/ && \
	rm -rf /var/www/html/wordpress && \
	rm -f latest

# Config WordPress
COPY conf/wp-config.php /var/www/html
# WORKDIR /var/www/html
# RUN sed -i "s|username_here|wp_nimda|" wp-config-sample.php && \
# 	sed -i "s|password_here|administrator|" wp-config-sample.php && \
# 	sed -i "s|localhost|stouitou.42.fr|" wp-config-sample.php && \
# 	sed -i "s|database_name_here|mariadb|" wp-config-sample.php && \
# 	mv wp-config-sample.php wp-config.php
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf
# Change group appartenance
RUN chown -R www-data:www-data /var/www/html && \
	chmod -R 755 /var/www/html

# Create socket file directory if not exists
RUN mkdir -p /run/php/
RUN chmod 777 /run/php

CMD ["php-fpm7.4", "-F"]
