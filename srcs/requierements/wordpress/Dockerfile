FROM debian:buster

RUN apt-get update -y \
	&& apt install -y php php-fpm php-cli php7.3-mysql wget

COPY conf/ /

ARG WP_USER
ARG WP_PASS
ARG WP_LOCALHOST
ARG WP_DATANAME

RUN echo "Worp" $WP_USER

RUN sh wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]