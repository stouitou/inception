FROM debian:bullseye

LABEL maintainer="stouitou stouitou@student.42.fr"

RUN apt update && apt upgrade -y

# Install PHP
# fpm = FastCGI Process Manager
# mysql = allow to communicate with mySQL databases
# curl = tool for transferring network protocols (HTTP, HTTPS, FTP)
RUN apt install -y php-fpm php-mysql curl

# # Install WordPress
# RUN apt install -y wget unzip
# RUN wget https://wordpress.org/latest.zip
# RUN mkdir -p /var/www/html
# RUN unzip latest -d /var/www/html && \
# 	mv /var/www/html/wordpress/* /var/www/html/ && \
# 	rm -rf /var/www/html/wordpress && \
# 	rm -f latest
	
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

# RUN chown -R www-data:www-data /var/www/html && \
# chmod -R 755 /var/www/html

COPY ./tools/wp_install.sh /usr/local/bin/wp_install.sh
RUN chmod +x /usr/local/bin/wp_install.sh

CMD ["/usr/local/bin/wp_install.sh"]

# RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" /etc/php/7.4/fpm/pool.d/www.conf

# # Create socket file directory if not exists
# RUN mkdir -p /run/php/
# RUN chmod 777 /run/php

# CMD ["php-fpm7.4", "-F"]
