DATA_PATH = "/home/bbordere/data"

all:
	mkdir -p $(DATA_PATH)/mariadb $(DATA_PATH)/wordpress
	docker compose -f srcs/docker-compose.yml up --build -d

stop:
	docker compose -f srcs/docker-compose.yml stop

clean: stop
	docker compose -f srcs/docker-compose.yml down
	sudo rm -Rf $(DATA_PATH)/wordpress/* $(DATA_PATH)/mariadb/*

re: clean all

.PHONY: all stop clean re