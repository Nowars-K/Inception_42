#!/bin/bash

mv /my.cnf /etc/mysql/
/etc/init.d/mysql start

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password;"
