FROM debian:bullseye

LABEL maintainer="stouitou ${MAINTAINER}"

RUN apt update && apt upgrade -y

# Get MariaDB
RUN apt install -y mariadb-server gettext
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Add user stouitou to MariaDB
COPY conf/init.template.sql /tmp/init.template.sql
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]
