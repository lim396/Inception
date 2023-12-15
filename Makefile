NAME = inception

.PHONY: all
all: up

.PHONY: re
re: down build up

.PHONY: up
up:
	docker compose -f srcs/docker-compose.yml up -d

.PHONY: down
down:
	docker compose -f srcs/docker-compose.yml down

.PHONY: build
build:
	docker compose -f srcs/docker-compose.yml build

.PHONY: rebuild
rebuild:
	docker compose -f srcs/docker-compose.yml build --no-cache

.PHONY: clean
clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

