FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y php php-fpm php-cli php7.3-mysql wget

COPY conf/ /
RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["sh", "entrypoint.sh"]
CMD ["./usr/sbin/php-fpm7.3", "-F"]