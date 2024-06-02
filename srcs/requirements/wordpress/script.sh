
# wordpress cli 명령 설치 및 path에 옮기기
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html

wp config create \
    --path=/var/www/html \
    --dbname=wordpress \
    --dbuser=wordpress \
    --dbpass=wordpress \
    --dbhost=localhost \
    --skip-check

wp core install \
    --path=/var/www/html \
    --url=seonjo.42.fr \
    --title=seonjo \
    --admin_user=seonjo \
    --admin_password=password \
    --admin_email=seonjo@student.42seoul.kr


# www.conf 파일 수정
# 듣기 포트 9000번으로 변경
sudo sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
# php-fpm이 환경변수를 초기화하지 않도록 설치
echo "clear_env = no" >> /etc/php/8.2-fpm/pool.d/www.conf

# php-fpm 포그라운드에서 실행
exec /usr/sbin/php-fpm8.2 -F