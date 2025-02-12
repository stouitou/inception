#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

sed -i "s|= 127.0.0.1|= 0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf

exec mysqld_safe --init-file=/tmp/init.sql
