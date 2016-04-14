$ curl -i http://localhost:8000 --header "Host: mockbin.com" --header "apikey: t3st-K3Y"
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