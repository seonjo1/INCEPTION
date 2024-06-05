service mariadb start

echo "CREATE DATABASE database;" > db.sql
echo "CREATE USER root@localhost IDENTIFIED BY 0000;" >> db.sql
echo "CREATE USER root@% IDENTIFIED BY 0000;" >> db.sql
echo "GRANT ALL PRIVILEGES ON database.* TO root@localhost;" >> db.sql
echo "FLUSH PRIVILEGES" >> db.sql

service mariadb stop

mysql -u root < db.sql

exec mysqld_safe