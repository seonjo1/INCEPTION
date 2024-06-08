FROM debian:bullseye

CMD [ "/script.sh" ]

EXPOSE 9000

RUN apt-get update && \
	apt-get install php8.2-fpm -y && \
	apt-get install php8.2-mysql -y && \
	apt-get install curl -y && \
	mkdir -p /var/www/html

COPY script.sh /

RUN chmod +x /script.sh
