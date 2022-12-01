/usr/bin/mysqld_safe &

while ! nc -vz localhost 3306; do sleep 1; done

while nc -vz localhost 3306; do sleep 1; done

# exec /usr/sbin/mysqld