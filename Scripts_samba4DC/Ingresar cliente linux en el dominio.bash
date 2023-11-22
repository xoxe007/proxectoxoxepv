#1º Etapa - instalar dependencias:

apt-get install realmd sssd sssd-tools libnss-sss libpam-sss adcli samba-common-bin -y

#2º Etapa - editar archivo /etc/nsswitch.conf e substituir la linea:

hosts: files mdns4_minimal [NOTFOUND=return] dns

#por

hosts: files dns

#3º Etapa - Ingresar en el domínio

realm join empresa.local --user=administrator --client-software=sssd --os-name="zorin Desktop"--os-version="18.04" -v

#4º Etapa - Editar archivo /etc/sssd/sssd.conf y incluir en el final del archivo la linea

override_homedir=/home/%d/%u

#5º Etapa - Salvar los cambios y reiniciar reiniciar o sssd.service

systemctl restart sssd.service

#6º - Modificar archivo que contola el boot lightdm

/usr/share/lightdm/lightdm.conf.d/50-ubuntu-mate.conf, incluyendo las  sigientes lineas:

greeter-show-manual-login=true
greeter-hide-users=true

#En otras versiones de Ubuntu es necesario cambiar el archivo de configuración del administrador de inicio de sesión correspondiente, la versión principal de Ubuntu Desktop usa GDM, por lo que es necesario cambiar el archivo de configuración de GDM para tener los mismos resultados.

#7º - Reiniciar ordenador:
