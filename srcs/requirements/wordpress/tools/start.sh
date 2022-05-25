#!/bin/bash

# Замените все вхождения строки в файле, перезаписав файл (т.е. на месте):
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
# -R рекурсивное изменение прав доступа для каталогов и их содержимого
chmod -R 775 /var/www/html/wordpress;
# Следующий пример изменит владельца всех файлов и 
# подкаталогов в /var/www/html/wordpress каталоге на нового владельца и группу с именем www-data :
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# php -S 0.0.0.0:9000 -t /var/www/html/wordpress

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
echo "Wordpress: setting up..."
# После проверки требований загрузите файл wp-cli.phar , используя wget или curl:
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# «+x» означает — установить разрешение на запуск (x) файла для всех пользователей.
chmod +x wp-cli.phar;
# Чтобы использовать WP-CLI из командной строки, набрав wp, сделайте файл исполняемым и 
# переместите его куда-нибудь в PATH. Например:
mv wp-cli.phar /usr/local/bin/wp;
cd /var/www/html/wordpress;
# Загружает и извлекает основные файлы WordPress по указанному пути

# static website
    mv /var/www/index.html /var/www/html/index.html

#  adminer
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
    wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null

wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/wordpress;
echo "Wordpress: creating users..."
# Создает таблицы WordPress в базе данных, 
# используя URL-адрес, заголовок и предоставленные данные пользователя-администратора по умолчанию
# --url=<адрес>
# Адрес нового сайта.
# --title=<название сайта>
# Название нового сайта.
# --admin_user=<имя пользователя>
# Имя пользователя-администратора.
# [--admin_password=<пароль>]
# Пароль для пользователя admin. По умолчанию используется случайно сгенерированная строка.
# --admin_email=<электронная почта>
# Адрес электронной почты администратора.
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL};
# Создает нового пользователя
# <user-login>
# Логин пользователя для создания.
# <user-email>
# Адрес электронной почты пользователя для создания.
# [--role=<role>]
# Роль пользователя для создания. По умолчанию: роль по умолчанию
# Возможные значения включают «администратор», «редактор», «автор», «участник», «подписчик».
# [--user_pass=<password>]
# Пароль пользователя. По умолчанию: генерируется случайным образом
wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
# Тема для WordPress
wp theme install inspiro --activate --allow-root

# enable redis cache
    sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
    #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root

echo "Wordpress: set up!"
else
echo "Wordpress: is already set up!"
fi

wp redis enable --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 -F