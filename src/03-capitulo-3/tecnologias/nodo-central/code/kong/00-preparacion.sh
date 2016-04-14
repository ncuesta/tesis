# Bajar imágenes de los contenedores (sólo la primera vez)
$ docker pull mashape/cassandra
$ docker pull mashape/kong
# Iniciar contenedores (Cassandra y Kong)
$ docker run -p 9042:9042 -d \
             --name cassandra mashape/cassandra
$ docker run -p 8000:8000 -p 8001:8001 -d \
             --name kong \
             --link cassandra:cassandra mashape/kong
# Probar con un requerimiento si está funcionando
$ curl http://127.0.0.1:8001
{
  "version":"0.5.3",
  "lua_version":"LuaJIT 2.1.0-alpha",
  "tagline":"Welcome to Kong",
  "hostname":"0b53705aaef9",
  ...
}