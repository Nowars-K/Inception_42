FROM debian:buster

RUN apt-get update -y \
	&& apt-get install -y mariadb-server

COPY srcs/ /

ARG DB_ROOT_PASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE
ARG WP_ROOT_USERNAME
ARG WP_ROOT_PASSWORD
ARG WP_USER_PASSWORD

RUN echo value ${DB_ROOT_PASSWORD}
RUN echo value ${DB_USERNAME}
RUN echo value ${DB_PASSWORD}
RUN echo value ${DB_DATABASE}


RUN sh mariadb_setup.sh

ENTRYPOINT [ "mysqld" ]