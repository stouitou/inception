#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

sed -i "s|= 127.0.0.1|= 0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|basedir|port\t\t\t= 3306\nbasedir|" /etc/mysql/mariadb.conf.d/50-server.cnf

envsubst < /tmp/init.template.sql > /tmp/init.sql
exec mysqld --init-file=/tmp/init.sql
