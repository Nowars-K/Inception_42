#!/bin/bash

mv /my.cnf /etc/mysql/
/etc/init.d/mysql start

mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '$DB_ROOT_PASSWORD';"

mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE $DB_DATABASE"
mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE USER '$DB_USERNAME' IDENTIFIED BY '$DB_PASSWORD'"
mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT USAGE ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION"
mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"

mysql -u root --password=${DB_ROOT_PASSWORD} $DB_DATABASE < export.sql

mysql -u root -p${DB_ROOT_PASSWORD} -e "INSERT INTO $DB_DATABASE.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name) VALUES (1,	'$WP_ROOT_USERNAME', MD5('$WP_ROOT_PASSWORD'), '$WP_ROOT_USERNAME', 'aleferra@student.42lyon.fr', 'https://aleferra.42.fr', '2022-04-12 09:53:18', '',	0, '$WP_ROOT_USERNAME');"
mysql -u root -p${DB_ROOT_PASSWORD} -e "INSERT INTO $DB_DATABASE.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name) VALUES (2,	'wpuser', MD5('$WP_USER_PASSWORD'), '$WP_ROOT_USERNAME', 'user@student.42lyon.fr', 'https://aleferra.42.fr', '2022-04-12 09:53:18', '',	0, 'wpuser');"
mysql -u root -p${DB_ROOT_PASSWORD} -e "INSERT INTO $DB_DATABASE.wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES(1, 1,	'nickname',	'$WP_ROOT_USERNAME'),(2, 1, 'first_name', ''),(3, 1, 'last_name', ''),(4, 1, 'description',	''),(5,	1, 'rich_editing', 'true'),(6, 1, 'syntax_highlighting', 'true'),(7, 1, 'comment_shortcuts', 'false'),(8, 1, 'admin_color',	'fresh'),(9, 1,	'use_ssl', '0'),(10, 1, 'show_admin_bar_front', 'true'),(11, 1,	'locale', ''),(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),(13,	1,	'wp_user_level', '10'),(14,	1, 'dismissed_wp_pointers',	''),(15, 1,	'show_welcome_panel', '1');"
