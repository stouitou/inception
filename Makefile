NAME = inception


DOCKER_COMPOSE = ./srcs/docker-compose.yml

VOLUMES_DIR = ${HOME}/data



all: ${NAME}

${NAME}: up

clean: stop down

fclean: clean
	docker image prune -a -f
	sudo rm -rf ${VOLUMES_DIR}
	sudo sed -i "/stouitou.42.fr/d" /etc/hosts

re: fclean all

up: setup
	docker compose -f ${DOCKER_COMPOSE} up -d --build

start:
	docker compose -f ${DOCKER_COMPOSE} start

stop:
	docker compose -f ${DOCKER_COMPOSE} stop

down:
	docker compose -f ${DOCKER_COMPOSE} down -v

setup:
	mkdir -p ${VOLUMES_DIR}
	mkdir -p ${VOLUMES_DIR}/website
	mkdir -p ${VOLUMES_DIR}/database
	sudo sed -i "s|127.0.0.1|127.0.0.1\tstouitou.42.fr\n127.0.0.1|" /etc/hosts

.PHONY: all clean fclean re up start stop down setup
