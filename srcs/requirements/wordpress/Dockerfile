FROM debian:bookworm

CMD [ "/script.sh" ]

COPY script.sh /var/www/script.sh

RUN apt-get update -y

RUN apt-get install php8.2-fpm -y

RUN mkdir -p /var/www/html

RUN chmod +x /var/www/script.sh


EXPOSE 9000