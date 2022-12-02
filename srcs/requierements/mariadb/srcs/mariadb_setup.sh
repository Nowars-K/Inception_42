#!/bin/bash

mv /my.cnf /etc/mysql/
/etc/init.d/mysql start

mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY 'pass';"

mysql -u root -p'pass' -e "CREATE DATABASE $DB_DATABASE"
mysql -u root -p"pass" -e "CREATE USER '$DB_USERNAME' IDENTIFIED BY '$DB_PASSWORD'"
mysql -u root -p "pass" -e "GRANT USAGE ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION"
mysql -u root -p 'pass' -e "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"
