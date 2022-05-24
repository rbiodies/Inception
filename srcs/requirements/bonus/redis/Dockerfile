FROM debian:buster

RUN apt update && apt install redis

COPY tools/configure.sh /var/www/configure.sh

CMD bash /var/www/configure.sh