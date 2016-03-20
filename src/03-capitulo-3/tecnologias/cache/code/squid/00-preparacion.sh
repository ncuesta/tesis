# Antes de comnenzar con la instación y configuración de Squid, debemos actualizar el software del servidor a su última versión

$ sudo apt-get update && sudo apt-get -y upgrade

# Una vez que hemos terminado la actulización del equipo, estamos en condiciones de iniciar la instalación de Squid.  Squid se encuentra disponible en los repositorios de Ubuntu, para instalarlo en el servidor debemos ejecutar el siguiente comando:

$ sudo apt-get install squid

# La configuración principal de Squid se encuentra en /etc/squid3/squid.conf.  Antes de realizar cualquier cambio en la configuración origincal, realizamos una copia del archivo.

$ sudo cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig

# Editamos la configuración

$ sudo nano /etc/squid3/squid.conf

# Lo primero que debemos configurar es el puerto en el que Squid estará escuchando las peticinas, por defecto, Squid escucha las peticioens en el puerto 3128.  Para cambiar el puerto por defecto, debemos editar la directiva http_port.  En nuestro caso particular, configuramos el puerto 8888.

$ http_port 8888

# Por defecto, el servidor proxy HTTP no permite el acceso a nadie.  Para permitir el acceso al servidor desde cualquier IP, debemos editar la directiva http_access de la siguiente manera:

$ http_access allow all

# Una vez que hemos realizado las configuraciones necesarias, debemos guardar los cambios y reiniciar el servicio de Squid, para que tome los cambios.  Para reiniciar el servio ejecutamos el siguiente comando:

$ sudo service squid3 restart

# Para verificar el funcionamiento del servidor proxy, configuramos manualmente los datos de nuestro proxy en el navegador, ingresando la IP del servidor proxy y el puerto anteriomente configurado
# En caso de que tengamos problemas, podemos ver log access.log para obtener mas información

$ sudo tail -f /var/log/squid3/access.log
