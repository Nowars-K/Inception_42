FROM debian:buster

RUN apt-get update \
	&& apt-get install -y mariadb-server

EXPOSE 3306

COPY ./mariadb.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /www/var/

RUN ls /www/var/
RUN service mysql start && mysql < /var/www/tools/init_db.sql && rm -f /var/www/tools/init_db.sql;

CMD ["mysqld"]