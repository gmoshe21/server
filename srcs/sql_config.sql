/*DROP USER 'root'@'localhost';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON wp_database.* TO 'root'@'localhost';
CREATE DATABASE wp_database;
FLUSH PRIVILEGES;

UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root';*/

DROP USER 'root'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wp_database.* TO 'root'@'localhost';

CREATE DATABASE wp_database;

FLUSH PRIVILEGES;
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root'