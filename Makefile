NAME= inception

all: run

run:
	mkdir -p /home/aleferra/docker/data/database
	mkdir -p /home/aleferra/docker/data/wordpress
	$(COMMAND) -f $(SRC) up --build

fclean:
	$(COMMAND) -f $(SRC) down --rmi all -v
	rm -rf /home/amonteli/docker/data/wordpress
	rm -rf /home/amonteli/docker/data/database
