#/bin/sh

if [ -d "/var/lib/mysql/$DB_NAME" ]; then
	echo "The DDB is already installed"
else
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --datadir=/var/lib/mysql > /dev/null

	cat << EOF > request.tmp
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';
FLUSH PRIVILEGES;

CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_USER_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

	mysqld --user=mysql --bootstrap < request.tmp
	rm -f request.tmp
fi

exec mysqld_safe --user=mysql --console


