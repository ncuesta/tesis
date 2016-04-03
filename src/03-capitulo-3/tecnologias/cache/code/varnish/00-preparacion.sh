$ sudo apt-get install apt-transport-https
$ curl https://repo.varnish-cache.org/GPG-key.txt | sudo apt-key add -
$ sudo echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list
$ sudo apt-get update && sudo apt-get install varnish
