# задаёт базовый (родительский) образ
FROM debian:buster

# выполняет команду и создаёт слой образа. Используется для установки в контейнер пакетов
RUN apt update
RUN apt install -y mariadb-server

# копирует в контейнер файлы и папки
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /

# указывает на необходимость открыть порт
EXPOSE 3306

RUN service mysql start && mysql < createdb.sql && rm -f createdb.sql

# описывает команду с аргументами, которую нужно выполнить когда контейнер будет запущен
CMD /usr/bin/mysqld_safe