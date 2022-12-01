FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y mariadb-server

COPY srcs/ /

RUN sh mariadb_setup.sh

ENTRYPOINT [ "mysqld" ]