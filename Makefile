NAME= inception

all: run

run:
	mkdir -p /home/aleferra/data/database
	mkdir -p /home/aleferra/data/wordpress
	@docker-compose -f srcs/docker-compose.yml --env-file/.env up --build -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@docker rmi nginx
	@docker rmi mariadb
	@docker rmi wordpress
	@docker volume rm srcs_database_vol
	@docker volume rm srcs_wordpress_vol
	@docker system prune -f
	@sudo rm -rf /home/aleferra/data/wordpress
	@sudo rm -rf /home/aleferra/data/mariadb

.PHONY:	all run down clean