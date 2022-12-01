/usr/bin/mysqld_safe &

while ! nc -vz localhost 3306; do sleep 1; done

/usr/bin/mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $DB_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
/usr/bin/mysql -uroot -e "GRANT ALL ON $DB_DATABASE .* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';"
/usr/bin/mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

while nc -vz localhost 3306; do sleep 1; done

# exec /usr/sbin/mysqld