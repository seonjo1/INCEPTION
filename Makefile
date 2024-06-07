all : make

make:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	sudo docker image prune
	sudo docker system prune -a

re : fclean all

.PHONY: all re clean fclean