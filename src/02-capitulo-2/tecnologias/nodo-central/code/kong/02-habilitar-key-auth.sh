# Habilitar el plugin key-auth para Mockbin
$ curl -i -X POST http://localhost:8001/apis/mockbin/plugins/ \
       --data 'name=key-auth'
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
...
Server: kong/0.5.3

{
  "api_id":"c1550dc6-3482-4c8f-ccba-b978f81174ea",
  "id":"b68a61e8-0aa4-422b-c208-cf1a29032881",
  "enabled":true,
  "name":"key-auth",
  ...
}

# Probar que la autenticación funcione, un requerimiento
# sin clave no debería ser permitido:
$ curl -i http://localhost:8000/ --header 'Host: mockbin.com'
HTTP/1.1 401 Unauthorized
Content-Type: application/json; charset=utf-8
...
WWW-Authenticate: Key realm="kong"
Server: kong/0.5.3

{"message":"No API Key found in headers, body or querystring"}

# El paso siguiente es agregar un consumer (cliente) y asignarle
# una clave propia para identificarse ("t3st-K3Y"):
$ curl -i -X POST http://localhost:8001/consumers/ \
       --data "username=test_user"
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
...
Server: kong/0.5.3

{
  "username":"test_user",
  ...
  "id":"128a20ce-de29-4d11-cd51-ab005a137667"
}

$ curl -i -X POST http://localhost:8001/consumers/test_user/key-auth/ \
       --data 'key=t3st-K3Y'
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
...
Server: kong/0.5.3

{
  "consumer_id":"128a20ce-de29-4d11-cd51-ab005a137667",
  "key":"t3st-K3Y",
  ...
  "id":"27a02bbe-4a4c-4fd9-cfca-758acad7a724"
}

# Y finalmente, probar el requerimiento realizado anteriormente ahora
# utilizando la clave asignada al consumer creado:
$ curl -i http://localhost:8000 \
  --header "Host: mockbin.com" \
  --header "apikey: t3st-K3Y"
HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8
...
Via: kong/0.5.3

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Mockbin by Mashape</title>
  ...
</html>
