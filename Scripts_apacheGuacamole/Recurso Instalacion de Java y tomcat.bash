JAVA



https://jdk.java.net/archive/



wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
tar -xvzf openjdk-17.0.2_linux-x64_bin.tar.gz
mv jdk-17.0.2/ /opt/jdk
 
sudo tee /etc/profile.d/jdk.sh <<EOF
export JAVA_HOME=/opt/jdk
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
 
source /etc/profile.d/jdk.sh
java --version


TOMCAT



https://tomcat.apache.org/download-90.cgi





useradd -r -d /opt/tomcat -s /sbin/nologin tomcat
mkdir /opt/tomcat wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.8.tar.gz
 
tar -xvzf apache-tomcat-9.0.8.tar.gz
mv apache-tomcat-9.0.68 /opt/tomcat/apache-tomcat
 
chmod a+x /opt/tomcat/apache-tomcat/bin/*.sh
chown -R tomcat: /opt/tomcat
 
vim /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat 9 servlet container
After=network.target
 
[Service]
Type=forking
 
User=tomcat
Group=tomcat
 
Environment="JAVA_HOME=/opt/jdk"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"
 
Environment="CATALINA_BASE=/opt/tomcat/apache-tomcat"
Environment="CATALINA_HOME=/opt/tomcat/apache-tomcat"
Environment="CATALINA_PID=/opt/tomcat/apache-tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
 
ExecStart=/opt/tomcat/apache-tomcat/bin/startup.sh
ExecStop=/opt/tomcat/apache-tomcat/bin/shutdown.sh
 
[Install]
WantedBy=multi-user.target
