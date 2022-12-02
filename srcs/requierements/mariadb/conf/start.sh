# !/bin/bash

cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER aleferra@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON mariadb.* TO aleferra@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
EOF