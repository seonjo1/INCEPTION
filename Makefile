all : make

make:
	docker-compose -f ./srcs/docker-compose.yml up -d