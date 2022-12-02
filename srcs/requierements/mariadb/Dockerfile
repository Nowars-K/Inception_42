
FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY srcs/ /

ARG ROOTPASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE
ARG WP_ROOT_PASSWORD

ARG WP_ROOT_USERNAME
ARG WP_USER_PASSWORD

EXPOSE 3306

RUN sh mariadb_setup.sh

ENTRYPOINT [ "mysqld" ]