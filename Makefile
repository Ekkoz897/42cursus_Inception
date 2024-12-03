NAME = inception
NGINX_DIR = srcs/requirements/nginx

all: ${NAME}

${NAME}:
	@sudo mkdir -p /home/apereira/data/wordpress /home/apereira/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

clean:
	@sudo docker ps -qa | xargs -r sudo docker stop
	@sudo docker ps -qa | xargs -r sudo docker rm
	@sudo docker images -qa | xargs -r sudo docker rmi -f
	@sudo docker volume ls -q | xargs -r sudo docker volume rm
	@sudo docker network ls --format '{{.Name}}' | grep -vE 'bridge|host|none' | xargs -r sudo docker network rm
	@sudo rm -rf /home/apereira/data/wordpress /home/apereira/data/mariadb

re: down clean all

git:
	find . -type f -name '*.o' -exec rm {} +
	@git add .
	@git commit
	@git push
	@clear
	@echo "|                                                 |"
	@echo "|                                                 |"
	@echo "|      -------{ Commited and Pushed }-------      |"
	@echo "|                                                 |"
	@echo "|                                                 |"


.PHONY: all re down clean
