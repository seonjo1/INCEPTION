all : make

make:
	docker compose -f ./srcs/docker-compose.yml up -d

clean:
	docker compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	docker image prune
	docker system prune -a

re : fclean all

.PHONY: all re clean fclean