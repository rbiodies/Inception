FROM debian:buster

RUN apt update
RUN apt install -y vsftpd

COPY conf/vsftpd.conf /var/www/vsftpd.conf
COPY tools/configure.sh /var/www/configure.sh

CMD bash /var/www/configure.sh