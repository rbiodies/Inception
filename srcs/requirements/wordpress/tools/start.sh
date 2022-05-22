#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

mv /var/www/wp-config.php /var/www/html/wordpress;

chmod -R 775 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
chgrp -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress

echo "Wordpress: setting up..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;
wp core download --allow-root;
echo "Wordpress: creating users..."
wp core install --allow-root --url=${WP_URL} --title=${DB_NAME} --admin_user=${WP_ADMIN_LOGIN} --admin_email=${WP_ADMIN_EMAIL};
wp user create ${DB_USER} ${DB_EMAIL} --role=author --allow-root;
wp theme install inspiro --activate --allow-root
echo "Wordpress: set up!"

# tail -f /dev/null
exec "$@"