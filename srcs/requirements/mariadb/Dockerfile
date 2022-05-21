FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/* /var/www/

EXPOSE 3306

RUN service mysql start && mysql < /var/www/createdb.sql && rm -f /var/www/createdb.sql

CMD /usr/bin/mysqld_safe

# FROM debian:buster

# LABEL maintainer="rbiodies"

# RUN apt update && \
# 	apt install -y nginx openssl \
# 		nano curl net-tools

# COPY conf/* /etc/mysql/my.cnf;
# # COPY tools/* /tmp/

# EXPOSE 443

# CMD sh -c "ls tools && sh tools/start.sh"