Método 1  con XML

Documentacion: https://guacamole.apache.org/doc/gug/configuring-guacamole.html?highlight=xml#user-mapping-xml

user-mapping:   /etc/guacamole/user-mapping.xml


Crear la contraseña usando MD5
echo -n guacadmin | openssl md5
(stdin)= 5cbd438413e8e3ca0e14e200fde621a9

nano /etc/guacamole/user-mapping.xml

Ejemplo:

<user-mapping>
    <authorize
            username="guacadmin"
            password="5cbd438413e8e3ca0e14e200fde621a9"
            encoding="md5">

        <connection name="Alma Linux Guacd">
            <protocol>ssh</protocol>
            <param name="hostname">172.17.30.176</param>
            <param name="port">22</param>
            <param name="username">root</param>
            <param name="password">abc123.</param>
            
        </connection>
        <connection name="Windows Server">
            <protocol>rdp</protocol>
            <param name="hostname">172.17.30.83</param>
            <param name="port">3389</param>
		<param name="security">nla</param>
		<param name="ignore-cert">true</param>
        </connection>
    </authorize>
</user-mapping>