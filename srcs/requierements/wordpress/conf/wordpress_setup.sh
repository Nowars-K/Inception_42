mkdir /var/www
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm -rf latetest.tar.gz
mv wordpress/ /var/www/app

mv fpm.cnf /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/app

sed -i "s/username_here/$WP_USER/g" wp-config-sample.php
sed -i "s/password_here/${WP_PASS}/g" wp-config-sample.php
sed -i "s/localhost/$WP_LOCALHOST/g" wp-config-sample.php
sed -i "s/database_name_here/$WP_DATANAME/g" wp-config-sample.php
mv wp-config-sample.php wp-config.php

service php7.3-fpm start