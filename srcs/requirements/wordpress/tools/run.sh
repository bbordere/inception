#!/bin/sh

/wait

# echo "127.0.0.1 bbordere.42.fr" >> /etc/hosts

if ! wp --allow-root core is-installed; then

	wp --allow-root core download

	wp --allow-root config create	--dbname=$DB_NAME --dbuser=$DB_USER				\
									--dbpass=$DB_USER_PWD --dbhost=mariadb --dbprefix=wp_

	wp --allow-root core install 													\
				--url=https://bbordere.42.fr --title=Inception 					\
				--admin_user=$WP_USER_ADMIN --admin_password=$WP_USER_ADMIN_PWD \
				--admin_email=$WP_USER_ADMIN_MAIL --skip-email

	wp --allow-root user create $WP_USER_AUTHOR $WP_USER_AUTHOR_MAIL --user_pass=$WP_USER_AUTHOR_PWD --role=contributor

	wp --allow-root theme install lensation --activate
fi

php-fpm7 -F
