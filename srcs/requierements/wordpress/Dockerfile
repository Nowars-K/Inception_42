FROM debian:buster

RUN apt-get update -y \
	&& apt install -y php php-fpm php-cli php7.3-mysql wget

COPY conf/ /

RUN sh wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]

RUN echo $WP_USER ${WP_USER} WP_USER