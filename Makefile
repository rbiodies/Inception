all:	up

# Мы можем запустить наши контейнеры с помощью команды docker-compose up, 
# которая будет создавать и запускать наши контейнеры и службы в указанном нами порядке
# Создайте контейнеры с помощью команды docker-compose up и флага -d, 
# которые будут запускать контейнеры mariadb​​​, wordpress и nginx в фоновом режиме
up:
		@mkdir -p /home/${USER}/data/db
		@mkdir -p /home/${USER}/data/wp
		@docker-compose -f srcs/docker-compose.yml up -d

# Команда docker-compose down остановит ваши контейнеры, но также удалит остановленные контейнеры, 
# а также все созданные сети
down:
		@docker-compose -f srcs/docker-compose.yml down

# Список контейнеров
ps:
		@docker-compose -f srcs/docker-compose.yml ps

# Команда docker system prune — это ярлык, который удаляет образы, контейнеры и сети. 
# Тома не удаляются по умолчанию, и вы должны указать флаг --volumes, 
# чтобы система Docker сократила количество томов. По умолчанию вам будет предложено продолжить. 
# Чтобы обойти подсказку, используйте флаг -f или --force
# Если указан `-a`, также будут удалены все изображения, на которые не ссылается какой-либо контейнер
fclean:	down
		@docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker system prune -a --force
		sudo rm -Rf /home/${USER}/data/db
		sudo rm -Rf /home/${USER}/data/wp
		mkdir /home/${USER}/data/db
		mkdir /home/${USER}/data/wp

# Создавайте или перестраивайте сервисы
re:
		@mkdir -p ../data/wp
		@mkdir -p ../data/db
		@docker-compose -f srcs/docker-compose.yml build
		docker-compose -f srcs/docker-compose.yml up

.PHONY:	all up down ps fclean re