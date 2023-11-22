MVN

Para construir los binarios es necesario usar una versión menor de JAVA, 16: https://jdk.java.net/archive



Liga de Maven:

https://maven.apache.org/download.cgi



wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz

tar -xvzf apache-maven-3.8.6-bin.tar.gz

mv apache-maven-3.8.6 /opt/apache-maven

sudo tee /etc/profile.d/mvn.sh <<EOF

export M2_HOME=/opt/apache-maven

export PATH=\$PATH:\$M2_HOME/bin

EOF

source /etc/profile.d/mvn.sh

APACHE CLIENT



https://guacamole.apache.org/releases/1.5.2/

wget https://dlcdn.apache.org/guacamole/1.5.2/source/guacamole-client-1.4.0.tar.gz

tar -xvzf guacamole-client-1.5.2.tar.gz

cd guacamole-client-1.5.2

mvn package

mvn --version

Creación de directorios



mkdir -p /etc/guacamole/{extensions,lib}

mkdir -p /opt/tomcat/apache-tomcat/.guacamole

ln -s /etc/guacamole/guacamole.war /opt/tomcat/apache-tomcat/webapps

ln -s /etc/guacamole /opt/tomcat/apache-tomcat/.guacamole