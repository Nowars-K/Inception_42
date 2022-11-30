FROM debian:buster

RUN apt-get update \
	&& apt-get install -y mariadb-server

EXPOSE 3306

COPY ./mariadb.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/init_bd.sql && rm -f /var/www/init_bd.sql;

CMD ["mysqld"]