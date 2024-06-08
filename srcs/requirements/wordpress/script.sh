
if [ ! -f /usr/local/bin/wp ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/html

	rm -rf *

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
		--skip-email \
		--allow-root

	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --allow-root
fi

chmod -R 777 /var/www

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

echo "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

exec /usr/sbin/php-fpm7.4 -F