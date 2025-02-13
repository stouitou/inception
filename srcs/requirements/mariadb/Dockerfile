FROM debian:bullseye

LABEL maintainer="stouitou stouitou@student.42.fr"

RUN apt update && apt upgrade -y

# Get MariaDB
RUN apt install -y mariadb-server
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Add user stouitou to MariaDB
COPY conf/init.sql tools/entrypoint.sh /tmp/.
RUN chmod +x /tmp/entrypoint.sh

CMD ["/tmp/entrypoint.sh"]
