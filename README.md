# Inception
### Цели данного проекта:
- Расширение знаний в области системного администрирования с помощью Docker
- Виртуализация нескольких образов Docker на виртуальной машине
### Теоретический материал более простым языком:
1. [A beginner’s guide to Docker — how to create your first Docker application](https://www.freecodecamp.org/news/a-beginners-guide-to-docker-how-to-create-your-first-docker-application-cc03de9b639f) 
2. [How to Deploy MariaDB Server to a Docker Container](https://severalnines.com/blog/how-deploy-mariadb-server-docker-container)
3. [Руководство по Docker Compose для начинающих](https://habr.com/ru/company/ruvds/blog/450312/)
4. [Nginx, Php-Fpm и что это вообще?](https://perfect-inc.com/journal/nginx-php-fpm-i-chto-eto-voobshche/)
5. [MariaDB](https://ru.wikipedia.org/wiki/MariaDB)
6. [**Установка WordPress с помощью Docker Compose**](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose-ru)
### Руководство по реализации VirualBox - Debian 10.12 (buster), Containers - alpine:latest:
1. [Как установить Debian в VirualBox. Полная пошаговая инструкция](https://poznyaev.ru/debian-v-virualbox/)
> Скачать образ debian-10.12.0-amd64-xfce-CD-1.iso можно [здесь](https://cdimage.debian.org/cdimage/archive/10.12.0/amd64/iso-cd/debian-10.12.0-amd64-xfce-CD-1.iso)
<details>
<summary>Если вы работаете на школьных Mac, не забудьте выбрать папку goinfre</summary>

![](https://user-images.githubusercontent.com/90090114/169686068-c054eef9-8d84-4684-84d1-2f4d92a590eb.png)
</details>

>Чтобы увеличить размер окна виртуальной машины на MacOS, нажмите на окно виртуальной машины, затем в меню в верхей левой части экрана основной ОС нажмите View->Virtual Screen 1->Scale to 200% (autoscaled output)
2. [Настройка SSH в Debian для работы в терминале на основной ОС](https://losst.ru/nastrojka-ssh-v-debian)
>Достаточно выполнить пункт статьи "Установка SSH в Debian" и расскоментировать порт (значение порта менять необязательно)\
>[Не забудьте пробросить порт для SSH в VirtualBox](https://comp-security.net/%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%D1%81%D1%8F-%D0%BA-%D0%B2%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9-%D0%BC%D0%B0%D1%88%D0%B8%D0%BD%D0%B5-%D0%BF%D0%BE-ssh/)\
>Поле "Адрес гостя" можно оставить пустым\
>При возникновении ошибки "Такое подключение уже существует", удалите файл known_hosts в директории /Users/$USER/.ssh:
>```
>rm -rf /Users/$USER/.ssh/known_hosts
>```
>Для подключения Visual Studio Code к виртуальной машине запустите виртуальную машину и откройте Visual Studio Code. В VS Code откройте меню с помощью сочетания клавиш Command+Shift+P, введите "Remote-SSH: Connect to Host...", затем введите <your_login>@localhost:<your_port>, затем введите пароль пользователя виртуальной машины, откройте необходимую папку через Explorer->Open Folder и создайте новый терминал (не забудьте установить предложенные расширения в VS Code)
3. Устанавливаем необходимые для работы программы [Vim](https://vitux.com/how-to-install-vim-editor-on-debian/), [Make](https://ru.stackoverflow.com/questions/51452/%D0%92-linux-debian-%D0%BD%D0%B5%D1%82-%D1%81%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D0%BE-%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B-make-%D0%9A%D0%B0%D0%BA-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D1%82%D1%8C), [Git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-debian-10)
>Для установки Git достаточно выполнить пункт статьи "Installing Git with Default Packages"\
>[Включить «sudo» для учетной записи пользователя в Debian](https://milq.github.io/enable-sudo-user-account-debian/)
4. Изменим доменное имя в Debian. Открываем файл hosts с правами администратора (root):
```
sudo vim /etc/hosts
```
Далее в терминале вводим пароль администратора (root) (надеюсь, что предыдущий пункт Вы полностью выполнили) и в файле hosts меняем **localhost** на **<your_login>.42.fr**

5. [Установите Docker CE и Docker Compose на Debian 11/10](https://computingforgeeks.com/install-docker-and-docker-compose-on-debian/)
>Тестировать установку Docker Сompose пока необязательно\
>[Советую клонировать виртуальную машину в Oracle VM VirtualBox (на случай непредвиденных ошибок)](https://ddok.ru/klonirovat-virtualnuju-mashinu-v-oracle-vm-virtualbox/)
6. Создаем ожидаемую структуру каталогов, указанную в [Subject](https://cdn.intra.42.fr/pdf/pdf/47306/en.subject.pdf)
7. [Создаем Makefile](https://habr.com/ru/company/ruvds/blog/450312/)
>Сборка проекта начинается с 5 пункта
8. Создаем файл [docker-compose.yml](https://github.com/rbiodies/inception/blob/main/srcs/docker-compose.yml), который будет содержать инструкции, необходимые для запуска и настройки сервисов
>Вручную создайте директории, указанные в docker-compose.yml->volumes->device (или пропишите их создание в Makefile). Например:
>```
>mkdir -p /home/${USER}/data/db
>mkdir -p /home/${USER}/data/wp
>```
>С этого пункта начинается самое интересное. Здесь придется покопаться самостоятельно. Более побдробная инструкция по выполнению этих пунктов [здесь](https://github.com/SavchenkoDV/inception_School21_Ecole42) + [Лекция по docker compose (inception)](https://www.youtube.com/watch?v=RuTp0US9IgY) + Канал ft_inception в Slack
9. MariaDB
- Создаем [базу данных](https://github.com/rbiodies/inception/blob/main/srcs/requirements/mariadb/tools/createdb.sql) в директории srcs/requirements/mariadb/tools
>host_name должен быть либо %, либо Вы должны задать host_name принудительно и использовать его имя
- Создаем файл [50-server.cnf](https://exampleconfig.com/view/mariadb-ubuntu18-04-etc-mysql-mariadb-conf-d-50-server-cnf) в директории srcs/requirements/mariadb/conf
- Создаем [.dockerignore](https://bitworks.software/2018-11-14-dont-ignore-dockerignore-it-is-expensive.html) и [Dockerfile](https://github.com/rbiodies/inception/blob/main/srcs/requirements/mariadb/Dockerfile)  — файл Docker, который будет содержать инструкции, необходимые для создания окружения сервера. В Dockerfile прописываем установку nginx и openssl
10. Nginx
- Создаем [конфигурационный файл](https://github.com/rbiodies/inception/blob/main/srcs/requirements/nginx/conf/default), который описывает виртуальный хост, в директории srcs/requirements/nginx/conf
- Пишем [скрипт](https://github.com/rbiodies/inception/blob/main/srcs/requirements/nginx/tools/start.sh) для создания самозаверяющего сертификата для сервера в директории srcs/requirements/nginx/tools
- Создаем .dockerignore и [Dockerfile](https://github.com/rbiodies/inception/blob/main/srcs/requirements/nginx/Dockerfile)
11. WordPress + настраиваем работу [php-fpm](https://www.ukraine.com.ua/wiki/hosting/configuration/php-fpm/#:~:text=PHP%2DFPM%20(FastCGI%20Process%20Manager,%2B%20Apache%2C%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D0%BD%D0%B0%D1%8F%20%D0%BF%D0%BE%20%D1%83%D0%BC%D0%BE%D0%BB%D1%87%D0%B0%D0%BD%D0%B8%D1%8E.))
- Создаем файл директив пула [www.conf](https://gist.github.com/rvanzee/2352093), позволяющий запускать несколько «пулов» дочерних процессов и иметь разные конфигурации, в директории srcs/requirements/wordpress/conf
- Создаем файл конфигурации [wp-config.php](https://www.wpbeginner.com/beginners-guide/how-to-edit-wp-config-php-file-in-wordpress/), который является частью всех автономных сайтов WordPress, в директории srcs/requirements/wordpress/tools
- Создаем [скрипт](https://github.com/rbiodies/inception/blob/main/srcs/requirements/wordpress/tools/start.sh) в директории srcs/requirements/wordpress/tools. Скрипт может устанавливать интерфейс командной строки для WordPress и создавать двух пользователей, один из которых является администратором Вашей базы данных WordPress
> Имя пользователя администратора не может содержать admin/Admin или administrator/Administrator (например, admin, administrator, Administrator, admin-123, и так далее) (см. [Subject](https://cdn.intra.42.fr/pdf/pdf/47306/en.subject.pdf))
- Создаем .dockerignore и [Dockerfile](https://github.com/rbiodies/inception/blob/main/srcs/requirements/wordpress/Dockerfile)
12. Запустите контейнеры с помощью Makefile и зайдите на страницу WordPress в браузере своей виртуальной машины в VirtualBox по адресу своего хоста <your_login>.42.fr
>Если все работает верно, то при первом входе на сайт появится предупреждение. Нажмите "Дополнительно...", затем спуститесь вниз и нажмите "Принять риск и продолжить"

![VirtualBox_Debian Clone_22_05_2022_13_56_10](https://user-images.githubusercontent.com/90090114/169691800-39b420e3-759e-453b-983e-739ab1909123.png)
