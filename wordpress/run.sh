#!/bin/sh

until mysql --host=db --user=bbordere --password=1234 -e '\d'; do
  echo "Waiting mariadb ..."
  sleep 1
done

if ! wp --allow-root core is-installed; then

	wp --allow-root core download

	wp --allow-root config create	--dbname=$DB_NAME --dbuser=$DB_USER				\
									--dbpass=$DB_USER_PWD --dbhost=db --dbprefix=wp_

	wp --allow-root core install 													\
				--url=https://bbordere.42.fr --title=Inception 					\
				--admin_user=$WP_USER_ADMIN --admin_password=$WP_USER_ADMIN_PWD \
				--admin_email=$WP_USER_ADMIN_MAIL --skip-email

	wp --allow-root user create $WP_USER_AUTHOR $WP_USER_AUTHOR_MAIL --user_pass=$WP_USER_AUTHOR_PWD --role=contributor

	# wp --allow-root theme install north-shore --activate
	wp --allow-root theme install lensation --activate
# rosa-lite
fi

php-fpm7 -F
