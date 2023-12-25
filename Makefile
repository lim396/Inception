include ./srcs/.env

NAME = inception

.PHONY: $(NAME)
$(NAME): all

.PHONY: all
all: build up

.PHONY: re
re: fclean build up

.PHONY: up
up:
	docker compose -f srcs/docker-compose.yml up

.PHONY: down
down:
	docker compose -f srcs/docker-compose.yml down

.PHONY: build
build: init
	docker compose -f srcs/docker-compose.yml build

.PHONY: rebuild
rebuild:
	docker compose -f srcs/docker-compose.yml build --no-cache

.PHONY: clean
clean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

.PHONY: fclean
fclean: clean
	sudo rm -rf "/home/${LOGIN}/data/wordpress"
	sudo rm -rf "/home/${LOGIN}/data/db"

.PHONY: reset
reset: fclean
	docker system prune -f
	docker container prune -f
	docker image prune -f
	docker volume prune -f
	docker network prune -f

.PHONY: init
init:
	sudo mkdir -p "/home/${LOGIN}/data/wordpress"
	sudo mkdir -p "/home/${LOGIN}/data/db"
	sudo sed -i "s/localhost/${DOMAIN_NAME}/" /etc/hosts

