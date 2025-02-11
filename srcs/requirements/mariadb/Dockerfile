FROM debian:bullseye

LABEL maintainer="stouitou stouitou@student.42.fr"

WORKDIR /home/stouitou

# Update packages
RUN apt update && apt upgrade -y

# Get MariaDB
RUN apt install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*

# Add user stouitou to MariaDB
COPY conf/init.sql tools/entrypoint.sh /tmp/.
RUN chmod +x /tmp/entrypoint.sh

# EXPOSE 3306

ENTRYPOINT ["/tmp/entrypoint.sh"]
