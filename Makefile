all:	up

# Создание и запуск контейнеров
up:
		@mkdir -p ../data/wp
		@mkdir -p ../data/db
		@docker-compose -f srcs/docker-compose.yml up

# Остановить и удалить контейнеры, сети
down:
		@docker-compose -f srcs/docker-compose.yml down

# Список контейнеров
ps:
		@docker-compose -f srcs/docker-compose.yml ps

# Команда docker system prune — это ярлык, который удаляет образы, контейнеры и сети. Тома не удаляются по умолчанию, и вы должны указать флаг --volumes, чтобы система Docker сократила количество томов. По умолчанию вам будет предложено продолжить. Чтобы обойти подсказку, используйте флаг -f или --force
# Если указан `-a`, также будут удалены все изображения, на которые не ссылается какой-либо контейнер
fclean:	down
		docker rmi -f $(sudo docker images -qa)
		docker rm -f $(sudo docker ps -qa)
		docker rm -f $(sudo docker ps -ls)
		docker volume rm $(sudo docker volume ls -q)
		docker system prune -a --volume
		docker system prune -a --force
		sudo rm -Rf ../data/mariadb
		sudo rm -Rf ../data/wordpress
		mkdir ../data/mariadb
		mkdir ../data/wordpress

# Создавайте или перестраивайте сервисы
re:
		@mkdir -p ../data/wp
		@mkdir -p ../data/db
		@docker-compose -f srcs/docker-compose.yml up --build

.PHONY:	all up down ps fclean re