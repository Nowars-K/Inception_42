FROM debian:buster

RUN apt-get update \
	&& apt-get install -y mariadb-server

EXPOSE 3306

COPY ./mariadb.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN ls /var/www/
RUN chmod +x /var/www/init_db.sql
RUN service mysql start && mysql < /var/www/init_db.sql && rm -f /var/www/init_db.sql;

CMD ["mysqld"]