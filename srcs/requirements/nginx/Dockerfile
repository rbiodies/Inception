FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./tools/start.sh /var/www

CMD bash /var/www/start.sh