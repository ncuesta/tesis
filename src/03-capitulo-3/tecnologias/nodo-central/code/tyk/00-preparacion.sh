$ curl https://packagecloud.io/gpg.key | sudo apt-key add -
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
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
