#!/bin/sh
# mysqld_safe &
service mariadb start 


# while ! mysqladmin ping --silent; do
#     sleep 1
# done
sleep 2
# CREAT WORDPRESS DATABASE #

echo "CREATE DATABASE IF NOT EXISTS $BDD_NAME;" | mysql
# CREATE USER #
echo "CREATE USER IF NOT EXISTS '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql

# PRIVILGES FOR ROOT AND USER FOR ALL IP ADRESS #
echo "GRANT ALL PRIVILEGES ON *.* TO '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$BDD_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$BDD_ROOT_PASSWORD';" | mysql
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
