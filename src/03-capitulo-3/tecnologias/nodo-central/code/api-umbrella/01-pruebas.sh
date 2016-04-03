# Primero probamos realizar una petición que no tenga una clave válida para
# corroborar que efectivamente falle
$ curl -i -k -G https://localhost/google/maps/api/geocode/json --data "address=La+Plata,+AR"
HTTP/1.1 403 Forbidden
Server: openresty
Content-Type: application/json
...
X-Cache: MISS

{
  "error": {
    "code": "API_KEY_MISSING",
    "message": "No api_key was supplied. Get one at https://localhost"
  }
}

# Luego, intentamos con la clave que obtuvimos mediante la interfaz web
$ curl -i -k -G https://localhost/google/maps/api/geocode/json --data "address=La+Plata,+AR" --data "api_key=6dn6iL7xTuR1bvSWdRccpP7DCFp5X2OnhdYZzkrI"
HTTP/1.1 200 OK
Server: openresty
Content-Type: application/json; charset=UTF-8
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 996
Expires: Wed, 20 Jan 2016 15:56:56 GMT
Cache-Control: public, max-age=86400
Age: 201
Via: http/1.1 api-umbrella (ApacheTrafficServer [cRs f ])
...
X-Cache: HIT

{
  "results" : [ ... ]
}
