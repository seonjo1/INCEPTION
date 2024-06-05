all : make

make:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down -v
	sudo docker image prune

fclean: clean

re : clean all

.PHONY: all re clean fclean