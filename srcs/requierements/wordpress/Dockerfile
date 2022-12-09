FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y php php-fpm php-cli php7.3-mysql wget

ENV WP_USER
ARG WP_PASS
ARG WP_LOCALHOST
ARG WP_DATANAME

COPY conf/ /

RUN sh wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]