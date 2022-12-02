FROM debian:buster

RUN	apt-get update -y	\
&&	apt-get upgrade -y	\
&&	apt-get install -y mariadb-server

COPY ./conf/ .

RUN cp ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x ./db_setup.sh	\
&&  chmod +x ./start.sh

RUN sh ./db_setup.sh \
&&  sh ./start.sh

RUN service mysql start	\
&&  mysql < setup.sql

EXPOSE	3306

CMD ["mysqld_safe"]