mkdir /var/www
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm -rf latetest.tar.gz
mv wordpress/ /var/www/app

mv fpm.cnf /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/app


