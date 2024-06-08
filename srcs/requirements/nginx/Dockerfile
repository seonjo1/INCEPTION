FROM debian:bullseye

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443

RUN apt-get update \
    && apt-get install -y nginx openssl

RUN mkdir -p "$SSLPATH" && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$KEYS" -out "$CERTS" -subj "/CN=$DOMAIN"

COPY nginx.conf /etc/nginx/