FROM debian:bullseye

CMD [ "/script.sh" ]

EXPOSE 9000

RUN apt-get update && \
	apt-get install php7.4-fpm -y && \
	apt-get install php7.4-mysql -y && \
	apt-get install curl -y

RUN	mkdir -p /var/www/html

COPY script.sh /

RUN chmod +x /script.sh
