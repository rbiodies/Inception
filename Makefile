all:	up

up:
		@mkdir -p ../data/wp
		@mkdir -p ../data/db
		@docker-compose -f srcs/docker-compose.yml up

down:
		@docker-compose -f srcs/docker-compose.yml down

ps:
		@docker-compose -f srcs/docker-compose.yml ps

fclean:	down
		docker volume rm -f wp
		docker volume rm -f db
		rm -Rf ../data/db
		rm -Rf ../data/wp

re:
		@mkdir -p ../data/wp
		@mkdir -p ../data/db
		@docker-compose -f srcs/docker-compose.yml up --build

.PHONY:	all up down ps fclean re