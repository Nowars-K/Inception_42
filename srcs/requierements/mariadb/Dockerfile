FROM debian:buster

RUN apt-get update -y \
&& apt-get install -y mariadb-server mariadb-client netcat procps

ARG DB_ROOT_PASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE


COPY /srcs/start.sh ./
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /srcs/mariadb-server.cnf /etc/mysql/mariadb.conf.d/

RUN chown -R mysql:mysql /var/lib/mysql \
&& chmod 775 /var/lib/*

EXPOSE 3306

ENTRYPOINT [ "bash", "start.sh" ]