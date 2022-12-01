FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y mariadb-server

COPY srcs/ /

ARG ARG1
ARG DB_ROOT_PASSWORD

RUN echo value ${ARG1}
RUN echo value ${DB_ROOT_PASSWORD}

RUN sh mariadb_setup.sh

ENTRYPOINT [ "mysqld" ]