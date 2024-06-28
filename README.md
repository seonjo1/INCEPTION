# INCEPTION
docker compose를 사용하여 NGINX, WordPress, MariaDB 로 구성된 웹 인프라를 Debian 기반의 Docker 컨테이너로 구축하기

## 필요한 개념
- Docker
- Docker Compose
- Virtual Machine (VM)

## 도커 컴포즈 설정 특징

- 컨테이너들의 Docker 이미지를 직접 빌드
- Debian 의 두번째 stable 버전에서 이미지 빌드
- mariadb -> wordpress -> nginx 컨테이너 순으로 의존성 설정
- wordpress 가 설치되는 공간, Database 가 만들어지는 공간은 volumes 설정으로 호스트 컴퓨터에 마운트
- mariadb, wordpress, nginx 는 각각의 컨테이너에서 독립적으로 실행
- bridge 유형의 네트워크로 mariadb, wordpress, nginx 연결

## 컨테이너별 특징

### mariadb 컨테이너

- mariadb 를 포함한 docker 컨테이너

### wordpress 컨테이너

- PHP-FPM 이 설치되고 구성된 wordpress 를 포함한 docker 컨테이너

### nginx 컨테이너

- ssl 연결시 TLSv1.3 프로토콜 사용하도록 설정된 nginx 를 포함한 docker 컨테이너

## build

```
make
```

- docker compose 실행

```
make clean
```

- docker compose 종료

```
make fclean
```

- make clean + docker 리소스 삭제

```
make re
```

- make fclean + make

--- 

<img width="219" alt="스크린샷 2024-06-28 오후 4 36 11" src="https://github.com/seonjo1/INCEPTION/assets/127729846/1fff36a3-1469-4077-848b-040297f71bb6">
