FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y php php-fpm php-cli php7.3-mysql wget

ARG WP_USER aleferra
ARG WP_PASS
ARG $WP_LOCALHOST

RUN sleep 5
COPY conf/ /

RUN sh wordpress_setup.sh

EXPOSE 9000
RUN echo $WP_USER
RUN echo $WP_PASS
RUN echo $WP_LOCALHOST

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]