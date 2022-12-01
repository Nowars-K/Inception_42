FROM debian:buster

RUN apt-get update -y \
&& apt-get install -y mariadb-server mariadb-client netcat procps

COPY /srcs/start.sh ./
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /srcs/mariadb-server.cnf /etc/mysql/mariadb.conf.d/

RUN chown -R mysql:mysql /var/lib/mysql \
&& chmod 775 /var/lib/*

ENTRYPOINT [ "bash", "start.sh" ]
EXPOSE 3306