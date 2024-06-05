
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html --allow-root

wp config create \
    --path=/var/www/html \
    --dbname=wordpress \
    --dbuser=wordpress \
    --dbpass=wordpress \
    --dbhost=localhost \
    --skip-check \
    --allow-root

exec /usr/sbin/php-fpm8.2 -F