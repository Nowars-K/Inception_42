FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y php php-fpm php-cli php7.3-mysql wget

ARG WP_USER
ARG WP_PASS
ARG WP_LOCALHOST
ARG WP_DATANAME

COPY conf/ /

RUN sh wordpress_setup.sh

RUN sed -i "s/username_here/$WP_USER/g" wp-config-sample.php;
RUN sed -i "s/password_here/${WP_PASS}/g" wp-config-sample.php
RUN sed -i "s/localhost/mariadb/g" wp-config-sample.php
RUN sed -i "s/database_name_here/wordpress/g" wp-config-sample.php

RUN sh word2.sh

EXPOSE 9000

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]