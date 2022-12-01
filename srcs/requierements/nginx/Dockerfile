FROM debian:buster

RUN apt-get update -y \
	&& apt install -y nginx openssl
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  -subj "/C=FR/ST=AURA/L=Lyon/O=42Lyon/CN="

COPY srcs/nginx.conf /etc/nginx/conf.d
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]