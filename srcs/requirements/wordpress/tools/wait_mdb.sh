#!/bin/bash

TIMEOUT=150
WAIT=0

until mysql -h mariadb -u main_user -p"1234" -e "SHOW DATABASES;"; do
    if [ $WAIT -ge $TIMEOUT ];    # ports:
    #   - "3306:3306"
 then
        echo "MariaDB did not start."
        exit 1
    fi
    echo "Waiting for MariaDB..."
    sleep 2
    WAIT=$((WAIT+2))

done

echo "MariaDB is ready!"

wp core install --url="http://localhost" --title="My WordPress Site" --admin_user="admin" --admin_password="password" --admin_email="admin@example.com" --allow-root