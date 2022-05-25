FROM debian:buster

RUN apt update
RUN apt install -y php7.3 php-mysqli php-fpm curl sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

CMD bash /var/www/start.sh