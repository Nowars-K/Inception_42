FROM debian:buster

RUN apt-get update -y \
	&& apt install -y php php-fpm php-cli php7.3-mysql wget
COPY srcs/ /

ARG DB_ROOT_PASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE

RUN sh wordpress_setup.sh

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]