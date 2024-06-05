
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html --allow-root

wp core install \
    --path=/var/www/html \
    --url=seonjo.42.fr \
    --title=seonjo \
    --admin_user=seonjo \
    --admin_password=password \
    --admin_email=seonjo@student.42seoul.kr \
    --allow-root

exec /usr/sbin/php-fpm8.2 -F