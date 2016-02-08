# Bajar imagen del contenedor (sólo la primera vez)
$ docker pull nrel/api-umbrella
# Luego, en un directorio dedicado, crear el archivo de configuración para api umbrella
$ mkdir config
$ touch config/api-umbrella.yml
# Finalmente podemos ejecutar api umbrella usando docker
$ docker run -d -p 80:80 -p 443:443 \
             --name api-umbrella \
             -v $PWD/config:/etc/api-umbrella nrel/api-umbrella
