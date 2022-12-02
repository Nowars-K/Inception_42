NAME= inception

all: run

run:
	mkdir -p /home/aleferra/docker/data/database
	mkdir -p /home/aleferra/docker/data/wordpress
	@docker-compose -f srcs/docker-compose.yml up --build -d

fclean:
	$(COMMAND) -f $(SRC) down --rmi all -v
	rm -rf /home/amonteli/docker/data/wordpress
	rm -rf /home/amonteli/docker/data/database
