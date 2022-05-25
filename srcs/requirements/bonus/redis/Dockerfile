FROM debian:buster

RUN apt update
RUN apt install -y redis

COPY tools/configure.sh /var/www/configure.sh

CMD bash /var/www/configure.sh