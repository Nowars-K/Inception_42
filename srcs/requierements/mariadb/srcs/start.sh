
/usr/bin/mysqld_safe &

while ! nc -vz localhost 3306; do sleep 1; done

/usr/bin/mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
/usr/bin/mysql -uroot -e "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
/usr/bin/mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

while nc -vz localhost 3306; do sleep 1; done

exec /usr/sbin/mysqld