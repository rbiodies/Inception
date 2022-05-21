FROM debian:buster

RUN apt-get  update
RUN apt-get  install nginx -y
RUN apt-get  install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Example-Certificates/CN=rbiodies.42.fr"

COPY ./conf/default etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]

# FROM debian:buster

# RUN apt update && \
# 	apt install -y nginx openssl \
# 		nano curl net-tools

# COPY conf/* /etc/nginx/sites-available/
# COPY tools/* /etc/nginx/sites-available/

# EXPOSE 443

# CMD sh -c "ls /etc/nginx/sites-available/ && sh /etc/nginx/sites-available/start.sh"