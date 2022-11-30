NAME=inception

all:
	@mkdir -p /home/aleferra/data/db
	@docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f srcs/docker-compose.yml down

clean: down 
	@docker system prune -f

fclean: down
	@docker volume srcs_nginx
	@docker rmi srcs_mariadb
	@docker system prune -f

re: clean all

.PHONY: all re clean fclean down