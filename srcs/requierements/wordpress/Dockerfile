FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y php php-fpm php-cli php7.3-mysql wget

ARG WP_USER: 'info'
ARG WP_PASS
ARG WP_LOCALHOST

COPY conf/ /

RUN sh wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]