# Habilitar el plugin key-auth para Mockbin
$ curl -i -X POST http://localhost:8001/apis/mockbin/plugins/ --data 'name=key-auth'
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
