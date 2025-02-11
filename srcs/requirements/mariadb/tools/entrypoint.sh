#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

exec mysqld_safe --init-file=/tmp/init.sql
