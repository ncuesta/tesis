$ curl https://packagecloud.io/gpg.key | sudo apt-key add -
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
$ sudo apt-get update
$ sudo apt-get install -y apt-transport-https
$ cd /etc/apt/sources.list.d/
$ echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee mongodb-org-3.0.list
$ echo "deb https://packagecloud.io/tyk/tyk-gateway/ubuntu/ trusty main" | sudo tee tyk_tyk-gateway.list
$ echo "deb-src https://packagecloud.io/tyk/tyk-gateway/ubuntu/ trusty main" | sudo tee -a tyk_tyk-gateway.list
$ echo "deb https://packagecloud.io/tyk/tyk-dashboard/ubuntu/ trusty main" | sudo tee tyk_tyk-dashboard.list
$ echo "deb-src https://packagecloud.io/tyk/tyk-dashboard/ubuntu/ trusty main" | sudo tee -a tyk_tyk-dashboard.list
$ sudo apt-get update