FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y php php-fpm php-cli php7.3-mysql wget

ARG WP_USER aleferra
ARG WP_PASS pass
ARG WP_LOCALHOST pass

COPY conf/ /

RUN sh wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]