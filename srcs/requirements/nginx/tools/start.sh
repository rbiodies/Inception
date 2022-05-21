# Set SSL-certificate
mdkir /var/ssl/;

openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=Example-Certificates/CN=rbiodies.42.fr";

# Put configs
# cp /tmp/default /etc/nginx/sites-available/;
# rm -f /tmp/default;
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default;

# Run nginx
nginx -g 'daemon off;';