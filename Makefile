NAME = inception


DOCKER_COMPOSE = ./srcs/docker-compose.yml

SERVICES = nginx \
	   mariadb \
	   wordpress

VOLUMES_DIR = /home/stouitou/data



all: ${NAME}

${NAME}: up

clean: stop down

fclean: clean
	docker image prune -a

re: fclean all

up: setup
	docker compose -f ${DOCKER_COMPOSE} up -d --build

start:
	docker compose -f ${DOCKER_COMPOSE} start

stop:
	docker compose -f ${DOCKER_COMPOSE} stop

down:
	docker compose -f ${DOCKER_COMPOSE} down

setup:
	mkdir -p /home/stouitou/data/website
	mkdir -p /home/stouitou/data/database

.PHONY: all clean fclean re up start stop down setup
