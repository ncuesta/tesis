# 1. Estamos listos para instalar Tyk Gateway y tyk Dashboard, junto con sus principales dependencias: Redis y MongoDB. Para instalar todo ejecutamos el siguiten comando:
$ sudo apt-get install -y mongodb-org redis-server tyk-gateway tyk-dashboard

# 2. Configuración Tyk Gateway
$ sudo /opt/tyk-gateway/install/setup.sh --dashboard=1 --listenport=8080 --redishost=localhost --redisport=6379 --domain="" --mongo=mongodb://localhost/tyk_analytics

# 3. Configuración Tyk Dashboard
$ sudo /opt/tyk-dashboard/install/setup.sh --listenport=3000 --redishost=localhost --redisport=6379 --mongo=mongodb://localhost/tyk_analytics --tyk_api_hostname=$HOSTNAME --tyk_node_hostname=http://localhost --tyk_node_port=8080 --portal_root=/portal --domain="tesis.desarrollo.unlp.edu.ar"

# 4. Iniciar Tyk y Tyk dashboard:
$ sudo service tyk-gateway start
$ sudo service tyk-dashboard start
