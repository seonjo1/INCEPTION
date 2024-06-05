FROM debian:bookworm

CMD [ "/script.sh" ]

RUN apt-get update -y
RUN apt-get install php8.2-fpm -y

RUN mkdir -p /var/www/html

COPY script.sh /script.sh
RUN chmod +x /script.sh

EXPOSE 9000