FROM debian:bookworm

CMD [ "/script.sh" ]

EXPOSE 9000

RUN apt-get update -y &&
    apt-get install php8.2-fpm -y &&
    mkdir -p /var/www/html

COPY script.sh /

RUN chmod +x /script.sh
