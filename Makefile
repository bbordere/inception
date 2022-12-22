DATA_PATH = "./data"

all:
	mkdir -p $(DATA_PATH)/db $(DATA_PATH)/wp
	docker compose build
	docker compose up -d

stop:
	docker compose stop
	docker compose down

clean: stop
	sudo rm -Rf data/wp/* data/db/*