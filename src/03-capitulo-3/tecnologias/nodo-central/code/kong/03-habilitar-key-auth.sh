# Agregamos un consumer y le asignamos una clave propia ("t3st-K3Y")
$ curl -i -X POST http://localhost:8001/consumers/ --data "username=test_user"
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
...
Server: kong/0.5.3
{
  "username":"test_user",
  ...
  "id":"128a20ce-de29-4d11-cd51-ab005a137667"
}

$ curl -i -X POST http://localhost:8001/consumers/test_user/key-auth/ --data 'key=t3st-K3Y'
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