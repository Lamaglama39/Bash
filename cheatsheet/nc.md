## port scan

* scan to 80 port
```
nc -vz 192.168.1.10 80
```

* scan to 80-90 port
```
nc -vz 192.168.1.10 80-90
```

## http server

* simple
```
{ echo 'HTTP/1.1 200 OK'; echo; echo 'Hello World!'; } | nc -l 8080
```
```
curl http://localhost:8080
```

* loop
```
while true
do
  echo -e "HTTP/1.1 200 OK\r\n\r\nHello World!" | nc -l 8080
done
```
```
curl http://localhost:8080
```


## simple chat

```
nc -lk 8080
```
```
nc 8080
```
