ifeq (,$(shell grep amonteli /etc/hosts))
_ := $(shell sudo bash -c '/bin/echo "127.0.0.1 aleferra.42.fr" >> /etc/hosts')
endif

SRC=srcs/docker-compose.yml

COMMAND=docker-compose

all: run

run:
	mkdir -p /home/aleferra/docker/data/database
	mkdir -p /home/aleferra/docker/data/wordpress
	$(COMMAND) -f $(SRC) up --build

fclean:
	$(COMMAND) -f $(SRC) down --rmi all -v
	rm -rf /home/amonteli/docker/data/wordpress
	rm -rf /home/amonteli/docker/data/database
