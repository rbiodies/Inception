FROM debian:buster

RUN apt-get update
RUN apt-get -y install wget php7.3 php-mysqli php-fpm curl sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/start.sh

# предоставляет команду с аргументами для вызова во время выполнения контейнера
ENTRYPOINT [ "/var/www/start.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]