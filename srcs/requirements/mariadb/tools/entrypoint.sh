#!/bin/bash


if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Allow other dockers to communicate with database
sed -i "s|= 127.0.0.1|= 0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf

# Create a file with the values of the variables in template file
export MYSQL_ADMIN_PASSWORD=$(cat /run/secrets/mysql_admin_password)
envsubst < /tmp/init.template.sql > /tmp/init.sql
unset MYSQL_ADMIN_PASSWORD

exec mysqld --init-file=/tmp/init.sql
