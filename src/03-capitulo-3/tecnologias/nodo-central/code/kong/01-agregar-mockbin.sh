# Damos de alta el servicio Mockbin en nuestra instancia de Kong
$ curl -i -X POST http://localhost:8001/apis/ \
       --data 'name=mockbin' \
       --data 'upstream_url=http://mockbin.com/' \
       --data 'request_host=mockbin.com'
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
...
Server: kong/0.5.3

{
  "upstream_url":"http:\/\/mockbin.com\/",
  "id":"c1550dc6-3482-4c8f-ccba-b978f81174ea",
  "name":"mockbin",
  ...
  "request_host":"mockbin.com"
}

# Probamos realizar un requerimiento a Mockbin a través de Kong
$ curl -i http://localhost:8000/ --header 'Host: mockbin.com'
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