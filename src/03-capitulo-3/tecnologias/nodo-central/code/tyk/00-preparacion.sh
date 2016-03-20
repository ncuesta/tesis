# 1. Configurar repositorios APT:

$ curl https://packagecloud.io/gpg.key | sudo apt-key add -

$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Actulizamos la lista de paquetes:

$ sudo apt-get update

# Nos aseguramos de tener soporte para acceder a respositorios por https:

$ sudo apt-get install -y apt-transport-https

# Ahora agregamos los repositorios necesarios y actualizamos nuevamente la lista de paquetes:

$ echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

$ echo "deb https://packagecloud.io/tyk/tyk-gateway/ubuntu/ trusty main" | sudo tee /etc/apt/sources.list.d/tyk_tyk-gateway.list

$ echo "deb-src https://packagecloud.io/tyk/tyk-gateway/ubuntu/ trusty main" | sudo tee -a /etc/apt/sources.list.d/tyk_tyk-gateway.list

$ echo "deb https://packagecloud.io/tyk/tyk-dashboard/ubuntu/ trusty main" | sudo tee /etc/apt/sources.list.d/tyk_tyk-dashboard.list

$ echo "deb-src https://packagecloud.io/tyk/tyk-dashboard/ubuntu/ trusty main" | sudo tee -a /etc/apt/sources.list.d/tyk_tyk-dashboard.list

$ sudo apt-get update

# 2. Instalación Tyk stack:
# Estamos listos para instalar Tyk Gateway y tyk Dashboard, junto con sus principales dependencias: Redis y MongoDB. Para instalar todo ejecutamos el siguiten comando:

$ sudo apt-get install -y mongodb-org redis-server tyk-gateway tyk-dashboard

# 3. Configuración Tyk Gateway

$ sudo /opt/tyk-gateway/install/setup.sh --dashboard=1 --listenport=8080 --redishost=localhost --redisport=6379 --domain="" --mongo=mongodb://localhost/tyk_analytics

# 4. Configuración Tyk Dashboard

$ sudo /opt/tyk-dashboard/install/setup.sh --listenport=3000 --redishost=localhost --redisport=6379 --mongo=mongodb://localhost/tyk_analytics --tyk_api_hostname=$HOSTNAME --tyk_node_hostname=http://localhost --tyk_node_port=8080 --portal_root=/portal --domain="tesis.desarrollo.unlp.edu.ar"

# 5. Iniciar Tyk y Tyk dashboard:

$ sudo service tyk-gateway start
$ sudo service tyk-dashboard start
