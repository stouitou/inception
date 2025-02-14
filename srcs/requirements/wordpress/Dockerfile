FROM debian:bullseye

LABEL maintainer="stouitou ${MAINTAINER}"

RUN apt update && apt upgrade -y

# Install PHP
# fpm = FastCGI Process Manager
# mysql = allow to communicate with mySQL databases
# curl = tool for transferring network protocols (HTTP, HTTPS, FTP)
RUN apt install -y php-fpm php-mysql curl

COPY ./tools/wp_install.sh /usr/local/bin/wp_install.sh
RUN chmod +x /usr/local/bin/wp_install.sh

CMD ["wp_install.sh"]
