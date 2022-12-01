FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY srcs/ /

ARG DB_ROOT_PASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE
ARG WP_ROOT_PASSWORD

ARG WP_ROOT_USERNAME
ARG WP_USER_PASSWORD

RUN sh mariadb_setup.sh

ENTRYPOINT [ "mysqld" ]