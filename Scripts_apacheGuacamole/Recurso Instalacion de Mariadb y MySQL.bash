Documentación
https://guacamole.apache.org/doc/gug/jdbc-auth.html
 
Instalación MySQL
 
dnf install https://repo.mysql.com/mysql80-community-release-el8.rpm
dnf install mysql-community-server
grep "A temporary password" /var/log/mysqld.log
msyql_secure_installation
 
mysql -u root -p
CREATE DATABASE guacdb;
GRANT ALL PRIVILEGES ON guacdb.* TO 'guacuser'@'localhost' IDENTIFIED BY 'guacpass' WITH GRANT OPTION;
FLUSH PRIVILEGES;
 
cat schema/*.sql | mysql -u root -p guacdb
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql
 
Este es el conector
wget https://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-8.0.30.tar.gz
 
Esta es opcional en caso de no haber compilado el guacamole client
wget https://downloads.apache.org/guacamole/1.5.3/binary/guacamole-auth-jdbc-1.5.3.tar.gz
 
cp guacamole-auth-jdbc-1.5.3.jar /etc/guacamole/extensions/
 
cp mysql-connector-java-8.0.30.jar /etc/guacamole/lib/  -> antes funcionaba con mariadb ahora, en caso de usar la version 11 de mariadb ya no les funcionara
 
En la Nueva versión de Mariadb 11 
Usando mariadb
 
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
yum install mariadb-server -y
mariadb-secure-installation
 
mariadb -u root -p -> versión 11
mysql -u root -p -> versión 10
CREATE DATABASE guacdb;
GRANT ALL PRIVILEGES ON guacdb.* TO 'guacuser'@'localhost' IDENTIFIED BY 'guacpass' WITH GRANT OPTION;
FLUSH PRIVILEGES;
 
cat schema/*.sql | mysql -u root -p guacdb
 
Este es el conector 
 wget https://downloads.mariadb.com/Connectors/java/connector-java-1.8.0/mariadb-java-client-1.8.0.jar
 
En caso de usar Mariadb en el Apache guacamole agregar esta opción en el guacamole.properties
mysql-ssl-mode: disabled