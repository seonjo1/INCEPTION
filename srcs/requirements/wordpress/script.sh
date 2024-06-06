
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

wp core download --allow-root

wp config create \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASS \
    --dbhost=mariadb \
    --allow-root

wp core install \
    --url=$DOMAIN \
    --title=INCEPTION \
    --admin_user=$ADMIN_USER \
    --admin_password=$ADMIN_PASS \
    --admin_email=$ADMIN_EMAIL \
    --allow-root

chmod -R 777 /var/www

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

echo "clear_env = no" >> /etc/php/8.2/fpm/pool.d/www.conf

exec /usr/sbin/php-fpm8.2 -F