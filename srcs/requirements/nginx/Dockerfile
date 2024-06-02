# FROM
# 베이스 이미지로 Debian 12 사용
FROM debian:bookworm

# nginx dockerfile

# Nginx 실행 명령어 입력
CMD ["nginx", "-g", "daemon off;"]

# RUN
# 1. 패키지 목록 업데이트
# 2. nginx, openssl 설치
RUN apt-get update \
	&& apt-get install -y nginx openssl

# 443 포트를 외부에 노출
EXPOSE 443

# RUN
# 1. 인증서를 저장할 디렉토리 생성 (-p 옵션으로 상위 디렉토리가 없을 경우 자동생성)
# 2. 프라이빗 키와 인증서 생성 (nginx.key, nginx.crt)
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=seonjo.42.fr"

# Nginx 설정 파일 복사
COPY ./nginx.conf /etc/nginx/nginx.conf
