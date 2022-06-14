# Inception
### Цели данного проекта:
- Расширение знаний в области системного администрирования с помощью Docker
- Виртуализация нескольких образов Docker на виртуальной машине
## Обязательная часть
### Теоретический материал простым языком:
1. [A beginner’s guide to Docker — how to create your first Docker application](https://www.freecodecamp.org/news/a-beginners-guide-to-docker-how-to-create-your-first-docker-application-cc03de9b639f) 
2. [How to Deploy MariaDB Server to a Docker Container](https://severalnines.com/blog/how-deploy-mariadb-server-docker-container)
3. [Руководство по Docker Compose для начинающих](https://habr.com/ru/company/ruvds/blog/450312/)
4. [Nginx, Php-Fpm и что это вообще?](https://perfect-inc.com/journal/nginx-php-fpm-i-chto-eto-voobshche/)
5. [MariaDB](https://ru.wikipedia.org/wiki/MariaDB)
6. [**Установка WordPress с помощью Docker Compose**](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose-ru)
7. [Running MariaDB in a Docker Container](https://quebit.com/askquebit/quebit-products/running-mariadb-in-a-docker-container/#:~:text=Now%20that%20my,the%20bash%20shell%3A)
>Последняя статья пригодится во время сдачи проекта при проверке базы данных (см. [Checklist](https://github.com/mharriso/school21-checklists/blob/master/ng_3_inception.pdf))
### Руководство по реализации <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/virtualbox.svg" /> VirualBox - <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/debian.svg" /> Debian 10.12 (buster), <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/linuxcontainers.svg" /> Containers - debian:buster:
1. [Как установить Debian в VirualBox. Полная пошаговая инструкция](https://poznyaev.ru/debian-v-virualbox/)
>Скачать образ debian-10.12.0-amd64-xfce-CD-1.iso можно [здесь](https://cdimage.debian.org/cdimage/archive/10.12.0/amd64/iso-cd/debian-10.12.0-amd64-xfce-CD-1.iso)
<details>
<summary>Если вы работаете на школьных <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/apple.svg" /> Mac, не забудьте выбрать папку goinfre</summary>

![](https://user-images.githubusercontent.com/90090114/169686068-c054eef9-8d84-4684-84d1-2f4d92a590eb.png)
</details>

>Чтобы увеличить размер окна виртуальной машины в MacOS, либо нажмите на окно виртуальной машины, затем на панели основной ОС в верхей левой части экрана нажмите View->Virtual Screen 1->Scale to 200% (autoscaled output), либо измените разрешение экрана в настройках виртуальной машины (возможно, появление торможения виртуальной машины)
2. Устанавливаем необходимые для работы программы <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/vim.svg" /> [Vim](https://vitux.com/how-to-install-vim-editor-on-debian/), [Make](https://ru.stackoverflow.com/questions/51452/%D0%92-linux-debian-%D0%BD%D0%B5%D1%82-%D1%81%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D0%BE-%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B-make-%D0%9A%D0%B0%D0%BA-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D1%82%D1%8C), [Git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-debian-10)
>- Для установки <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/git.svg" /> Git достаточно выполнить пункт статьи "Installing Git with Default Packages"
>- [Включить «sudo» для учетной записи пользователя в Debian](https://milq.github.io/enable-sudo-user-account-debian/)
3. [Настройка SSH в Debian для работы в терминале в основной ОС](https://losst.ru/nastrojka-ssh-v-debian)
>- Достаточно выполнить пункт статьи "Установка SSH в Debian" и расскоментировать порт (значение порта менять необязательно)
>- [Не забудьте пробросить порт для SSH в VirtualBox](https://comp-security.net/%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B8%D1%82%D1%8C%D1%81%D1%8F-%D0%BA-%D0%B2%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D1%8C%D0%BD%D0%BE%D0%B9-%D0%BC%D0%B0%D1%88%D0%B8%D0%BD%D0%B5-%D0%BF%D0%BE-ssh/)
>>Поле "Адрес гостя" можно оставить пустым
>- При возникновении ошибки "Такое подключение уже существует", удалите файл known_hosts в директории /Users/$USER/.ssh:
>```
>rm -rf /Users/$USER/.ssh/known_hosts
>```
>- Для подключения <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/visualstudiocode.svg" /> **Visual Studio Code** к виртуальной машине запустите виртуальную машину. Откройте Visual Studio Code на основной ОС. Слева на панели VS Code выберите Extensions (Расширения) и найдите и скачайте расширение "Remote - SSH". Затем в VS Code откройте меню с помощью сочетания клавиш Command+Shift+P, введите "Remote-SSH: Connect to Host..." и нажмите Enter. Там же введите **<your_login>@localhost:<your_port>**, затем введите пароль пользователя виртуальной машины, откройте необходимую папку через Explorer->Open Folder слева на панели VS Code, снова введите пароль пользователя виртуальной машины и создайте новый терминал
4. Изменим доменное имя в Debian. Открываем файл hosts с правами администратора (root):
```
sudo vim /etc/hosts
```
Далее в терминале вводим пароль администратора (root) и в файле hosts меняем **localhost** на **<your_login>.42.fr**
>Надеюсь, что Вы полностью выполнили 2 пункт
5. [Установите <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/docker.svg" /> Docker CE и Docker Compose на Debian 11/10](https://computingforgeeks.com/install-docker-and-docker-compose-on-debian/)
>- Тестировать установку Docker Сompose пока необязательно
>- [Советую клонировать виртуальную машину в Oracle VM VirtualBox](https://ddok.ru/klonirovat-virtualnuju-mashinu-v-oracle-vm-virtualbox/) (на случай непредвиденных ошибок)
6. Создаем ожидаемую структуру каталогов, указанную в [Subject](https://cdn.intra.42.fr/pdf/pdf/47306/en.subject.pdf)
7. [Создаем Makefile](https://habr.com/ru/company/ruvds/blog/450312/#:~:text=%E2%96%8D5.-,%D0%A1%D0%B1%D0%BE%D1%80%D0%BA%D0%B0%20%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B0,-%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%82%D0%BE%D0%B3%D0%BE%2C%20%D0%BA%D0%B0%D0%BA)
>Сборка проекта начинается с 5 пункта статьи
8. Создаем файл [docker-compose.yml](https://github.com/rbiodies/inception/blob/main/srcs/docker-compose.yml), который будет содержать инструкции, необходимые для запуска и настройки сервисов
>Вручную создайте директории, указанные в docker-compose.yml->volumes->device (или пропишите их создание в Makefile). Например:
>```
>mkdir -p /home/${USER}/data/db
>mkdir -p /home/${USER}/data/wp
>```
9. <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/mariadb.svg" /> MariaDB
- Создаем [базу данных](https://github.com/rbiodies/inception/blob/main/srcs/requirements/mariadb/tools/createdb.sql) в директории srcs/requirements/mariadb/tools
>host_name должен быть либо %, либо Вы должны задать host_name принудительно и использовать его имя
- Создаем файл [50-server.cnf](https://exampleconfig.com/view/mariadb-ubuntu18-04-etc-mysql-mariadb-conf-d-50-server-cnf) в директории srcs/requirements/mariadb/conf
- Создаем [.dockerignore](https://bitworks.software/2018-11-14-dont-ignore-dockerignore-it-is-expensive.html) и [Dockerfile](https://github.com/rbiodies/inception/blob/main/srcs/requirements/mariadb/Dockerfile) — файл Docker, который будет содержать инструкции, необходимые для создания окружения сервера
>Так как контейнер Docker работает полностью изолированно от хост-среды, то, чтобы получить доступ к среде (файлам) контейнера, необходимо в консоли ввести команду:
>```
>docker exec -it <container_name> bash
>```
10. <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/nginx.svg" /> Nginx
- Создаем [конфигурационный файл](https://github.com/rbiodies/inception/blob/main/srcs/requirements/nginx/conf/default), который описывает виртуальный хост, в директории srcs/requirements/nginx/conf
- Пишем [скрипт](https://github.com/rbiodies/inception/blob/main/srcs/requirements/nginx/tools/start.sh) для создания самозаверяющего сертификата для сервера в директории srcs/requirements/nginx/tools
- Создаем .dockerignore и Dockerfile. В Dockerfile задаем базовый (родительский) образ, прописываем выполнение команд для установки пакетов nginx и openssl в контейнер, указываем на необходимость открыть порт 443, прописываем копирование конфигурационного файла default в директорию /etc/nginx/sites-enabled и скрипта в любую директорию (например, /var/www/) и описываем команду bash со скриптом в качестве аргумента, которую нужно выполнить, когда контейнер будет запущен
11. <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/wordpress.svg" /> WordPress + настраиваем работу [php-fpm](https://www.ukraine.com.ua/wiki/hosting/configuration/php-fpm/#:~:text=PHP%2DFPM%20(FastCGI%20Process%20Manager,%2B%20Apache%2C%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D0%BD%D0%B0%D1%8F%20%D0%BF%D0%BE%20%D1%83%D0%BC%D0%BE%D0%BB%D1%87%D0%B0%D0%BD%D0%B8%D1%8E.))
- Создаем файл директив пула [www.conf](https://gist.github.com/rvanzee/2352093), позволяющий запускать несколько «пулов» дочерних процессов и иметь разные конфигурации, в директории srcs/requirements/wordpress/conf
- Создаем файл конфигурации [wp-config.php](https://www.wpbeginner.com/beginners-guide/how-to-edit-wp-config-php-file-in-wordpress/), который является частью всех автономных сайтов WordPress, в директории srcs/requirements/wordpress/tools
- Создаем [скрипт](https://github.com/rbiodies/inception/blob/main/srcs/requirements/wordpress/tools/start.sh) в директории srcs/requirements/wordpress/tools. Скрипт может устанавливать интерфейс командной строки для WordPress и создавать двух пользователей, один из которых является администратором Вашей базы данных WordPress
>Имя пользователя администратора не может содержать admin/Admin или administrator/Administrator (например, admin, administrator, Administrator, admin-123, и так далее) (см. [Subject](https://cdn.intra.42.fr/pdf/pdf/47306/en.subject.pdf))
- Создаем .dockerignore и Dockerfile. В Dockerfile задаем базовый (родительский) образ, прописываем выполнение команд для установки пакетов php7.3, php-mysqli, php-fpm, curl и sendmail с флагом -y в контейнер, указываем на необходимость открыть порт 9000, прописываем копирование конфигурационного файла [www.conf](https://gist.github.com/rvanzee/2352093) в директорию /etc/php/7.3/fpm/pool.d и скрипта в любую директорию (например, /var/www/) и описываем команду bash со скриптом в качестве аргумента, которую нужно выполнить, когда контейнер будет запущен
12. Запустите контейнеры с помощью Makefile и зайдите на страницу WordPress в браузере своей виртуальной машины в VirtualBox по адресу своего хоста <your_login>.42.fr
>Если все работает верно, то при первом входе на сайт появится предупреждение. Нажмите "Дополнительно...", затем спуститесь вниз и нажмите "Принять риск и продолжить"

![VirtualBox_Debian Clone_26_05_2022_13_56_48](https://user-images.githubusercontent.com/90090114/170475027-c35c2f83-86e6-412c-a74f-78710f77f316.png)
>Ваша тема Wordpress может отличаться от темы, представленной на данном скриншоте
## Бонусная часть
### Список бонусов:
- Настройте кеш Redis для своего веб-сайта WordPress, чтобы правильно управлять кешем.
- Настройте контейнер FTP-server, указывающий на том вашего сайта WordPress.
- Создайте простой статический веб-сайт на выбранном вами языке, кроме PHP (да, PHP исключен!). Например, сайт-витрина или сайт для представления вашего резюме.
- Настроить Adminer.
- Настройте сервис по вашему выбору, который вы считаете полезным. Во время защиты вам придется обосновать свой выбор.
### Полезные источники:
1. [Установка <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/redis.svg" /> Redis средствами Docker](https://www.elma-bpm.ru/KB/article-7354.html#:~:text=docker%20exec%20%2Dit%20%D0%B8%D0%BC%D1%8F_%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B0_%D1%80%D0%B5%D0%B4%D0%B8%D1%81%20bash)
2. [Настройка Redis для WordPress](https://wpgutenberg.top/nastrojka-redis-dlja-wordpress/#:~:text=redis%2Dcli-,monitor,-%D0%92%D1%8B%2C%20%D1%81%D0%BA%D0%BE%D1%80%D0%B5%D0%B5%20%D0%B2%D1%81%D0%B5%D0%B3%D0%BE)
3. [Установка и настройка Vsftpd в linux Debian с загрузкой файлов в каталог пользователя](https://chuzhoy007.ru/ustanovka-i-nastrojka-ftp-servera-vsftpd-na-linux-debian#:~:text=%D1%83%D0%B4%D0%B0%D0%BB%D0%B0%D1%81%D1%8C.%20%D0%9C%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%B2%D1%8B%D0%B9%D1%82%D0%B8.-,%D0%A2%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20FTP%20%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0%20%D1%81%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E%20%D0%BA%D0%BB%D0%B8%D0%B5%D0%BD%D1%82%D0%B0%20Filezilla,-%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0%20vsftpd%20%D0%B2)
4. [WordPress (FPM Edition) - Docker](https://github.com/mjstealey/wordpress-nginx-docker#:~:text=similar%20to%20this.-,Adminer,-An%20Adminer%20configuration)
5. [Установка Docker <img height="20" width="20" src="https://unpkg.com/simple-icons@v6/icons/portainer.svg" /> Portainer](https://losst.ru/ustanovka-docker-portainer)
