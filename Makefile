DATA_PATH = "/home/bbordere/data"

all:
	mkdir -p $(DATA_PATH)/mariadb $(DATA_PATH)/wordpress
	docker compose -f srcs/docker-compose.yml up --build

stop:
	docker compose -f srcs/docker-compose.yml stop
	docker compose -f srcs/docker-compose.yml down

clean: stop
	sudo rm -Rf $(DATA_PATH)/wordpress/* $(DATA_PATH)/mariadb/*