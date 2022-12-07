FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  -subj "/C=FR/ST=France/L=Lyon/O=42/CN=aleferra.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]