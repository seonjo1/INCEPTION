service mariadb start

echo "CREATE DATABASE $DB_NAME;" > db.sql
echo "CREATE USER $DB_USER@localhost IDENTIFIED BY $DB_PASS;" >> db.sql
echo "CREATE USER $DB_USER@% IDENTIFIED BY $DB_PASS;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@%;" >> db.sql
echo "FLUSH PRIVILEGES" >> db.sql

mysql -u root < db.sql

service mariadb stop

exec mysqld_safe