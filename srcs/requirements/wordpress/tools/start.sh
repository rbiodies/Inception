#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
# sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /var/www/wp-config.php;
# sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /var/www/wp-config.php;
# sed -i -e "s/\${DB_USER}/${DB_USER}/g" /var/www/wp-config.php;
# sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /var/www/wp-config.php;


mv /var/www/wp-config.php /var/www/html/wordpress;
# mv /tmp/www.conf /etc/php/7.3/fpm/pool.d/www.conf;

chmod -R 775 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
chgrp -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress

echo "Wordpress: setting up..."
# mkdir -p var/www/html/wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# php wp-cli.phar --info;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;
wp core download --allow-root;
# mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_email=${WP_ADMIN_EMAIL};
wp user create ${DB_USER} ${DB_EMAIL} --role=author --allow-root;
wp theme install inspiro --activate --allow-root
echo "Wordpress: set up!"

# tail -f /dev/null
exec "$@"