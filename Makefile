DOCKER_COMPOSE=docker-compose -f srcs/docker-compose.yml

all: up

up:
	@sudo mkdir -p /home/ubuntu/data
	@sudo mkdir -p /home/ubuntu/data/wordpress_data
	@sudo mkdir -p /home/ubuntu/data/mariadb_data
	$(DOCKER_COMPOSE) up --build

 down:
	@$(DOCKER_COMPOSE) down

 clean:
	@$(DOCKER_COMPOSE) down --rmi all
	@sudo rm -rf /home/ubuntu/data

fclean: clean
	@sudo docker builder prune -f
	@sudo docker container prune -f
	@sudo docker network prune -f
	@sudo docker volume prune -f
	@sudo docker image prune -a -f
	@sudo docker system prune -a --volumes -f

eval:
	docker stop $(docker ps -qa);
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null;

re: down fclean up
