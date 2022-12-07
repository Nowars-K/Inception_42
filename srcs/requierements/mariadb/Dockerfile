FROM debian:buster

RUN	apt-get update -y	\
&&	apt-get upgrade -y	\
&&	apt-get install -y mariadb-server \
&&  rm -rf /var/lib/apt/lists/* \
&&  mkdir -p /run/mysqld \
&&  chown -R mysql:mysql /run/mysqld \
&&  chmod 777 /var/run/mysqld

COPY ./conf/start.sh /
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x ./start.sh \
&&  sh ./start.sh

RUN service mysql start	\
&&  mysql < setup.sql

EXPOSE	3306

CMD ["mysqld_safe"]